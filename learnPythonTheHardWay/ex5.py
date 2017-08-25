name = 'Zed A. Shaw'
age = 35 # not a lie
height = 74 # inches
weight = 180 # lbs
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'

height_cm = height * 2.54
weight_kg = weight * 0.4535924

print(f"Let's talk about {name}.")
print(f"He's {height} inches tall.")
print(f"He's {weight} pounds heavy.")
print(f"He's {height_cm} centimeters tall.")
print(f"He's {weight_kg} kilograms heavy.")

print("Actually that's not too heavy.")
print(f"He's got {eyes} eyes and {hair} hair.")
print(f"His teeth are usually {teeth} depending on the coffee.")

total = age + height + weight
print(f"If I add {age}, {height}, and {weight} I get {total}.")
