import os
import csv

def show_csv_columns(directory_path):
    """
    Prints the column names of all CSV files found in the specified directory.

    Args:
        directory_path (str): The path to the directory containing CSV files.
    """
    for filename in os.listdir(directory_path):
        if filename.endswith(".csv"):
            filepath = os.path.join(directory_path, filename)
            try:
                with open(filepath, 'r', newline='', encoding='utf-8') as csvfile:
                    reader = csv.reader(csvfile)
                    header = next(reader, None)  # Get the first row (header)
                    if header:
                        print(f"Columns in '{filename}':")
                        for col in header:
                            print(f"  - {col}")
                    else:
                        print(f"'{filename}' appears to be empty or lacks a header row.")
            except FileNotFoundError:
                print(f"Error: CSV file '{filename}' not found.")
            except Exception as e:
                print(f"Error processing '{filename}': {e}")
            print("-" * 30) # Separator for readability

# Example usage:
# Replace 'your_directory_path_here' with the actual path to your CSV files
csv_directory = '/Users/shreejamehta/Downloads/archive' 
show_csv_columns(csv_directory)