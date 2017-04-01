setwd("/Users/meganpitman/Dropbox/Projects/Classes/Coursera/DataScienceSpecialization/GettingCleaningData/courseraGettingCleaningData")

## Download lecture on X Path language and extracting data from xml
download.file(
        "https://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf",
        destfile="XPath.pdf", method="curl")
## Download documentation on XML package
download.file("http://www.omegahat.net/RSXML/shortIntro.pdf", 
              destfile="XMLpackage.pdf", method="curl")

## Download jsonlite R package vignette
download.file(
   "https://cran.r-project.org/web/packages/jsonlite/vignettes/json-mapping.pdf",
        destfile="./FurtherResources/jsonliteVignette.pdf", method="curl")

## Download tidy data paper by Hadley Wikham
download.file("http://vita.had.co.nz/papers/tidy-data.pdf",
              destfile="./FurtherResources/tidy-data.pdf", method="curl")
                      
## The data.table Package
install.packages("data.table")
library(data.table)
DF <- data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3),
                 z=rnorm(9))
head(DF,3)
DT <- data.table(x=rnorm(9), y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
tables()
DT[2,]
DT[DT$y=="a",]
DT[2:3,]
DT[,list(mean(x),sum(z))]
DT[,table(y)]
DT[,w:=z^2]
DT
DT[,m:={tmp <- (x+z); log2(tmp+5)}]
DT
DT[,a:=x>0]
DT[,b:= mean(x+w), by=a]
set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[,.N,by=x]
DT <- data.table

## SWIRL excercises
install_course_zip("~/Dropbox/Projects/Classes/Coursera/DataScienceSpecialization/swirl_courses-master.zip",
                   multi=TRUE, which_course="Getting and Cleaning Data")
