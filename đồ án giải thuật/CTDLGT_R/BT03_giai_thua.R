giaithua <- function(n){
  if (n==0 || n==1){
    return(1)}
  else{
    return(n*giaithua(n-1))
  }
}
n<-readline("Nhap n:")
n<-as.integer(n)
giaithua(n)
