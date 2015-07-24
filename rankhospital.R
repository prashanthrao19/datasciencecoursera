rankhospital<- function(state,outcome,num ="best"){
        
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
                col_data<-11
        }
        if(outcome=="heart failure"){
                col_data<-17
        }
        if(outcome=="pneumonia"){
                col_data<-23
        }
        data_state<- data[data$State ==state,]
        
        sort_data<- data_state[order(as.double(data_state[[col_data]]),data_state[["Hospital.Name"]], decreasing = FALSE,na.last = NA),]
        
        if (num == "best"){num=1}
        if (num == "worst"){num=nrow(sort_data)}
        sort_data[num,"Hospital.Name"]
        
        
}
