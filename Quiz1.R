## Work on Quiz 1

## 1. The American Community Survey distributes downloadable data about United
##      States communities. Download the 2006 microdata survey about housing 
##      for the state of Idaho using download.file() from here:
##
##      https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
##
##      and load the data in R. The code book, describin the variable names is
##      here:
##
##      https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
##
##      How many properties are worth $1,000,000 or more?
library(dplyr)
download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
        destfile="ACSdata.csv", method="curl")
download.file(
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf",
    destfile = "ACSdataCodebook.pdf", method="curl")    
DF <- read.csv("ACSdata.csv", header = TRUE)
data <- tbl_df(DF)
VALsum <- data %>%
                mutate(count = 1) %>%
                group_by(VAL) %>%
                summarize(sum(count))
View(VALsum)

## 2. Use the data you loaded from Question 1.  Consider the variable FES in 
##      the code book.  Which of the "tidy data" principles does this variable
##      violate?
##
##      Answer: Tidy data has one variable per column. 

## 3. Download the Excel spreadsheet on Natural Gas Aquisition Program here:
##
##      https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
##
##      Read rows 18-23 and columns 7-15 into R and assign the results to a 
##      variable called: dat
##      What is the value of: sum(dat$Zip*dat$Ext,na.rm=T)

download.file(
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
    destfile = "NGAPdata.xlsx", method = "curl")
install.packages("xlsx")
library(xlsx)
dat <- read.xlsx("NGAPdata.xlsx", sheetIndex=1,
                 rowIndex = 18:23, colIndex = 7:15)
dat
sum(dat$Zip*dat$Ext,na.rm=T)

##4. Read the XML data on Baltimore restaurant from here:
##
##      https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
##      
##      How many restaurants have zipcode 21231?

install.packages("XML")
library(XML)
download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
        destfile = "page.xml")
doc <- xmlTreeParse(
        "page.xml",
        useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
xmlSApply(rootNode, xmlValue)
zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(zip)
class(zip)
sum(zip=="21231")

## 5. The American Community Survey distributes downloadable data about
##      United States communities.  Download the 2006 microdata survey about
##      housing for the state of Idaho using download.file() from here:
##
##      https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
##
##      using the fread() command load the data into an R object: DT
##      The following are ways to calculate the average value of the variable:
##      pwgtp15
##      broken down by sex.  using the data.table package, which will deliver
##      the fastest user time?


library(data.table)
download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
        destfile = "ACSdata5.csv", method = "curl")
DT <- fread("ACSdata5.csv")
## A. cannot get to run
rowMeans(DT)[DT$SEX==1]; rowMeans(DT[DT$SEX==2]
## B. user: 0.005, system: 0.001, elapsed: 0.006
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
## C. user:0.001, system: 0.000, elapsed: 0.001 **NOT CORRECT**
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
## D. user: 0.002, system: 0.000, elapsed: 0.002 **NOT CORRECT**
system.time(DT[,mean(pwgtp15),by=SEX])
## E. cannot report system.time 
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
## F. doesn't produce 2 means **NOT CORRECT**
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(mean(DT$pwgtp15,by=DT$SEX))
