weightmedian <- function(directory, day)  {
        
        files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
        
        summary(files_full)
        tmp <- vector(mode = "list", length = length(files_full))
        summary(tmp)
        
        str(lapply(files_full, read.csv))
        
        output <- do.call(rbind, tmp)
        str(output)

}