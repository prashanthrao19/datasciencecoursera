corr<- function(directory,threshold=0)
{  
        data1<- data.frame()
        correlation <- NULL
        
        files<- list.files(path = directory, pattern =".csv",full.names = TRUE)
        for(i in 1:332) {
                data1<-  read.csv(files[i], header = TRUE,sep=",")                              
                usefuldata<-na.omit(data1)
                
                if(nrow(usefuldata)>threshold){
                        correlation<- c(correlation,cor(usefuldata[,2],usefuldata[,3]))
                }
        }  
        correlation           
        
}

