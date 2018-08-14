str_plot=function (x,y=NA,order=NA){
  library(ggplot2)
  q=read.table(x,sep='')
  
  index=seq(1:NROW(q))
  gr=c()
  prob=q$V1
  
  for (i in 1:NCOL(q)) {
    vec=rep(paste(i),NROW(q))
    gr=c(gr,vec)
  }
  
  for (i in 2:NCOL(q)) {
    prob=c(prob,q[,i])
  }
  
  data=data.frame(gr,index,prob)
  if (!is.na(y[i])) {
    smpl=rep(as.character(y),NCOL(q))
    data=data.frame(gr,smpl,index,prob)
  }
  
  orddata=c()
  if (!is.na(order[1])) {
    for (i in 1:NROW(order)) {
      newdata=data[which(data[,2]==order[i]),]
      orddata=rbind(orddata,newdata)
    }
    newindex=c()
    for (i in 1:NROW(q)){
      newindex=c(newindex,rep(i,2))
    }
    orddata$index=newindex
    data=orddata
  }
  
  if (!is.na(y[i])) {
  ggplot()+geom_bar(aes(y=prob,x=index,fill=gr),data=data,stat='identity')+
    geom_errorbar(width=0)+
    scale_y_continuous(name='Probability')+scale_fill_discrete(name='Groups')+
    scale_x_discrete(name='Samples',labels=data$smpl)
  } else {
    ggplot()+geom_bar(aes(y=prob,x=index,fill=gr),data=data,stat='identity')+
      geom_errorbar(width=0)+
      scale_y_continuous(name='Probability')+scale_fill_discrete(name='Groups')
  }
}
