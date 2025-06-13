#!/bin/bash

# Prompt user to enter assignment name
read -p "What is the name of assignment to check submission status?: " assignment_name

# accessing the directory
directory_from_env_file=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n 1 | sed 's|^\./||')
name_for_user="${directory_from_env_file#submission_reminder_}"

# Checking whether the directory for the config/config.env exists or not
if [[ ! -d "$directory_from_env_file" ]]; then
    echo "The directory does not exist please run the create_environment.sh script first"
fi

# Substituiting the variable value with the new assignment the user entered to check
sed -i "s/^ASSIGNMENT=\".*\"/ASSIGNMENT=\"$assignment_name\"/" "$directory_from_env_file/config/config.env"
# Running startup.sh script to launch the reminder.sh script which inturn does the job
cd "$directory_from_env_file" && ./startup.sh
