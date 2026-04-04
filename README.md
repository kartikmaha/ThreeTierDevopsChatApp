
Three-Tier Cloud-Native Chat Application

A production-ready CI/CD implementation of a three-tier web application. This project demonstrates full-stack automation, from infrastructure provisioning to container orchestration and continuous delivery.

🏗️ Architecture Overview

The application follows a standard Three-Tier architecture:

    Frontend (React): Delivers responsive UI and interacts with backend via REST APIs and WebSockets for real-time updates.
    
    Backend (Node.js): Handles business logic, authentication, and enables real-time messaging with bi-directional communication.
    
    Database (MongoDB): Persists user data and chat messages with efficient CRUD operations.
    
🛠️ Technical Stack

    Cloud: AWS

    Containerization: Docker & Docker Hub

    Orchestration: Kubernetes

    CI/CD Pipeline: Jenkins & ArgoCD (GitOps)

    Infrastructure as Code: Terraform

    DevSecOps: SonarQube (SAST - Static Application Security Testing) , 
               OWASP Dependency-Check (SCA - Software Composition Analysis),
               Trivy (Filesystem Scan)

    Monitoring: Prometheus & Grafana

🚀 Key Features

    End-to-End Automation: Jenkins controlled CI/CD pipeline 
    
    Infrastructure as Code: Modular Terraform scripts for reproducible environment setup.

    GitOps Workflow: Uses ArgoCD for declarative, automated synchronization of Kubernetes manifests.

    Security Integration: Static Application Security Testing (SAST) and vulnerability scanning integrated into the build process.

    Scalability: Horizontal scaling of application components via Kubernetes deployments.

📈 Pipeline Workflow

    🔹 1. Code Commit & Trigger
        Developer pushes code to GitHub
        Jenkins CI pipeline is automatically triggered

    🔹 2. CI Stage – Quality & Security Checks
        Trivy → Performs filesystem vulnerability scan
        OWASP Dependency Check → Identifies vulnerable libraries
        SonarQube → Runs code quality & static analysis

    🔹 3. Build & Package
        Jenkins builds a Docker image
        Image is pushed to Docker Registry

    🔹 4. CD Trigger
        After successful CI, Jenkins triggers CD pipeline
        Updates the Docker image version in GitHub manifests

    🔹 5. GitOps Deployment (ArgoCD)
        ArgoCD detects changes in GitHub repo
        Automatically syncs and deploys to Kubernetes cluster
        
    🔹 6. Application Deployment
        Kubernetes pulls latest image and deploys application
        Enables scalable and self-healing workloads

    🔹 7. Monitoring & Alerts
        Prometheus + Grafana monitor application & cluster health
        Alerts/notifications sent via Gmail

    
