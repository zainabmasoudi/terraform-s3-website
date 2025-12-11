# AWS S3 Static Website Hosting with Terraform + CI/CD Pipeline

This project demonstrates how to deploy and host a static website on **AWS S3** using **Terraform**, with an optional **CI/CD pipeline** powered by **AWS CodeBuild** and **GitHub Webhooks**.

The infrastructure is fully automated using Infrastructure as Code (IaC), and every commit pushed to GitHub can automatically trigger a pipeline that rebuilds and deploys the website to S3.

---

## Features

###  Core Infrastructure (Terraform)
- Infrastructure as Code using **Terraform**
- AWS S3 bucket for static website hosting  
- Public read access using ACLs  
- Website hosting enabled (index + error pages)  
- Automatic upload of `index.html` and `error.html`
- S3 bucket versioning enabled  
- Server-side encryption (AES-256)  
- Lifecycle rule to delete old versions  
- Clean, reproducible deployment

### CI/CD Pipeline (Optional)
- Automated build and deployment using **AWS CodeBuild**
- Build triggers from GitHub commits (webhooks)
- Pipeline pulls latest code → validates → deploys to S3
- No manual upload required after the pipeline is configured
- IAM role automatically created for CodeBuild
- Supports both manual and automated deployments

###  Portfolio-Ready Project
This project is suitable for showcasing in your cloud/DevOps portfolio:

- Shows IaC skills  
- Demonstrates S3 hosting + security best practices  
- Uses CI/CD automation  
- Includes real GitHub integration  
- Clean and professional architecture  

---

## Architecture

┌─────────────────────────┐
│ GitHub Repo │
│ (HTML + Terraform) │
└─────────────┬───────────┘
│ Webhook
▼
┌─────────────────────────┐
│ AWS CodeBuild (CI) │
│ - Pull latest code │
│ - Run terraform commands │
│ - Deploy to S3 │
└─────────────┬───────────┘
│
▼
┌─────────────────────────┐
│ AWS S3 Bucket │
│ Static Website Hosting │
│ - index.html │
│ - error.html │
└─────────────┬───────────┘
│
▼
┌─────────────────────────────┐
│ Public Static Website URL │
└─────────────────────────────┘

---

## Project Structure

/S3website
│── main.tf # S3 bucket + ACL + hosting config + object upload
│── provider.tf # AWS provider & region
│── variables.tf # Variables (bucket name, tags, etc.)
│── outputs.tf # Website endpoint + bucket ARN
│── index.html # Main website
│── error.html # 404/error page
│── README.md # Documentation
│── .gitignore # Ensures no .tfstate files are committed


---

##  Terraform Commands

### Initialize providers

terraform init


### Preview changes


terraform plan


### Deploy infrastructure


terraform apply


### Destroy resources

---

## Static Website URL

http://s3-bucket-expriment.s3-website-eu-west-1.amazonaws.com


---

##  Security Notes

- `.tfstate` is excluded from GitHub for security  
- No AWS credentials stored in the repository  
- S3 bucket uses encryption & versioning  
- IAM least-privilege policies applied  

---

##  Author

**Zainab Masoudi**  
Cloud Computing Specialist | Terraform | AWS | CI/CD | Kubernetes

---