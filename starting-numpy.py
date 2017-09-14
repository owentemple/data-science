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



