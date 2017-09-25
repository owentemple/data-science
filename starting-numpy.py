import numpy as np

vector = np.array([10,20,30])

matrix = np.array([[5,10,15],[20,25,30],[35,40,45] ])



import numpy as np

vector = np.array([10, 20, 30])
matrix = np.array([[5, 10, 15], [20, 25, 30], [35, 40, 45]])

vector_shape = vector.shape

matrix_shape = matrix.shape

print(vector_shape)
print(matrix_shape)




import numpy as np

world_alcohol = np.genfromtxt("world_alcohol.csv", delimiter=",")

print(type(world_alcohol))



world_alcohol_dtype = world_alcohol.dtype

print(world_alcohol_dtype)



import numpy as np
world_alcohol = np.genfromtxt("world_alcohol.csv",delimiter=",", dtype = "U75", skip_header=1)
print(world_alcohol)




print(world_alcohol)

uruguay_other_1986 = world_alcohol[1,4]

third_country = world_alcohol[2,2]



countries = world_alcohol[:,2]

alcohol_consumption = world_alcohol[:,4]



first_two_columns = world_alcohol[:,0:2]

first_ten_years = world_alcohol[:10,0]

first_ten_rows = world_alcohol[:10,:]


first_twenty_regions = world_alcohol[:20,1:3]




countries_canada = (world_alcohol[:,2] == "Canada")

years_1984 = (world_alcohol[:,0] == "1984")





country_is_algeria = world_alcohol[:,2] == "Algeria"

country_algeria = world_alcohol[country_is_algeria]



is_algeria_and_1986 = ((world_alcohol[:,2] == "Algeria") & (world_alcohol[:,0] == "1986"))

rows_with_algeria_and_1986 = world_alcohol[is_algeria_and_1986]




first_column_is_2014 = world_alcohol[:,0] == "1986"
world_alcohol[first_column_is_2014,0] = "2014"

fourth_column_is_wine = world_alcohol[:,3] == "Wine"
world_alcohol[fourth_column_is_wine, 3] = "Grog"




is_value_empty = world_alcohol[:,4] == ''

world_alcohol[is_value_empty,4] = 0


alcohol_consumption = world_alcohol[:,4]

alcohol_consumption = alcohol_consumption.astype(float)



alcohol_consumption = world_alcohol[:,4].astype(float)

total_alcohol = alcohol_consumption.sum()

average_alcohol = alcohol_consumption.mean()




is_1986_and_canada = ((world_alcohol[:,0] == "1986") & (world_alcohol[:,2] == "Canada"))

canada_1986 = world_alcohol[is_1986_and_canada]

canada_1986_empty = canada_1986[:,4] == ''

canada_1986[canada_1986_empty,4] = '0'

canada_alcohol = canada_1986[:,4].astype(float)

total_canadian_drinking = canada_alcohol.sum()



#C10. Calculating Consumption for Each Country in process

totals = {}

year_is_1986 = world_alcohol[:,0] == "1986"

alcohol_1986 = world_alcohol[year_is_1986]

for country in countries:
    if alcohol_1986[:,2] == country:
        alcohol_1986[:,2]





