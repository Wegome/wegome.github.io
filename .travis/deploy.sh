#!/bin/bash

# Decrypt the private key
openssl aes-256-cbc -K $encrypted_d0af8ee98daa_key -iv $encrypted_d0af8ee98daa_iv -in .travis/4gcbdm.enc -out ~/.ssh/4gcbdm -d
# Set the permission of the key
chmod 600 ~/.ssh/4gcbdm
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/4gcbdm
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config

# Set Git config
git config --global user.name "budaim"
git config --global user.email brooks.chen@aol.com
# Deploy to GitHub
hexo deploy
rm -rf ~/.ssh