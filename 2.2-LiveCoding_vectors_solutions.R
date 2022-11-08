

# The most fundamental objects in R are vectors  
my.string <- "Jan"
typeof(my.string)
is.atomic(my.string)
is.vector(my.string)
length(my.string)

# Create a vector with two more elements
my.string2 <- c("Feb", "Mar")

my.string3 <- c(my.string,my.string2)
my.string3
length(my.string3)


# Vector with months: create using c() function
what_is_a_vector_in_mathematics <- c('Jan', 'Feb', 'Mar')

print(what_is_a_vector_in_mathematics)
length(what_is_a_vector_in_mathematics)
typeof(what_is_a_vector_in_mathematics)
is.atomic(what_is_a_vector_in_mathematics)
is.character(what_is_a_vector_in_mathematics)

my.string3 == what_is_a_vector_in_mathematics

## Creating a vector using : operator -- START:END --
x <- 2:-2;x
typeof(x)
class(x)
mode(x)
is.double(x)
is.integer(x)
is.numeric(x)
is.atomic(x)
is.vector(x)


## Accessing 
print(x)
x

## Different ways to access all elements of a vector. Show all components:
x[]

## Indexing starts with 1
x[1]
x[3]

## 2nd and 4th element
x[c(2, 4)]

## From the 2nd to the 4th element
x[2:4]
x[c(2:4)]
x[c(2,3,4)]

## We can get even a larger vector than the original one:
x[c(2,2,2,4,5,5,5)]

## all but 3rd element
x[-3]

## Negative indices suppress the specified positions:
x[c(-1,-2,-4,-5)]

## Positive and negative indices can not be mixed!
x[c(1,-1)]
x[c(0,-1, -2)]
x[c(0,1, 2)]

## I am extracting 0 elements of my vector so I get a 0 length vector.
x[c(0)]
w <- x[c(0)]; w
typeof(w)
length(w)

## Comparison operators work component by component, so if I ask whether a vector
## with no components is equal to an other vector with no components, there are 
## no components to compare, so we get a logical vector of 0 length.
w == c()

## Real numbers are truncated to integers (ONLY WHEN ACCESSING!!!)
x[c(2.4, 3.8)]

## wHY THIS?!
## Because R uses logical vector for indexing
x[x<0]
## ---> In this case, c(FALSE, FALSE, FALSE, TRUE, TRUE)


# Vector creation and logical operators:
w <- c(1:10); w

## Two conditions:
w[(w>8) | (w<5)]

## How it works:
w>8; w<5
w>8 | w<5

## Through boolean mask or logical vector
logical.vec <- c(T,T,T,T,F,F,F,F,T,T)
w[logical.vec]
typeof(logical.vec)
class(logical.vec)
mode(logical.vec)
is.atomic(logical.vec)
is.logical(logical.vec)
is.vector(logical.vec)

## And what about is I use an AND in the previous statemant?
(w>8) & (w<5)
w[(w>8) & (w<5)]


## Operate vectors:
z <- rep(4,length=3);z
z.2 <- sqrt(z);z.2
exp(z.2-rep(1,3))
## Shall we do some research in the e number? is very interesting :)

## There are some wired functions
z <- 1:5;z
cumsum(z)
cumprod(z)


## Change item value:
x <- 2:-2;x

## If the types are different, coercion is forced!)
x[3] <- "zero"; x
typeof(x)
## Change type
x <- as.integer(x)
x

x[3] <- "zero"; x
## Check if item exists
'zero' %in% x
## Remove an item by its value. 
## Translation: without elements that are "zero"
x <- x[! x %in% 'zero'];x
typeof(x)
## Change type
x <- as.integer(x);x
typeof(x)
## Append (do not change type)
x <- append(x, 3, after = 0);x

## Initialize a null vector:
vector("numeric", length = 10) -> zz; zz
print(c(typeof(zz), class(zz)))

## Create a vector with the number of all Mondays of  November of this year 
## using seq() function
y <- seq(7, 30, by=7); y

## Create a vector of the same length as the previous vector, where all its 
## elements are "Monday"
z <- rep('Monday',length(y)); z

## Names for elements are common in R.
## Use character vector as index for vectors:
named_vector <- c("first"=3, "second"=0, "third"=9, "fourth"=21); named_vector
## The sample function takes a random sample:
sample(named_vector, 2) # The second parameter defines the size of the subsample.
## or permutation of a data object:
sample(named_vector)
## However, we can access the elements of the vector by their names:
named_vector[c("first", "third")]
## Show all labels:
names(named_vector)

## Delete a vector
named_vector <- NULL; named_vector


## If vectors are the most basic structure in R, we can think numbers, strings, etc.
## as vectors of length 1!!


## Task for you 2: What is the difference between NULL and NaN


# Diapos 6.

## The paste function joins the supplied vectors
## What would the following code return?
paste(paste(LETTERS[1:3], month.abb[1:3], sep = "-" ), month.name[1:4], sep=": ")
## Check this:
pi
typeof(pi)
mode(pi)
class(pi)
is.atomic(pi)
is.vector(pi)
pi <- 100
pi
rm(pi)
pi


# Diapos 7.

without.rep <- sample(1:10, 10, replace = F)
without.rep
without.rep <- sample(1:10, 8, replace = F)
without.rep

with.rep <- sample(30:45, 10, replace = T)
with.rep



## Diapo 8


## Try running the seed and the code several times to see how it works: 
set.seed(1)
with.rep <- sample(30:45, 10, replace = T);with.rep


# Generation of random vector associated to a normal distribution
## Initializes a pseudo-random number generator describing the age of a random
## population of 500 people with mean of 35 and a standard deviation of 10.
## To obtain the same "random" numbers each time, fix the seed to 4240.
set.seed(4240)
random_vector <- rnorm(500, mean=35, sd=10); random_vector
random_vector <- as.integer(random_vector); random_vector
length(random_vector)

## Since the data produced represents ages, we must ensure that there are 
## no negative components.
random_vector <- random_vector[random_vector>0]; random_vector
length(random_vector)
mode(random_vector)
is.vector(random_vector)
is.atomic(random_vector)


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
random.var <- var(random_vector); random.var

## Check this! Shall we do some research on these magnitudes?
sqrt(random.var) == strd_dev

## Add some of these functions to the histogram
abline(v = mean, col = "blue")
abline(v = mean + (strd_dev * c(1, -1)), col = "green")
sort(random_vector)


