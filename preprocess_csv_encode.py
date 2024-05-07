import csv

def preprocess_csv(input_file, output_file):
    with open(input_file, 'r', newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        fieldnames = reader.fieldnames
        with open(output_file, 'w', newline='', encoding='utf-8') as outfile:
            writer = csv.DictWriter(outfile, fieldnames=fieldnames)
            writer.writeheader()
            for row in reader:
                # Merge multiline values into a single line
                for field in fieldnames:
                    if '\n' in row[field]:
                        row[field] = row[field].replace('\n', ' ')
                
                # Write the processed row to the output file
                writer.writerow(row)

# Example usage
input_file = 'C:\\Users\\glevantis\\OneDrive - REAL CONSULTING SA\\Επιφάνεια εργασίας\\Datasets\\Dataset 01\\cybersecurity_attacks.csv'  # Adjust path to your input file
output_file = 'output_utf-8.csv'  # Adjust path to your output file
preprocess_csv(input_file, output_file)
print("CSV file preprocessed successfully.")
