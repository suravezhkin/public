#!/bin/bash
sudo echo -e "\nAllowAgentForwarding yes" >> /etc/ssh/sshd_config
sudo service sshd restart
sudo sudo systemctl restart ssh