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
- **Application URL**: `https://<YOUR_ALB_ENDPOINT>`
- **Video Demo**: [YouTube - Demo with face overlay](https://youtu.be/YOUR_VIDEO_ID)

---

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
![Uploading image.png…]()

