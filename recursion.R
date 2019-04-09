#递归操作 求解斐波那契----
f <- function(a=1,b=1,i=0) {
  d<-a+b
  a<-b
  b<-d
  i<-i+1
  print(paste("a:",a,"第",i,"次递归的d值：",d))
  if(d>100){
    return(d)
  }
  f(a,b,i)
}