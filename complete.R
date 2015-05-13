complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        # set working directory

        dir <- paste ("./" ,directory, sep = "")
        dir_files <- list.files(dir, full.names=T)
        
        id_len <- length(id)
        
        clean_data <- numeric()
        x <- 1
        
        for (i in id) {
                
                file <- read.csv(dir_files[i])
                clean_data[x] <- sum(complete.cases(file))
                x <- x + 1
        }
        result <- data.frame(id=id, nobs=clean_data)
        result
}