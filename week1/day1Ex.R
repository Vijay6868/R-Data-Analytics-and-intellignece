1+2

1+3^2

log(15) - sqrt(3.4)

pnorm(1.96)

x=2
y=3
x^2-3*y+5

c("hello", "world")
c(1,2,3,4,5)
1:6

#create the matrix with 2 rows
matrix(1:6, nrow=2)

#create the matrix with 2 columns
matrix(1:6, ncol = 2)

# use dataframes data.frame
my_charachters = c("one","two","three")
my_numbers = 1:3
my_logicals = c(TRUE,FALSE,F)

#print data in dataframe
data.frame(my_charachters, my_numbers, my_logicals)

#setting current directory
setwd(dir = "/Users/vj/Documents/Developer/R-Data-Analytics-and-intellignece/week1")

#opening csv file in current directory
lake_data = read.csv(file = "Lake.csv")
head(lake_data)
#print given number of rows
head(lake_data,10)
#returns last 5 records
#tail(read.csv(file = "Lake.csv"))

#return the structure of the dataset
str(lake_data)

#opening patient.csv
patient.df = read.csv("Patient.csv")
head(patient.df)

#Names fo the variables
patient.df = read.csv("Patient.csv")
names(patient.df)

patient.df = read.csv("Patient.csv", stringsAsFactors = FALSE)
str(patient.df)

mean(patient.df$Height)# there are none values so R doesn't know what to with it
#we can tell R to remove the missing values before calculation
mean(patient.df$Height, na.rm=TRUE)
# one-way table of counts
table(patient.df$Gender)

#same table of counts using 'with'
with(patient.df, table(Gender))

#Table of proportions for the gender variable
prop.table(table(patient.df$Gender))

# convert to % and round to 1dp
round(prop.table(table(patient)))

#two way frequency tables
gender_eth_table = with(patient.df, table(Gender, Ethnicity))
gender_eth_table

#two way frequency tables (proportions)
prop.table(gender_eth_table, margin = 2)

#after installing the haven and plotrix package
#stata.df = read_dta("data.dta")
#spass.df= read_sav("data.sav")
#sas.df = red_sas("data.sas7bdat")
#sasxport.df = read_xpt("data.xpt")

sem_function = function(input){
  s = sd(input, na.rm = TRUE) # Calc std. deviation
  N = length(input)           # calc sample size
  s / sqrt(N)                 # Definition of SEM
}

sem_function(patient.df$Weight)

#square bracket [ and ] are used to extract subsets of data
#Extract the first patients's height
patient.df$Height[1]

#Extract the patient height first 5
patient.df$Height[1:5]

# Extract all but the first element in vector
c("first","second","third")[-1]

# Extract the heights of the patients 3 through to 8
patient.df$Height[3:8]

# Extract the heights of the third and enighth patients
patient.df$Height[c(3,8)]

# subsetting 2 dimenesional arrays, such as data frames, requires
#use of two indices
#Extract the first row
patient.df[1,]
#patient.df

#subsetting tow dimesional arrays, such as data frames, requires
# the use of two indices:
#[rows, cols]
#second column or vriables (Age)
patient.df[,2]
#second column or variable (Age)
patient.df[,"Age"]

#subsetting both rows and columns
#subsetting two-dimensional arrays, such as data frames,
# requires the use of two indices

patient.df[1:5, c("Ethnicity","Weight","Height","Smoke")]

#load individuals who smoke in smokers variable
smokers = which(patient.df$Smoke==1)
smokers
#count the number of smokers
length(smokers)

#another way to sum up how many TRUE's there are in the logical
#vector patient.df$Smoke ==1.
sum(patient.df$Smoke == 1, na.rm = TRUE)

#who are the smokers? the smoker vector contains the row number
#of all the smokers in data set. We can use this as an index,
#to subset the patient ID's to only include those who are smokers
patient.df$Patient.ID[smokers]

# R reserves the object NA for elements of a vector that are missing
# we can use