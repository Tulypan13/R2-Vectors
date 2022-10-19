
# Generation of random vector associated to a normal distribution
## Initializes a pseudo-random number generator describing the age of a random
## population of 500 people with mean of 35 and a standars deviation of 10.
## To obtain the same "random" numbers each time, fix the seed tp 4240.
set.seed(4240)
random_vector <- rnorm(500, mean=35, sd=10); random_vector
random_vector <- as.integer(random_vector); random_vector
length(random_vector)
random_vector <- random_vector[random_vector>0]; random_vector
length(random_vector)
mode(random_vector)
is.vector(random_vector)

## Histogram
## A histogram represents the frequencies of values of a variable bucketed 
## into ranges. Histograms are similar to bar chats but values are grouped
## into continuous ranges. Each bar in histogram represents the height of
## the number of values present in that range.
hist(random_vector, main = "Ages of random people", xlab = "Data", col = "orange")

## Use some functions presented before
max(random_vector)
min(random_vector)
range(random_vector)
mean <- mean(random_vector);mean
median(random_vector)
strd_dev <- sd(random_vector); strd_dev
## Add some of these functions to the histogram
abline(v = mean, col = "blue")
abline(v = mean + (strd_dev * c(1, -1)), col = "green")
sort(random_vector)


## Task for you 3: compute the standard deviation operating directly with the 
## random vector created. find the formula and discuss the utility of this 
## magnitude.
strd_dev_hand <- sqrt( sum((random_vector-mean)^2) / (length(random_vector)-1))
strd_dev == strd_dev_hand



## Task for you 4: do a little research on the benefits of seeds.


# Diapo 28 and 29, second part.


# Factors
## Be a sample of 10 people whose pets we know:
pet <- c("cat","dog","dog","cat","cat","snake", "parrot","cat", "parrot", "cat",
         "parrot", "cat", "dog", "cat", "cat"); pet
Fpet <- factor(pet); Fpet
mode(pet)
mode(Fpet)
object.size(pet)
object.size(Fpet)
## See the levels for the factors:
levels(Fpet)
## and the number of levels:
nlevels(Fpet)

## Factors for counting occurrences through a table
Fpet
table(Fpet)

## And if we know to which age group (child, adult, elderly) the person who has the pet belongs 
people <- factor(c('adult', 'child', 'adult', 'elderly', 'adult', 'child', 'adult', 
                   'adult', 'child', 'elderly', 'adult', 'adult', 'child', 'adult', 'adult'))
people
table(people)
## crossing between the factors (giving a contingency table)
table_correspondence <- table(people,pet);table_correspondence
## to recover the marginal frequencies
margin.table(table_correspondence,1)
margin.table(table_correspondence,2)
## Relative frequencies:
## you need to specify the dimension in which the relative frequencies are taken)
prop.table(table_correspondence,1)
prop.table(table_correspondence,2)


# Diapo 30, 31


# Matrices: create a matrix with 4 rows and 7 columns with numbers from 1 to 28,
# ordered by column
matrix(1:28, nrow = 4, ncol = 7, byrow=FALSE)
# Or simply:
matrix(1:28, 4)

## The same matrix can be generated in different ways (ordered by rows)
month_matrix <- matrix(1:28,ncol=7, byrow=T); month_matrix
## The length is the total number of elements:
length(month_matrix)
nrow(month_matrix)
ncol(month_matrix)
dim(month_matrix)
is.matrix(month_matrix)
# Access the element in the 2nd row and 3rd column
month_matrix[2,3]
# Access the 3rd row
month_matrix[3,]

## Naming dimensions (you can name them when you construct the matrix)
## Rows:
rownames(month_matrix) <- c('week_1','week_2','week_3', 'week_4')
month_matrix
## Check the name of the rows
rownames(month_matrix)
## Columns (I do not want to type day by day... I'm lazy):
## In what language is my System? Get Locale-Specific Information for time
## when parsing or writing dates
Sys.getlocale("LC_TIME")
## I will change the locale of R in R itself to English.
Sys.setlocale("LC_TIME", "en_US")
## And it is changed; now we have the appropriate words for the days of the 
## weeks and the months.
Sys.getlocale("LC_TIME")
## Change back to Spanish:  
Sys.setlocale("LC_TIME", "Spanish_Spain.utf8")
## ISOdate(year, month, day) function to create data-times. 
## Converts numeric representation to date-times.
ISOdate(1, 1, 1)
weekdays(ISOdate(1, 1, 1))
## Change back to English and store all days of the week
days <- weekdays(ISOdate(1, 1, 1:7)); days
colnames(month_matrix) <- days
## Check the name of the columns:
colnames(month_matrix)
month_matrix
attributes(month_matrix)
str(month_matrix)
## Access by label
month_matrix[,'Friday']
# Try this:
month_matrix$week_1

month_matrix_t <- t(month_matrix)
attributes(month_matrix_t)
## diag() extract diagonal from a matrix or create a diagonal matrix:
diag(month_matrix)
## It usually makes more sense for diagonal matrices.
diag(1, nrow =3)
## and with you, the identity matrix of rank 3.

