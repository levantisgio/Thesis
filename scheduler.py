import schedule
import time
import data_generation
import datetime

def job():
    print(f"{datetime.datetime.now()} - Running data generation task...")
    try:
        data_generation.main()
        print(f"{datetime.datetime.now()} - Task completed successfully.")
    except Exception as e:
        print(f"{datetime.datetime.now()} - An error occurred: {e}")

# Schedule the job every day at 00:01
schedule.every().day.at('00:01').do(job)

print(f"{datetime.datetime.now()} - Scheduler started. The script will run every day at 00:01.")

while True:
    schedule.run_pending()
    time.sleep(1)
