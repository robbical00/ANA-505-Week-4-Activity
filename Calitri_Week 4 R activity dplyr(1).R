#Week 4: dplyr package

#Task: Write the code to get a dataset from Base R: ChickWeight
#and save it as a dataframe with a new name that includes your first name

data("ChickWeight")
Rob_ChickWeight <- ChickWeight


#See the top rows of the data
#TASK: Write the code to see the top rows of the data

head(Rob_ChickWeight)


#Install and call the package dplyr
#TASK: Write the code to install and call dplyr

install.packages("dplyr")
library(dplyr)



#Let's just see the weight and Time columns
#Task: Write the code to 'select' just the weight and Time columns 
#(hint: use the 'select' function)

select(Rob_ChickWeight, weight, Time)


#Let's name the dataset with just the two columns, weight and Time
#TASK: Write the code to save the two columns as a new dataframe
#and give it a new name

only_two_columns <- select(Rob_ChickWeight, weight, Time)


#Let's get rid of the Time column in the new dataframe created above
#TASK: Write the code that deselects the Time column
#(hint: use the 'select' function to not select a -column)

select(only_two_columns, weight, -Time)

#Let's rename a column name
#TASK: Write the code that renames 'weight' to 'ounces'

rename(only_two_columns, ounces = weight) 
#or
rename(Rob_ChickWeight, ounces = weight)


#Let's make a new dataframe with the new column name
#TASK: Write the code that names a new dataframe that includes the 'ounces' column

newdf_ounces <- rename(Rob_ChickWeight, ounces = weight)


#Let's 'filter' our dataframe to only those with a 1 in the Chick column
#TASK: Write the code that includes only rows where Chick = 1

filter(Rob_ChickWeight, Chick == 1)


#Let's 'group' our data by Diet
#TASK: Write the code to group the data by Diet (hint: group_by)

group_by(Rob_ChickWeight, Diet)



#Task: add one of the other codes (not in the tasks above) 
#you learned about from the dplyr


## mutate() changes the values of columns and creates new columns
#we assume the weight listed in our original data frame is in ounces, and we want to add a new
#column with the weight converted to kg

Rob_ChickWeight %>% mutate(weight_kg = weight / 35.27 )

#OR

#we assume the time listed in our original data frame is in days, and we want to add a new
#column with the time converted to hours

Rob_ChickWeight %>% mutate(time_h = Time * 24 )

##relocate() changes the order of the columns

Rob_ChickWeight %>% relocate(Diet, .before = Chick)