## Methods to create matrices:
v1 <- 1:3; v2 <- 4:6
## Join (bind) vectors or matrices by columns:
m1 <- cbind(v1,v2);m1
## Join (bind) vectors or matrices by rows:
m2 <- rbind(2:4,5:7);m2
## Add new rows and columns:
m1
m1 <- cbind(m1,7:9) ; m1
m1 <- cbind(m1,v3 = 7:9) ; m1
## Eliminate the 3rd column:
m1 <- m1[,-3];m1
## Eliminate 2 rows:
m1 <- m1[-c(1,3),];m1
is.vector(m1)
is.vector(m2)
is.matrix(m1)
is.matrix(m2)
## Add 2 rows
m1 <- rbind(m1,seq(3,6,3),seq(4,7,3));m1
t(m1)
t(m1) == m2

## Arithmetic operations on matrices:
m1 <- matrix(nrow=2, 1:4, byrow = T);m1
m1+1
m1+m1
2*m1


m1+1:5
m1+1:4
m1
## and if I would like the matrix  2  4  adding m1 and a vector?
##                                 4  6
m1+1:2
v1 <- t(1:2);v1
is.vector(v1)
is.matrix(v1)
m1+v1
## Is the same to do this:
v2 <- matrix(1:2)
m1+v2
m1
## The recursive way of operating matrices with vectors whose length is a 
## multiple of the dimension of the matrix does not work between matrices.
## Solve the excercise adding matrices:
m1+rbind(1:2,c(1,2))






# Data frames:
## Create a data frame with 6 people and their ages
names <- c('Bautista', 'Lucrecia', 'Marco', 'Luciano', 'Marta', 'Eugenia','Xavi', 'Adrea')
ages <- c(21, 34, 57, 42, 68, 13, 36, 31)
df_people <- data.frame(names,ages); df_people
str(df_people)
head(df_people)
tail(df_people)

## Add a column with their city of birth
city_birth <- c('Cordoba', 'Ho Chi Minh City', 'Guadalajara', 'Kyoto', 
                'Ho Chi Minh City', 'Port Barton', 'Singapore', 'Ho Chi Minh City')
df_people <- cbind(df_people, city_birth); df_people 
names(df_people)
df_people$city_birth
df_people <- rbind(df_people, c('Eliot', 45, 'Kyoto')); df_people
dim(df_people)
dim(df_people)[1]
nrow(df_people)
dim(df_people)[2]
ncol(df_people)

str(df_people)
## What is happening?
df_people$ages <- sapply(df_people$ages, as.integer)
str(df_people)

## Rename columns:
names(df_people) <- c('Name', 'Age', 'City_of_birth'); df_people

## Extract values v.s. extract elements
df_people[[2]]
typeof(df_people[[2]])
df_people[2]
typeof(df_people[2])

## Consulting:
df_people[2:4, ]
df_people$City_of_birth

df_people
## Querying
df_people[df_people$City_of_birth=='Ho Chi Minh City', c('Name', 'Age')]
df_people[df_people$Age>35,]

## Add a new example. Alternative to rbind():
df_people[nrow(df_people)+1,] <- data.frame('Patricio', 5, 'Guadalajara'); df_people 
df_people <- rbind(df_people, list('Elvira', 29, 'Kyoto')); df_people

## Age is of integer type: 
summary(df_people)

## Sub-dataframe:
df_people_copy <- head(df_people, -1)
df_people_copy
df_people_copy[3] <- NULL; df_people_copy

## Access variables of a data.frame without calling the df:
Age
attach(df_people)
Age


barplot(table(City_of_birth)) 

summary(df_people)
## The mean splits the data in two
mean_peop <- sum(df_people$Age)/nrow(df_people); mean_peop


hist(Age, main = "Ages of people", xlab = "Data", col = "orange")
abline(v = mean_peop, col = "blue", lty = 3)
abline(v = mean + (strd_dev * c(1, -1)), col = "green")

## The median is the second quartile (Q2); 
## thus 50% of the data lies belowthis point.
median(Age)
Age
typeof(Age)
ages_ordered <- sort(Age); ages_ordered

## The median is the 6th element (different from the mean):
(length(Age)+1)/2
ages_ordered[(length(Age)+1)/2]

## Q1
quantile(Age, 0.25)
## Q3
quantile(Age, 0.75)
## Some
quantile(Age, probs = c(0,0.25,0.5,0.75,1))

ages_ordered

## Delete a column, other manner:
df_people
sub_set_peop <- c(T,F,T)
sub_df_prople <- df_people[sub_set_peop];sub_df_prople

## Order the dataframe
sub_df_prople[order(Name), ]
sub_df_prople

detach(df_people)
Age


# Arrays
## Higher dimensional structures.Generate an array of two 3x3 matrices:
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
result <- array(c(vector1,vector2),dim = c(3,3,2),)
result

column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")
array1 <- array(c(vector1,vector2),dim = c(3,3,2),dimnames = 
                  list(row.names,column.names,matrix.names))
array1

## Access: array_name[matrix_row,matrix_column,array_component]
## Print the element in the 1st row and 3rd column of the 1st matrix.
print(result[1,3,1])
## Print the third row of the second matrix of the array.
print(result[3,,2])
## Print the 2nd Matrix.
print(result[,,2])

## Create matrices from these arrays.
matrix1 <- array1[,,1]
matrix2 <- array1[,,2]

# Add the matrices.
matrix1+matrix2

# Use apply to calculate the sum of the rows across all the matrices.
apply(array1, c(1), sum)
sum(array1[1,,1])+sum(array1[1,,2])
sum(array1[2,,1])+sum(array1[2,,2])
sum(array1[3,,1])+sum(array1[3,,2])


