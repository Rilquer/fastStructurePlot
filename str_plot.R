  str_plot=function (x,samples=NA,order=NA, colors=NA){
    library(ggplot2)
    q=x
    
    smpl=seq(1:NROW(q))
    gr=c()
    prob=q$V1
    
    for (i in 1:NCOL(q)) {
      vec=rep(paste(i),NROW(q))
      gr=c(gr,vec)
    }
    
    for (i in 2:NCOL(q)) {
      prob=c(prob,q[,i])
    }
    
    data=data.frame(gr,smpl,prob)
    if (!is.na(samples[i])) {
      data$smpl=rep(as.character(samples),NCOL(q))
    }
    
    orddata=c()
    if (!is.na(order[1])) {
      for (i in 1:NROW(order)) {
        newdata=data[which(data[,2]==order[i]),]
        orddata=rbind(orddata,newdata)
      }
      data=orddata
      data$smpl=factor(data$smpl,level=as.character(unique(data$smpl)))
    }
    if (is.na(colors)) {
      ggplot()+geom_bar(aes(y=prob,x=smpl,fill=gr),data=data,stat='identity')+
        geom_errorbar(width=0)+
        scale_y_continuous(name='Probability')+
        scale_x_discrete(name='Samples')+
        scale_fill_discrete(name='Groups')+
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
    } else {
      ggplot()+geom_bar(aes(y=prob,x=smpl,fill=gr),data=data,stat='identity')+
        geom_errorbar(width=0)+
        scale_y_continuous(name='Probability')+
        scale_x_discrete(name='Samples')+
        scale_fill_manual(name='Groups', values = colors)+
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
    }
  }
