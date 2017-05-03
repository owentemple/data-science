#panda-data-analysis.py

# 3: Read In A CSV File

import pandas

food_info = pandas.read_csv("food_info.csv")

print(type(food_info)

# 4: Exploring The DataFrame

print(food_info.head(3))
dimensions = food_info.shape
print(dimensions)
num_rows = dimensions[0]
print(num_rows)
num_cols = dimensions[1]
print(num_cols)

first_twenty = food_info.head(20)

# 7: Selecting A Row

hundredth_row = food_info.loc[99]

print(hundredth_row)

# 8: Data Types

print(food_info.dtypes)

# 9: Selecting Multiple Rows

print("Rows 3, 4, 5 and 6")
print(food_info.loc[3:6])

print("Rows 2, 5, and 10")
two_five_ten = [2,5,10]
print(food_info.loc[two_five_ten])

print(food_info.shape[0])

last_rows = food_info.loc[8613:8618]

#10: Selecting Individual Columns

# Series object.
ndb_col = food_info["NDB_No"]
print(ndb_col)

# Display the type of the column to confirm it's a Series object.
print(type(ndb_col))

saturated_fat = food_info["FA_Sat_(g)"]

cholesterol = food_info["Cholestrl_(mg)"]


#11: Selecting Multiple Columns By Name

zinc_copper = food_info[["Zinc_(mg)", "Copper_(mg)"]]

columns = ["Zinc_(mg)", "Copper_(mg)"]
zinc_copper = food_info[columns]

selenium_thiamin = food_info[["Selenium_(mcg)","Thiamin_(mg)"]]


# 12: Practice

print(food_info.columns)
print(food_info.head(2))

columns_list = food_info.columns.tolist()

gram_columns = []

for name in columns_list:
    if name.endswith("(g)"):
       gram_columns.append(name)

gram_df = food_info[gram_columns]

print(gram_df.head(3))




#1: Overview


import pandas

food_info = pandas.read_csv("food_info.csv")

col_names = food_info.columns.tolist()

print(col_names)

print(food_info.head(3))


#2: Transforming A Column

div_1000 = food_info["Iron_(mg)"] / 1000
add_100 = food_info["Iron_(mg)"] + 100
sub_100 = food_info["Iron_(mg)"] - 100
mult_2 = food_info["Iron_(mg)"]*2

sodium_grams = food_info["Sodium_(mg)"] / 1000

sugar_milligrams = food_info["Sugar_Tot_(g)"] * 1000


# 3: Performing Math With Multiple Columns

water_energy = food_info["Water_(g)"] * food_info["Energ_Kcal"]
print(water_energy[0:5])

grams_of_protein_per_gram_of_water = food_info["Protein_(g)"] / food_info["Water_(g)"]

milligrams_of_calcium_and_iron = food_info["Calcium_(mg)"] + food_info["Iron_(mg)"]


# 4: Create A Nutritional Index

weighted_protein = food_info["Protein_(g)"] * 2

weighted_fat = food_info["Lipid_Tot_(g)"] * -0.75

initial_rating = weighted_protein + weighted_fat


# 5: Normalizing Columns In A Data Set

print(food_info["Protein_(g)"][0:5])
max_protein = food_info["Protein_(g)"].max()

normalized_protein = food_info["Protein_(g)"] / max_protein

max_fat = food_info["Lipid_Tot_(g)"].max()

normalized_fat = food_info["Lipid_Tot_(g)"] / max_fat


# 6: Creating A New Column

food_info["Normalized_Protein"] = normalized_protein

food_info["Normalized_Fat"] = normalized_fat


# 7: Create A Normalized Nutritional Index

food_info["Normalized_Protein"] = food_info["Protein_(g)"] / food_info["Protein_(g)"].max()
food_info["Normalized_Fat"] = food_info["Lipid_Tot_(g)"] / food_info["Lipid_Tot_(g)"].max()

food_info["Norm_Nutr_Index"] = 2 * food_info["Normalized_Protein"] - 0.75 * food_info["Normalized_Fat"]


# 8: Sorting A DataFrame By A Column

food_info["Normalized_Protein"] = food_info["Protein_(g)"] / food_info["Protein_(g)"].max()
food_info["Normalized_Fat"] = food_info["Lipid_Tot_(g)"] / food_info["Lipid_Tot_(g)"].max()
food_info["Norm_Nutr_Index"] = 2*food_info["Normalized_Protein"] + (-0.75*food_info["Normalized_Fat"])

food_info.sort_values("Norm_Nutr_Index", inplace=True, ascending=False)



#Working with Missing Data

# 1: Introduction

import pandas as pd

titanic_survival = pd.read_csv("titanic_survival.csv")



#2: Finding The Missing Data

age = titanic_survival["age"]
print(age.loc[10:20])

age_is_null = pd.isnull(age)

age_null_true = age[age_is_null]


age_null_count = len(age_null_true)

print(age_null_count)



# 3: Whats The Big Deal With Missing Data?


age_is_null = pd.isnull(titanic_survival["age"])


age_values= titanic_survival["age"][age_is_null == False]


correct_mean_age = sum(age_values) / len(age_values)

