# Medusa Headless Commerce on AWS Fargate with Terraform & GitHub Actions 

About Me
Hi, I'm Kavya — a DevOps enthusiast who built a full IaC + CD solution deploying Medusa's headless commerce backend on AWS ECS Fargate, with automated workflows via GitHub Actions.

 Project Highlights
- Infrastructure as Code (Terraform): VPC, ECS cluster, Fargate service, ALB, ECR
- CI/CD Pipeline: GitHub Actions builds Docker image, pushes to ECR, and updates service
- End-to-End Deployment: On every `git push`, a new version of Medusa spins up automatically
- Live Output: See Medusa backend running and responding

---
 Live Demo & Final Video
- **Video Demo**: https://oorwinsp-my.sharepoint.com/:v:/g/personal/kummari_kavya_oorwin_com/Eb3MteKs5otGnejv12C0QAkBcCAm8DH8-eFnd64BVY-LDw?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D&e=6ifMRv 

---. Installed Prerequisites
You set up the basic tools required:

Installed Terraform, AWS CLI, Docker, Git

Faced issues installing Node.js and npm, resolved manually

two instances one is meduas-backend 
second one is medues-frontend ---used for dashborads

2. Cloned/Started the Project Repo
Created a new GitHub repository

Initialized the project folder with Terraform and CI/CD structure

Structure:

bash
Copy
Edit
.
├── terraform/
├── .github/workflows/
├── Dockerfile
└── README.md
3. Wrote Terraform Configuration
Inside the terraform/ directory:

a. main.tf – Created:
VPC, subnets, internet gateway

ECS cluster and Fargate service

Application Load Balancer (ALB)

ECR repo

Security groups for ECS & ALB

b. variables.tf – Used for:
Region, VPC CIDR, image name, etc.

c. outputs.tf – Output alb_url after deployment
4. Built Docker Image for Medusa
Created a Dockerfile:

dockerfile
Copy
Edit
FROM node:lts
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 9000
CMD ["npm", "start"]
This image was intended to be pushed to Amazon ECR

 5. Set Up GitHub Actions CI/CD Pipeline
Created .github/workflows/deploy.yml to:

Checkout repo

Log in to AWS + ECR

You added GitHub Secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

AWS_REGION

 6. Terraform Apply
Locally:

cd terraform
terraform init
terraform apply -auto-approve
 This created your ECS cluster, ECR repo, and ALB

 7. Encountered Issues
GitHub Actions failed to fully push or deploy due to AWS permission/image push errors

npm/node setup gave errors but was partially resolved

Medusa API didn’t give a complete response on ALB

Still, ECS + ALB were created correctly ✅

Setup Guide

### 1. AWS Setup
Create AWS resources (ECR repo, IAM user) and set these GitHub secrets:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`

### 2. Terraform Deployment
```bash
cd terraform
terraform init
terraform apply -auto-approve
###docker deployment
doker-ps
docker-built
docker deployed :<img width="1888" height="1147" alt="image" src="https://github.com/user-attachments/assets/9420ff17-5fd2-4abb-b360-dd4852f65c45" />


uploaded docker image in ecr
<img width="1919" height="965" alt="image" src="https://github.com/user-attachments/assets/89413b47-904c-49c8-b1dc-5279a747830c" />


used  necessary files and extensions
ecs <img width="1724" height="740" alt="image" src="https://github.com/user-attachments/assets/3448aca4-fd7e-4a3d-a084-36922d8f6107" />
<img width="924" height="608" alt="image" src="https://github.com/user-attachments/assets/440ad141-5f35-420f-9a38-4c5d84d2b4d3" />
![Uploading image.png…]()

