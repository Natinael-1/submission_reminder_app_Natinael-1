#!/bin/bash
read -p "What is the name of assignment to check submission status?: " assignment_name
# Loading the content of create_environment.sh file. This is important to navigate to the folder later created by the file.
source ./create_environment.sh
# This line should go to inside of the config.env file
source ./"submission_reminder_$name"/config/config.env
# Checking whether the directory for the config/config.env exists or not
if [[ ! -d "submission_reminder_$name" ]]; then
echo "The directory does not exist please run the create_environment.sh script first"
fi
# Substituting the value of ASSIGNMENT variable with the value the user entered
sed i 's/ASSIGNMENT="Shell Navigation"/ASSIGNMENT="$assignment_name"/'

