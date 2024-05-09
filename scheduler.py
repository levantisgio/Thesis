import schedule
import time
import subprocess

# Define the command to execute your script
script_command = "C:\\Users\\glevantis\\OneDrive - REAL CONSULTING SA\\Επιφάνεια εργασίας\\Thesis-1\\data_generation.py"


# Define the task to run your script
def run_script():
    print("Running script...")
    subprocess.run(script_command, shell=True)
    print("Script execution completed.")

# Schedule the task to run daily at 12:58 AM
run_script()