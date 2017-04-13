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


first_two_columns = world_alcohol[:,0:2]

first_ten_years = world_alcohol[:10,0]

first_ten_rows = world_alcohol[:10,:]


first_twenty_regions = world_alcohol[:20,1:3]


#  Computation with NumPy


countries_canada = (world_alcohol[:,2] == 'Canada')

years_1984 = (world_alcohol[:,0] == '1984')


#selecting elements

country_is_algeria = (world_alcohol[:,2] == 'Algeria')
country_algeria = world_alcohol[country_is_algeria]

# Comparisons With Multiple Conditions

is_algeria_and_1986 = (world_alcohol[:,0] == '1986') & (world_alcohol[:,2] == 'Algeria')

rows_with_algeria_and_1986 = world_alcohol[is_algeria_and_1986]

#Replacing Values

first_column_1986 = (world_alcohol[:,0] == '1986')
world_alcohol[first_column_1986,0] = '2014'

fourth_column_wine = (world_alcohol[:,3] == 'Wine')
world_alcohol[fourth_column_wine, 3] = 'Grog'

#Replacing Empty Strings

is_value_empty = (world_alcohol[:,4] == '')
world_alcohol[is_value_empty,4] = 0


#Converting Data Types

alcohol_consumption = world_alcohol[:,4].astype(float)

#Computing With NumPy

total_alcohol = alcohol_consumption.sum()

average_alcohol = alcohol_consumption.mean()

#Total Annual Alcohol Consumption

canada_1986 = (world_alcohol[:,0] == '1986') & (world_alcohol[:,2] == 'Canada')

is_value_empty = (world_alcohol[canada_1986,4] == '')

world_alcohol[is_value_empty] = 0


canada_alcohol = world_alcohol[canada_1986,4].astype(float)

total_canadian_drinking = canada_alcohol.sum()

#Calculating Consumption For Each Country

totals = {}
is_year = (world_alcohol[:,0] == '1989')
year = world_alcohol[is_year,:]

for country in countries:
    is_country = year[:,2] == country
    country_consumption = year[is_country,:]
    alcohol_column = country_consumption[:,4]
    is_empty = alcohol_column == ''
    alcohol_column[is_empty] = "0"
    alcohol_column = alcohol_column.astype(float)
    totals[country] = alcohol_column.sum()

#Finding The Country That Drinks The Most

highest_value = 0
highest_key = None

for country in totals:
    if totals[country] > highest_value:
        highest_value = totals[country]
        highest_key = country




