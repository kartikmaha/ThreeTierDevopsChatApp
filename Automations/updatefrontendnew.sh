#!/bin/bash

# --- 1. Configuration ---
INSTANCE_ID="i-0a52f3855167df474"
REPO_DIR="/projects/ThreeTierDevopsChatApp"
ENV_FILE="${REPO_DIR}/frontend/.env.docker"
IMAGE_NAME="chat-frontend"
CONTAINER_NAME="chat-frontend-container"
NETWORK_NAME="chat-network"

echo "🌐 Fetching current AWS Public IP for Backend Sync..."
# Retrieve the public IP address
ipv4_address=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

if [ -z "$ipv4_address" ] || [ "$ipv4_address" == "None" ]; then
    echo "❌ ERROR: Could not retrieve IP. Check AWS CLI permissions."
    exit 1
fi

echo "📍 Current IP identified: ${ipv4_address}"

# --- 2. Update .env.docker ---
if [ -f "$ENV_FILE" ]; then
    echo "📝 Updating API URL in ${ENV_FILE}..."
    # We update the Backend API URL so the Frontend knows where to send requests
    sed -i "s|^REACT_APP_API_URL=.*|REACT_APP_API_URL=\"http://${ipv4_address}:5000/api\"|g" "$ENV_FILE"
    # If you use Vite, uncomment the line below:
    # sed -i "s|^VITE_API_URL=.*|VITE_API_URL=\"http://${ipv4_address}:5000/api\"|g" "$ENV_FILE"
else
    echo "⚠️ Warning: ${ENV_FILE} not found. Creating a default one..."
    echo "REACT_APP_API_URL=\"http://${ipv4_address}:5000/api\"" > "$ENV_FILE"
fi
