################################################################################
# # Assignment #1 - part B
# The following R script loads data from the web and does some inital exploration 
#
################################################################################
## Load a .zip data from UCI - http://archive.ics.uci.edu/ml/datasets/Bank+Marketing
# location to store zip file
temp <- tempfile()

# download file to your temp location
download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00222/bank.zip", temp)

# read in the unzipped data file
data <- read.table(unz(temp, "bank-full.csv"), sep=";", header=T)

# deletes the temp file
unlink(temp)

# remove the temp location from R's memory
rm(temp)
 
################################################################################
## Explore dataset
# the class() function tells you the type of R object you have
class(data)

# the summary() function gives you a summary of an R object
summary(data)

# number of elements or components
length(data) # very useful to determine vector length or column length here
dim(data)    # number of rows by number of columns

# structure of an object; can see what R thinks are numbers and categories
str(data)

# provides the names of the features in the dataset
names(data) 

# bare bones histogram of age
hist(data$age)

# personalizing the histogram of age
hist(data$age, main="Histogram of Age", xlab="Age (years)"
     , col="blue")

# using the ggplot2 package to plot a histogram of age
library(ggplot2)
qplot(data$age)

# Kernel density plots for age grouped by job (indicated by color)
qplot(age, data=data, geom="density", fill=job, alpha=I(.5), 
      main="Distribution of Age by Job", xlab="Age", 
      ylab="Density")

# Boxplots of age by job 
qplot(job, age, data=data, geom=c("boxplot"), 
      fill=job, main="Age by Job",
      xlab="", ylab="Age")

# using the ggplot() from the ggplot2 package to plot a histogram of age
ggplot(data, aes(age) ) +
    geom_histogram(color="white")

ggplot(data, aes(age)) +
    geom_histogram(color="white", binwidth = 3)
#HW1
#barchart
plot(age ~ job, data = data)
plot(data$age, data$job)
boxplot(data$age)
ggplot(data = data) + geom_histogram(aes(x = age))
counts <- table(data$education, data$job)
barplot(counts, main="Job Distribution by education",
        xlab="Job Level", col=c("blue","red","green","orange"),
        legend = rownames(counts))
#piechart
mytable <- table(data$education)
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls, 
    main="Distribution of jobs by education")