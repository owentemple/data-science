numpy




import csv

f = open("world_alcohol.csv", 'r')
world_alcohol = list(csv.reader(f))

years = []
for row in world_alcohol:
    year = row[0]
    years.append(year)

years = years[1:]

total = 0
for item in years:
    total += float(item)

avg_year = total/len(years)







#4 Using NumPy

import numpy

world_alcohol = numpy.genfromtxt("world_alcohol.csv", delimiter=",")
print(type(world_alcohol))

