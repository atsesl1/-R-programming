pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        dir<-paste("./",directory,sep="")
        dir_files<- list.files(dir, full.names=T)
        
        means <- numeric()
        
        for(i in id) {
                file <- read.csv(dir_files[i])
                clean_data <- file[complete.cases(file[, pollutant]), pollutant]
                means <- c(means, clean_data)
        }
        value<-mean(means)
        round(value,3)

}
