#!/bin/bash
dnf install ansible -y
ansible-pull -U https://github.com/gantla-pavan/ansible-roboshop-roles-tf.git -e component=mongodbmain.yaml