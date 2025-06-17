# 📚 Bookstore Manager - DevOps Project

A complete DevOps implementation of a Ruby on Rails Bookstore Manager application using:

- 🐳 Docker & Docker Compose
- ☸️ Kubernetes (with StatefulSet, Ingress)
- 🚀 ArgoCD for GitOps
- ⚙️ Tekton Pipelines for CI/CD

---

## 🛠 Project Structure

bookstore-manager/
├── docker/
│ ├── Dockerfile
│ └── docker-compose.yml
├── kubernetes/
│ ├── bookstore-deployment.yaml
│ ├── bookstore-postgres.yaml
│ ├── bookstore-service.yaml
│ └── ingress.yaml
├── argocd/
│ ├── application.yaml
│ └── argocd-cm.yaml
├── tekton/
│ └── pipeline.yaml
└── README.md

yaml

---

## 🐳 Step 1: Docker + Docker Compose

1. **Dockerfile** builds the Rails app.
2. **PostgreSQL** runs in a separate container.

### ▶️ Run locally

```bash

docker-compose up --build

App runs at: http://localhost:3000

☸️ Step 2: Kubernetes Deployment

🧱 Components

Rails App: Deployed via Deployment + Service

PostgreSQL: Managed using StatefulSet

Ingress: Configured for domain access (e.g., bookstore.local)

▶️ Apply all K8s manifests

kubectl apply -f kubernetes/
Make sure to update your /etc/hosts:

127.0.0.1 bookstore.local

🚀 Step 3: ArgoCD GitOps

Create a private GitHub repo and push all your kubernetes/ and argocd/ files.

Deploy ArgoCD to your cluster.

Apply application.yaml and argocd-cm.yaml.

▶️ Connect your repo:

kubectl apply -f argocd/

Then access ArgoCD UI and watch your app auto-deploy.

⚙️ Step 4: Tekton Pipeline

Installs Tekton Pipelines + Dashboard.

Pipeline uses git-clone and kaniko to:

Clone the source code

Build the image

Push it to Docker Hub

▶️ Run manually
Install git-clone and kaniko tasks from Tekton Hub.

Apply your pipeline:

kubectl apply -f tekton/pipeline.yaml

Open Tekton Dashboard and trigger the pipeline.

🔐 Notes
Replace placeholders like:

your-dockerhub-username

your-username/your-repo.git

<YOUR_PERSONAL_ACCESS_TOKEN>

Make sure ArgoCD has access to your private repo.

📄 License
MIT License © 2025 Nayak (Gugulothu Jagadish)
