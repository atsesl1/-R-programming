best <- function(state, outcome) {
        ## Read outcome data
        data <- read.csv("/Users/alex/Documents/R directory/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses= "character", na.strings = "NA")
        ## Then we create a data frame with the only columns we need
        subdat <- data[,c(2,7,11,17,23)]
        # Then we assign new names to the columns
        colnames(subdat) <- c("hospital","HST","heart attack", "heart failure", "pneumonia")
        ## Check that state and outcome are valid
        # First, we create a list of all states in the dataset
        stList <- unique(subdat[,2])
        # Then we create a vector of valid outcomes
        outList <- c("heart attack", "heart failure", "pneumonia")
        # Then we check if the state argument is valid
        if (!state %in% stList) { 
               stop("invalid state") }
                else if (!outcome %in% outList) {
                        stop("invalid outcome")    
                }
        ## Return hospital name in that state with lowest 30-day death
        ## rate        
                else {
                  
                  stateSub <- subset(subdat,HST==state, select=c("hospital",outcome))
                  stateSub[,2] <- as.numeric(stateSub[,2])                  
                  result <- stateSub[which.min(stateSub[,2]),1]
                  
                }
        result
}