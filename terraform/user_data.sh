#!/bin/bash
apt update
apt install git -y
apt install curl -y
apt install neofetch -y

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
. ~/.nvm/nvm.sh

# Install Node.js 18
nvm install 18

# Install PM2
npm install -g pm2

# Clone Node.js repository
git clone https://github.com/KimangKhenng/devops-ex /root/devops-ex

# Navigate to the repository and start the app with PM2
cd /root/devops-ex
npm install
pm2 start app.js --name node-app -- -p 8000
