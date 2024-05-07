import csv
import numpy as np
import random
import pandas as pd
from datetime import datetime, time, timedelta

#functions to read data from lists
def read_geo_locations(locations_txt):
    with open(locations_txt, 'r') as file:
        geo_locations = [line.strip() for line in file]
    return geo_locations

def read_device_information(device_information_txt):
    with open(device_information_txt, 'r') as file:
        device_information = [line.strip() for line in file]
    return device_information

def read_user_information(user_information_txt):
    with open(user_information_txt, 'r') as file:
        user_information = [line.strip() for line in file]
    return user_information

#function to read existing data from CSV file into a pandas DataFrame
def read_existing_data(file_path):
    existing_data = pd.read_csv(file_path)
    return existing_data

#function to generate a random timestamp within the range of the current date
def generate_random_timestamp():
    today = datetime.now().date()
    start_time = time(0, 0, 0)
    end_time = time(23, 59, 59)
    random_time = time(random.randint(start_time.hour, end_time.hour), 
                       random.randint(start_time.minute, end_time.minute), 
                       random.randint(start_time.second, end_time.second))
    return datetime.combine(today, random_time)

#function to generate random IP addresses
def generate_random_ip():
    return f"{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(0, 255)}"

#function to generate random data for each day
def generate_new_data(existing_data, num_rows=500):

    device_information_txt = 'C:\\Users\\glevantis\\OneDrive - REAL CONSULTING SA\\Επιφάνεια εργασίας\\Thesis-1\\Device_Information.txt'
    device_information = read_device_information(device_information_txt)

    locations_txt = 'C:\\Users\\glevantis\\OneDrive - REAL CONSULTING SA\\Επιφάνεια εργασίας\\Thesis-1\\Locations.txt'
    locations = read_device_information(locations_txt)

    user_information_txt = 'C:\\Users\\glevantis\\OneDrive - REAL CONSULTING SA\\Επιφάνεια εργασίας\\Thesis-1\\User_Information.txt'
    user_information = read_user_information(user_information_txt)

    #copy existing data to preserve it
    new_data = pd.DataFrame(columns=existing_data.columns)
    
    # generate new rows for the specified number
    for i in range(num_rows):
        # generate random timestamp for this row
        random_timestamp = generate_random_timestamp()
        
        #create a new row with random data
        new_row = {
            'Timestamp': random_timestamp,
            'Source IP Address': generate_random_ip(),
            'Destination IP Address': generate_random_ip(),
            'Source Port': random.randint(1024, 65535),
            'Destination Port': random.randint(1024, 65535),
            'Protocol': random.choice(['TCP', 'UDP', 'ICMP']),
            'Packet Length': random.randint(64, 1500),
            'Packet Type': random.choice(['Data', 'Control']),
            'Traffic Type': random.choice(['HTTP', 'DNS', 'FTP']),
            'Payload Data': '-',
            'Malware Indicators': 'IoC Detected' if random.random() < 0.5 else '',
            'Anomaly Scores': round(random.uniform(0, 99.99), 2),
            'Alerts/Warnings': 'Alert Triggered' if random.random() < 0.5 else '',
            'Attack Type': random.choice(['DDoS', 'Intrusion', 'Malware']),
            'Attack Signature': random.choice(['Known Pattern A', 'Known Pattern B']),
            'Action Taken': random.choice(['Blocked', 'Ignored', 'Logged']),
            'Severity Level': random.choice(['Low', 'Medium', 'High']),
            'User Information': random.choice(user_information),
            'Device Information': random.choice(device_information),
            'Network Segment': random.choice(['Segment A', 'Segment B', 'Segment C']),
            'Geo-location Data': random.choice(locations),
            'Proxy Information': generate_random_ip() if random.random() < 0.5 else '',
            'Firewall Logs': 'Log Data' if random.random() < 0.5 else '',
            'IDS/IPS Alerts': 'Alert Data' if random.random() < 0.5 else '',
            'Log Source': random.choice(['Server', 'Firewall'])
        }
        #append the new row to the DataFrame
        new_data = new_data.append(new_row, ignore_index=True)
    
    return new_data

#function to create a new CSV file with the new data
def create_new_csv_file(new_data):
    today = datetime.now().strftime('%Y-%m-%d')
    new_file_name = f"data1_{today}.csv"
    new_data.to_csv(new_file_name, index=False)
    print(f"New CSV file '{new_file_name}' created with new data.")

def main():
    # file paths to the existing CSV file and text files
    file_path = 'C:\\Users\\glevantis\\OneDrive - REAL CONSULTING SA\\Επιφάνεια εργασίας\\Datasets\\Dataset 01\\cybersecurity_attacks.csv'

    # read existing data from the CSV file
    existing_data = read_existing_data(file_path)

    # generate 500 new rows of data
    new_data = generate_new_data(existing_data, num_rows=500)

    # create a new CSV file with the new data
    create_new_csv_file(new_data)

if __name__ == "__main__":
    main()