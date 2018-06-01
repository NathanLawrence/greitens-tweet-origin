import pandas as pd
import sys

frames = []
files = sys.argv[1:]

for file in files:
    print(file)
    frames.append(pd.read_excel(file,encoding='utf-8'))

frame = pd.concat(frames)

# Notes:
# - the `subset=None` means that every column is used 
#    to determine if two rows are different; to change that specify
#    the columns as an array
# - the `inplace=True` means that the data structure is changed and
#   the duplicate rows are gone  
frame.drop_duplicates(subset=None, inplace=True)

# Write the results to a different file
frame.to_csv("moose.csv",encoding='utf-8')