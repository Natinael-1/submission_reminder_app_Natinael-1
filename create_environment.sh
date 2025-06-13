#!/bin/bash
# prompt user to enter their name
read -p "Please enter your name: " name
mkdir "submission_reminder_$name"

mkdir "submission_reminder_$name"/app/
cat << 'EOF' > "submission_reminder_$name"/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF
chmod +x "submission_reminder_$name"/app/reminder.sh

mkdir "submission_reminder_$name"/modules/
cat << 'EOF' > submission_reminder_"$name"/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF
chmod +x "submission_reminder_$name"/modules/functions.sh

mkdir "submission_reminder_$name"/assets/
cat << EOF > "submission_reminder_$name"/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
# Below are the students' records I added
Abebe,  Shell Script, not submitted
Mulugeta, Shell Script, submitted
Abenezer, Self Reflection, submitted
Workinesh, Self Reflection, not submitted
Belaynesh, Mission, not submitted
Getaneh, Mission, submitted
EOF

mkdir "submission_reminder_$name"/config/
cat << EOF > "submission_reminder_$name"/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

cat << 'EOF' > "submission_reminder_$name"/startup.sh
#!/bin/bash
# A startup script
echo "Checking the status of assignment submission, please wait a second"
echo "Looking....."
sleep 2
./app/reminder.sh

EOF
chmod +x "submission_reminder_$name"/startup.sh
