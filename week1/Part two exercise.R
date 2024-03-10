lake.df = read.csv("Lake.csv", stringsAsFactors = FALSE)
lake.df
#calculate the standard error of th pH
std.error(lake.df$ph)

# sd() calcualtes the standard deviation, and length() can be used
# to calculate N

with(lake.df, sd(pH, na.rm = TRUE)/ sqrt(length(pH)))

# write your own function

sem_function = function(input){
  s = sd(input, na.rm = TRUE) # Calc std. deviation
  N = length(input)           # calc sample size
  s / sqrt(N)                 # Definition of SEM
}
# modifying formula to round of the result to 2 deicmal points
sem_function = function(input){
  s = sd(input, na.rm = TRUE) # Calc std. deviation
  N = length(input)           # calc sample size
  round(s / sqrt(N),2)                 # Definition of SEM
}

sem_function(lake.df$pH)

#subsetting datasets
#find pH of the first lake
lake.df$pH[1]
lake.df$pH[53]
#check number rows
length(lake.df$pH)
#or using nrow()
rowCount = nrow(lake.df)
lake.df$pH[rowCount]
#check value of first and last lake pH value
lake.df$pH[c(1,53)]

# check singal specific row
lake.df[3,]

#all pH values
lake.df[,"pH"]

#The average pH of lakes with low Calcium concentration
with(lake.df, mean(pH[Calcium == "Low"]))

#The average pH of lakes with high Calcium concentration.
with(lake.df, mean(pH[Calcium == "Low" & Chlorophyll <10], na.rm = TRUE))

str(lake.df)
