#管道符----
#作用：将前一步的结果传给下一步的函数
#   a%>%f(b) =f(a,b)  b%>%f(a,.,c)=f(a,b,c)
f<-function(x){
  return(x+1)
}
f1<-function(x,y,z){
  return(x+y+z)
}
x=4
x%>%f()
x%>%f1(3,.,5)
#例：计算 f(x)=sin((x+1)^2) 当x=4的时候
#第一种计算：
x<-4
a<-x+1
b<-a^2
d<-sin(b)
#第二种 管道符
f<-function(x){
  return(x+1)
}
f1<-function(x){
  return(x^2)
}
f2<-function(x){
  return(sin(x))
}
x<-4
x%>%f()%>%f1()%>%f2()
#tidyr中的untie用法：本质就是字符串拼接
#unite(data,合并的名称，合并的列，合并的列，sep='')
data<-data.frame(a1=c(1:3),a2=(1:3))
data<-unite(data,a12,a1,a2,sep='|_|')
data
#例2：拼接 日期
date<-as.Date('2019-4-9')+0:14
hour<-sample(1:24,15)
minute<-sample(1:60,15)
second<-sample(1:60,15)
dat<-data.frame(date,hour,minute,second)
datetime<-dat%>%unite(datahour,date,hour,sep=' ')%>%unite(datetime,datahour,minute,second,sep=':')

