best<- function(state,outcome){
        
        data<- read.csv("outcome-of-care-measures.csv",colClasses = "character",na.strings = "Not Available")
        
        outcomes <- c("heart attack","heart failure","pneumonia")
        states <-unique(data[,7])
        
        if(!state %in% states){
                stop(print("invalid state"))
        }
        if(!outcome %in% outcomes){
                stop(print("invalid outcome"))
        }
        if(outcome=="heart attack"){
                col_data<-13
        }
        if(outcome=="heart failure"){
                col_data<-19
        }
        if(outcome=="pneumonia"){
                col_data<-25
        }
        data_state<- data[data$State ==state,]
        
        min<- which.min(as.double(data_state[,col_data]))
        data_state[min,"Hospital.Name"]
        
}
