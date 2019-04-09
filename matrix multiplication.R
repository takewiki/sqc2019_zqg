#矩阵的乘积:%*%
mat1<-matrix(c(1:12),3,4)
mat2<-matrix(c(1:16),4,4)
mat1%*%mat2
#矩阵的乘积，调用方法
f<-function(x,y){
  nrowx<-dim(x)[2]
  ncoly<-dim(y)[1]
  m<-dim(x)[1]
  n<-dim(y)[2]
  if(nrowx != ncoly){
    print("矩阵维度不一致")
    return(0)
  }
  mat<-matrix(0,dim(x)[1],dim(y)[2])
  for (i in c(1:m)) {
    for (j in c(1:n)) {
      mat[i,j]=sum(x[i,]*y[,j])#x的第i层*y的第j列
    }
  }
  return(mat)
 
}
