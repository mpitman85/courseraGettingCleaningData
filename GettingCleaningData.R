setwd("/Users/meganpitman/Dropbox/Projects/Classes/Coursera/DataScienceSpecialization/GettingCleaningData/courseraGettingCleaningData")

## Download lecture on X Path language and extracting data from xml
download.file(
        "https://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf",
        destfile="XPath.pdf", method="curl")
## Download documentation on XML package
download.file("http://www.omegahat.net/RSXML/shortIntro.pdf", 
              destfile="XMLpackage.pdf", method="curl")
