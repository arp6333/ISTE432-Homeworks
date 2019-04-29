# Ellie Parobek
# ISTE432.01
# Exercise 2
import csv
import json
import datetime

# Read in the CSV file
fileName = "mockData.csv"
data = []
with file(fileName, "r") as f:
    csvReader = csv.reader(f, delimiter="\t")
    for line in enumerate(csvReader):
        # Add each line of the CSV file into an array, splitting on the commas
        data.append(line[1][0].split(","))

# Check that the email column is only emails by searching for '@'
for i in data:
    if "@" not in i[3]:
        # If there is no '@', combine the text with the lname and delete it to move the email in the correct spot
        change = i[3]
        i[2] += change
        i.pop(3)

# Get rid of leading/ trailing spaces in the gender column and make sure all are formated 'Male' or 'Female'
for i in data:
    i[4] = i[4].strip()
    if i[4][0:1] == 'f' or i[4][0:1] == 'F':
        i[4] = 'Female'
    elif i[4][0:1] == 'm' or i[4][0:1] == 'M':
        i[4] = 'Male'

# Get only the columns with fname, lname, and gender into a new array to convert to JSON
dataFormatted = []
for i in data:
    line = [i[1], i[2], i[4]]
    dataFormatted.append(line)
# Remove the first row as it is just the headers
dataFormatted.pop(0)

# Convert our array into a JSON file
with open(datetime.datetime.today().strftime("%Y%m%d") + ".json", 'wb') as outfile:
    json.dump(dataFormatted, outfile)
