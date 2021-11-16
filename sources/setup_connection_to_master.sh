#!/bin/bash

# Variables
key_name=~/.ssh/aws_poe_pf
host=aws_poe_pf
port=22
user=sysadmin
hostname=ec2-18-231-196-41.sa-east-1.compute.amazonaws.com

# Create .ssh directory
mkdir ~/.ssh

# Create ssh key if it does not exist
ssh-keygen -t rsa -N '' -f $key_name

# Add key to ssh agent
eval `ssh-agent -s`
ssh-add $key_name

# Configure comfy ssh
echo -e "\nHost $host\n\tHostname $hostname\n\tUser $user\n\tIdentityFile $key_name\n\tPort=$port" >> ~/.ssh/config

# Send the public key to the server
key=`cat $key_name.pub`
ssh $user@$hostname "echo '$key' >> .ssh/authorized_keys"
