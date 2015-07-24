complete<- function(directory,id =1:332)
{  
        data1<- data.frame()
        dataframe<- NULL
        
        files<- list.files(path = directory, pattern =".csv",full.names = TRUE)
        
        for(i in id){
                data1<-  read.csv(files[i], header = TRUE,sep=",")                              
                
                usefuldata<-na.omit(data1)
                usefuldata<- as.matrix(usefuldata)
                
                dataframe<- rbind(dataframe,c(i,nrow(usefuldata)))
                dataframe<- as.data.frame(dataframe)
                names(dataframe)<- c('Id','nobs')
        }
        dataframe
        
}

