# 🚀 AWS S3 Static Website Hosting with Terraform

This project demonstrates how to deploy and host a static website on **AWS S3** using **Terraform**.  
It provisions an S3 bucket, configures public read access, uploads website files, and enables S3 website hosting.

---

## Features

- Infrastructure as Code (IaC) using Terraform  
- AWS S3 bucket creation  
- Public read access using ACLs  
- S3 website hosting enabled (index + error pages)  
- Automatic upload of HTML files to the bucket  
- Fully reproducible deployment  

---

## Architecture

```
┌─────────────────────────┐
│     Terraform IaC       │
└─────────────┬───────────┘
              │
              ▼
┌─────────────────────────┐
│    AWS S3 Bucket        │
│  - Public Read Enabled  │
│  - index.html           │
│  - error.html           │
└─────────────┬───────────┘
              │
              ▼
┌─────────────────────────┐
│  S3 Static Website URL  │
│  (HTTP Public Endpoint) │
└─────────────────────────┘
```

---

## Project Structure

```
/S3website
│── main.tf              # S3 bucket + ACL + hosting config
│── provider.tf          # AWS provider & region
│── variables.tf         # Variables (e.g., bucket name)
│── index.html           # Main website page
│── error.html           # Error page
│── .gitignore           # Prevents committing .tfstate files (sensitive)
│── README.md            # Documentation
```

---

## Terraform Commands

### Initialize
```
terraform init
```

### Plan
```
terraform plan
```

### Apply (deploy)
```
terraform apply
```

### Destroy (optional)
```
terraform destroy
```

---

## 🌐 Website URL

```
http://s3-backet-expriment.s3-website-eu-west-1.amazonaws.com/
```

---

## Security Notes

- `.tfstate` files are excluded using `.gitignore`
- No AWS credentials are stored in this repository  
- Safe for public GitHub hosting  

---

## Author

**Zainab Masoudi**  
Cloud Computing Specialist | Terraform | AWS | Kubernetes
