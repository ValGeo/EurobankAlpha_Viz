library(googleVis)
suppressPackageStartupMessages(library(googleVis))
library(shiny)

#import data
mydata <- read.table("mystocks.txt")
mydata <- mydata[complete.cases(mydata),]
colnames(mydata) = c("date","alpha","eurobank")

#create final data frame
new_data <- data.frame(matrix(ncol = 3, nrow = 2*nrow(mydata)))
colnames(new_data)<-c("Date","Value","Bank")
m <- 1
step <- 1
for (i in seq(1, nrow(mydata), step)){
    new_data$Date[m] <- as.character(mydata$date[i])
    new_data$Date[m+1] <- as.character(mydata$date[i])
    new_data$Bank[m] <- 'Alpha'
    new_data$Bank[m+1] <- 'Eurobank'
    new_data$Value[m] <- mydata$alpha[i]
    new_data$Value[m+1] <- mydata$eurobank[i]
    m <- m+(2*step)
}
new_data <- new_data[complete.cases(new_data),]
new_data$Date <- as.Date(new_data$Date,format = "%d/%m/%Y")
#adjust years to 2000
tmp <- as.POSIXlt(new_data$Date)
tmp$year <- tmp$year+2000
new_data$Date <- as.Date(tmp)

#plot gvis
Anno <- gvisAnnotationChart(new_data, 
                            datevar="Date",
                            numvar="Value", 
                            idvar="Bank",
                            options=list(
                                width=600, height=350,
                                fill=10, displayExactValues=TRUE,
                                colors="['#0000ff','#00ff00']")
)

shinyServer(
    function(input, output) {
        output$view <- renderGvis({Anno})
    }
)