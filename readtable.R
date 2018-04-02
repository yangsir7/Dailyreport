# read.table(file, header = FALSE, sep = "", quote = "\"'", dec = ".",row.names, col.names, as.is = FALSE, na.strings = "NA",colClasses = NA, nrows = -1,skip = 0, check.names = TRUE, fill = !blank.lines.skip,strip.white = FALSE, blank.lines.skip = TRUE,comment.char = "#")G:\价签标价
h2<-fread(file = "C:\\Users\\yangquan1\\Desktop\\test.csv",sep=',',header=F)
library(data.table)
aaa<-read.csv(file = "G:\\价签标价\\pxcdb25.qCondTpsWithoutSupy.csv",sep=',',header=T,nrows = 10000)
bbb<-read.csv(file = "G:\\价签标价\\线下标牌价.csv",sep=',',header=T,nrows = 10000)
ccc<-fread(file = "G:\\价签标价\\线上标牌价.csv",sep=',',header=T,skip = 15000000)

xianshang<-fread(file = "G:\\价签标价\\pxcdb25.qCondTpsWithoutSupy.csv",sep=',',header=T,colClasses =c("numeric","NULL","NULL","numeric","NULL","NULL","numeric","NULL","NULL","NULL","numeric"))

xianshang0<-fread(file = "G:\\价签标价\\pxcdb25.qCondTpsWithoutSupy.csv",sep=',',header=T,colClasses =c("numeric","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL"))
xianshang<-as.data.table(xianshang)
head(xianshang)
xianshang2<-xianshang[!duplicated(xianshang),]
xianshang3<-xianshang2[!duplicated(xianshang2[,1:2]),]
# xianshang01<-xianshang0[!duplicated(xianshang0),]
rm(aaa,bbb)
gc()
xianxia<-fread(file = "G:\\价签标价\\线下标牌价.csv",sep=',',header=T,colClasses =c("NULL","NULL","NULL","numeric","NULL","NULL","numeric","NULL","NULL","NULL","NULL","numeric"))
xianxia2<-xianxia[!duplicated(xianxia),]
xianxia3<-xianxia2[!duplicated(xianxia2[,1:2]),]
huizong<-merge.data.frame(xianxia3,xianshang3,by=c("matl","saleOrg"),all.x = T)
setnames(huizong,c("matl","saleOrg","value_xianxia","value_xianshang"))
huizong<-as.data.table(huizong)
huizong<-huizong[!is.na(value_xianshang),]
head(huizong)


write.csv(huizong[5000001:5781989,],file = 'C:\\Users\\yangquan1\\Desktop\\价格对比6.csv',row.names=F)
rm(list = ls(all=T))
gc()

