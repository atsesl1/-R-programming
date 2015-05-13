corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        dir <- paste("./",directory, sep= "")
        dir_files <- list.files(dir, ful.names=T)
        

        complete_obs <- complete(directory,1:332)
        
        nobs <- complete_obs$nobs
        ids <- complete_obs$id[nobs>threshold]
        id_len <- length(ids)
        
        cor_data <- numeric()
        
        x <- 1
        
        for(i in ids)
        {
                file <- read.csv(dir_files[i])
                cor_data[x] <- cor(file$sulfate, file$nitrate, use="complete.obs")
                x <- x + 1
        }
        
        cor_data
        
}