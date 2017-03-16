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

#5 Creating Arrays

# Create a vector from the list [10, 20, 30].
# Assign the result to the variable vector.
# Create a matrix from the list of lists [[5, 10, 15], [20, 25, 30], [35, 40, 45]].
# Assign the result to the variable matrix.


vector = numpy.array([10, 20, 30])

matrix = numpy.array([[5,10,15],[20,25,30],[35,40,45]])


vector_shape = vector.shape

matrix_shape = matrix.shape


world_alcohol_dtype = world_alcohol.dtype



world_alcohol = numpy.genfromtxt("world_alcohol.csv", dtype="U75", skip_header=1, delimiter = ",")

print(world_alcohol)




uruguay_other_1986 = world_alcohol[1,4]

third_country = world_alcohol[2,2]


# select slices to put whole columns into variables
countries = world_alcohol[:,2]

alcohol_consumption = world_alcohol[:,4]


first_two_columns = world_alcohol[:,0:3]

first_ten_years = world_alcohol[:9,0]

first_ten_rows = world_alcohol[:9,:]








