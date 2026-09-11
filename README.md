# AWS EC2 Nginx Website Deployment with GitHub Actions

## Project Overview

This project demonstrates how to deploy a static website to an Amazon EC2 instance running Nginx using GitHub Actions for automated CI/CD.

Whenever changes are pushed to the `main` branch, GitHub Actions connects to the EC2 instance through SSH, pulls the latest code, and runs the deployment script to update the Nginx website.

## Architecture

```text
Developer
   │
   │ git push
   ▼
GitHub Repository
   │
   │ GitHub Actions
   ▼
EC2 Instance
   │
   │ git pull
   ▼
deploy.sh
   │
   │ copy website files
   ▼
Nginx
   │
   ▼
Web Browser
```

## Technologies Used

* AWS EC2
* Amazon Linux 2023
* Nginx
* Git
* GitHub
* GitHub Actions
* Bash
* SSH

## Deployment Flow

1. Developer modifies the website locally.
2. Changes are committed and pushed to GitHub.
3. GitHub Actions automatically starts the deployment workflow.
4. The workflow creates an SSH connection to the EC2 instance.
5. The latest repository changes are pulled using `git pull`.
6. `deploy.sh` runs the deployment commands.
7. The updated `index.html` is copied to the Nginx web root.
8. Nginx serves the updated website.

## Project Structure

```text
aws-ec2-nginx-website/
├── .github/
│   └── workflows/
│       └── main.yml
├── deploy.sh
├── index.html
└── README.md
```

## How It Works

### GitHub Actions

The workflow runs whenever code is pushed to the `main` branch.

It connects to EC2 using SSH and executes the deployment process remotely.

### deploy.sh

The deployment script contains the commands required to update the website on the EC2 server.

It uses `set -e` so the script stops if a command fails.

### Nginx

Nginx serves the website from:

```text
/usr/share/nginx/html
```

The deployment script copies the latest `index.html` into this directory.

## Result

A change made locally can automatically travel through the following pipeline:

```text
Local Code
    ↓
Git Push
    ↓
GitHub
    ↓
GitHub Actions
    ↓
SSH
    ↓
EC2
    ↓
deploy.sh
    ↓
Nginx
    ↓
Updated Website
```
