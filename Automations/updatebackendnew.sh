#!/bin/bash

# --- 1. Configuration ---
INSTANCE_ID="i-0a52f3855167df474"
REPO_DIR="/projects/ThreeTierDevopsChatApp"
ENV_FILE="${REPO_DIR}/backend/.env.docker"
IMAGE_NAME="chat-backend"
CONTAINER_NAME="chat-backend-container"
NETWORK_NAME="chat-network"

echo "🌐 Fetching current AWS Public IP..."
# Retrieve the public IP address
ipv4_address=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

if [ -z "$ipv4_address" ] || [ "$ipv4_address" == "None" ]; then
    echo "❌ ERROR: Could not retrieve IP. Check AWS CLI permissions."
    exit 1
fi

echo "📍 Current IP identified: ${ipv4_address}"

# --- 2. Update .env.docker ---
if [ -f "$ENV_FILE" ]; then
    echo "📝 Updating FRONTEND_URL in ${ENV_FILE}..."
    # Using '|' as a delimiter in sed to avoid escaping slashes in the URL
    sed -i "s|^FRONTEND_URL=.*|FRONTEND_URL=\"http://${ipv4_address}:5173\"|g" "$ENV_FILE"
else
    echo "⚠️ Warning: ${ENV_FILE} not found. Creating a default one..."
    echo "FRONTEND_URL=\"http://${ipv4_address}:5173\"" > "$ENV_FILE"
fi
