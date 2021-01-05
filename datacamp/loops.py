# areas list
areas = [11.25, 18.0, 20.0, 10.75, 9.50]

# Code the for loop
for item in areas:
    print(item)# areas list
areas = [11.25, 18.0, 20.0, 10.75, 9.50]

# Change for loop to use enumerate() and update print()
for index, a in enumerate(areas) :
    print("room " + str(index) + ": " + str(a))
    