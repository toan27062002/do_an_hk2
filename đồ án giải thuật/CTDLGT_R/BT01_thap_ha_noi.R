# Tháp Hà Nội
THN <- function(n, A, B, C){
  if(n == 1){
    cat("Move disk 1 from", A, "to", B,'\n')
    return()}
  THN(n-1, A, B, C)  
  cat("Move disk", n, "from", A, "to", B,'\n')
  THN(n-1, B, C, A)
}
n = 4
THN(n, "A", "B", "C")