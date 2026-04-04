
Three-Tier Cloud-Native Chat Application

A production-ready CI/CD implementation of a three-tier web application. This project demonstrates full-stack automation, from infrastructure provisioning to container orchestration and continuous delivery.

🏗️ Architecture Overview

The application follows a standard Three-Tier architecture:

    Frontend: React.js (Client interface)

    Backend: Node.js / Express (API & Logic)

    Database: MongoDB (Data Persistence)

🛠️ Technical Stack

    Cloud: AWS (EC2, VPC, IAM)

    Containerization: Docker & Docker Hub

    Orchestration: Kubernetes (EKS / Self-managed)

    CI/CD Pipeline: Jenkins & ArgoCD (GitOps)

    Infrastructure as Code: Terraform

    DevSecOps: SonarQube (SAST - Static Application Security Testing) , 
               OWASP Dependency-Check (SCA - Software Composition Analysis),
               Trivy (Filesystem Scan)

    Monitoring: Prometheus & Grafana

🚀 Key Features

    End-to-End Automation: Fully automated CI/CD pipeline that triggers on code commit.

    Infrastructure as Code: Modular Terraform scripts for reproducible environment setup.

    GitOps Workflow: Uses ArgoCD for declarative, automated synchronization of Kubernetes manifests.

    Security Integration: Static Application Security Testing (SAST) and vulnerability scanning integrated into the build process.

    Scalability: Horizontal scaling of application components via Kubernetes deployments.

📈 Pipeline Workflow

    Code Analysis: SonarQube for code quality and bug detection.

    Vulnerability Scan: OWASP scans for third-party library vulnerabilities.

    Build & Package: Docker image creation and push to registry.

    Continuous Deployment: ArgoCD detects changes in the Git repository and updates the Kubernetes cluster state.

    
