#!/bin/bash

# Prompt user to enter assignment name
read -p "What is the name of assignment to check submission status?: " assignment_name

# accessing the directory
# This is directory where config.env exists
directory_from_env_file=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n 1 | sed 's|^\./||')
name_for_user="${directory_from_env_file#submission_reminder_}"
# Checking whether assignment the user entered exists or not
# If the user enters assignment that doesn't exist, the user should be reprompted to choose from the assignments listed
exists=false
Assignments=("Shell Navigation" Git "Shell Basics" "Shell Script" "Self Reflection" Mission)
for assign in "${Assignments[@]}"; do
 if [[ "$assign" == "$assignment_name" ]]
 then
    exists=true
    break
    fi
done

# Prompting the user again if assignment does not exist
if [[ "$exists" = false ]]
then
echo "The assignment you entered doesn't exist. Please choose from these ( ${Assignments[o]},${Assignments[1]},${Assignments[2]},${Assignments[3]},${Assignments[4]},${Assignments[5]} )"
read -p "What is the name of assignment to check submission status?: " assignment_name
fi



# Checking whether the directory for the config/config.env exists or not
if [[ ! -d "$directory_from_env_file" ]]; then
    echo "The directory does not exist please run the create_environment.sh script first"
fi


# Substituiting the variable value with the new assignment the user entered to check
sed -i "s/^ASSIGNMENT=\".*\"/ASSIGNMENT=\"$assignment_name\"/" "$directory_from_env_file/config/config.env"

#  Changing directory to directory_from_env_file
cd "$directory_from_env_file"

# Running startup.sh
./startup.sh
