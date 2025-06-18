   Submission Reminder App
This project creates an app that remainds students about the assignment deadlines
Submission reminder app is made from two scripts:
  1) create_environment.sh script. 
This script as its name indicates the script that sets up environment. 
When run, it asks the user to enter his/her name and creates the root directory named submission_reminder_app_{yourname}. 
{yourname} is replaced by the name you entered. 
This root directory contains 4 subdirectories named app/, modules/, assets/, and config/ and startup.sh script. 
These subdirectories inturn contain the reminder.sh, functions.sh, submissions.txt, config.env respectively. 
To check submission status for "Shell Navigation" assignment, first run create_environment.sh script, then run startup.sh script. 
You will see the output displayed including the number of remaining days.
  2) copilot_shell_script.sh
This script depends on create_environment.sh script
You need to run create_environment.sh script before running copilot_shell_script.sh
When run, copilot_shell_script.sh prompts the user to enter the name of assignment to check submission status. 

The user should enter the assignment that exists. If the user enters invalid assignment, he/she will be prompted again with option to choose
After receiving the assignment to check from the user, it displays the assignment you entered, number of days remaining and the submission status.
YOU DON'T NEED TO RUN startup.sh SCRIPT. IT IS AUTOMATICALLY RUN BY copilot_shell_script.sh SCRIPT. YOU ONLY NEED TO RUN copilot_shell_script.sh SCRIPT
  

   INSTALLATION
Steps to run the app in your local machine
   git clone GitHub_URL
   cd submission_reminder_app_Natinael-1
   ./create_environment.sh
   cd submission_reminder_app_{yourname}(please replace "yourname" by the name you entered)
   ./startup.sh(to check submission status for "Shell Navigation" assignment)
Steps to check status of other assignments the user entered
   ./copilot_shell_script.sh(You will be prompted to enter type of assignment, please enter only one assignment at a time)

   AUTHOR
    Natinael-1(GitHub username)


