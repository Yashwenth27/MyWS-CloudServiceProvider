# ☁️ MyWS-CloudServiceProvider

## A Single-Node Comprehensive Cloud Service Provider

This project simulates the core management and service layers of a public cloud provider (like AWS or Azure) using open-source tools deployed on a single Windows 11 host with WSL 2 and Docker. This environment demonstrates hands-on experience with Identity (IAM), Object Storage (S3), and Infrastructure-as-a-Service (IaaS) orchestration.

## 🛠️ Technology Stack

| Category | Component | Role in the Project |
| :--- | :--- | :--- |
| **Host** | Windows 11 / WSL 2 | Base OS and Linux kernel environment |
| **Management** | **Cockpit** | Centralized web console for monitoring and terminal access (Orchestration Hub) |
| **Containerization** | Docker Compose | Deploying services (Keycloak, MinIO) as isolated containers |
| **IaaS** | Multipass / Bash Scripting | On-demand provisioning and lifecycle management of Virtual Machines (VMs) |
| **Security** | Keycloak | **IAM Service** - Handles user authentication and Role-Based Access Control (RBAC) |
| **Storage** | MinIO | **S3-Compatible Storage** - Provides scalable object storage buckets |

## 📐 Architecture Diagram

This diagram illustrates the separation of concerns, showing the host, the virtualization layer (WSL2), and the services managed by the centralized Cockpit console.

![Architecture Diagram: Windows 11 Host, WSL 2, Docker, Keycloak, MinIO, Multipass, and Cockpit for centralized management.](assets/architecture-diagram.png)

## 🎯 Key CSP Features Implemented

The project successfully demonstrates the following cloud computing pillars:

1.  **Identity & Access Management (IAM):** Keycloak was configured to create the `CloudProject` realm, establishing **Role-Based Access Control (RBAC)** by assigning the `Storage_Admin` and `Compute_User` roles to separate users.
2.  **Object Storage (S3):** MinIO was deployed as an S3-compatible service, featuring segregated `private-analytics` and `public-web-assets` buckets accessible via a dedicated web console.
3.  **Centralized Orchestration:** **Cockpit** was utilized as the single web-based management interface for executing all control plane commands and monitoring the underlying services.
4.  **Rapid Elasticity (IaaS):** An **Infrastructure as Code (IaC)** Bash script (`provision_and_destroy.sh`) was developed to automatically **scale compute** (provision three VMs) and **scale down** (destroy the VMs) with a single command, showcasing automated lifecycle management.

## 📸 Project Screenshots



* **1. Cockpit Terminal Orchestration:** Proof of running the IaC script from the central console.
* **2. IAM Service Configuration:** Proof of users and roles defined in Keycloak.
* **3. S3 Bucket Management:** Proof of public/private buckets and uploaded data in MinIO.

## 🚀 Getting Started (Deployment Instructions)

1.  **Prerequisites:** Install [WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install) (Ubuntu), [Docker Desktop](https://www.docker.com/products/docker-desktop/), and [Multipass](https://multipass.run/).
2.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/Yashwenth27/MyWS-CloudServiceProvider](https://github.com/Yashwenth27/MyWS-CloudServiceProvider)
    cd MyWS-CloudServiceProvider
    ```
3.  **Launch Services:**
    ```bash
    docker-compose up -d # Launches Keycloak (IAM) and MinIO (S3)
    ```
4.  **Access Consoles:**
    * **IAM (Keycloak Admin):** `http://localhost:8080` (U: `adminuser`, P: `CloudPassword123!`)
    * **S3 (MinIO Console):** `http://localhost:9001` (U: `minioadmin`, P: `MinioPassword123!`)
    * **Orchestration (Cockpit):** `https://<WSL2_IP>:9090`
5.  **Run Elasticity Demo (IaC):**
    ```bash
    chmod +x provision_and_destroy.sh
    ./provision_and_destroy.sh # Provisions 3 VMs and destroys them
    ```
