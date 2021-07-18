# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 09:30:16 2021

@author: Toan
"""

# Hợp nhất hai mảng con của arr[].
# Mảng con đầu tiên là arr[l..m]
# Mảng con thứ hai là arr[m+1..r]
def merge(arr, l, m, r):
    n1 = m - l + 1
    n2 = r- m
  
    # tạo mảng tạm thời
    L = [0] * (n1)
    R = [0] * (n2)
  
    # Sao chép dữ liệu vào tạm thời arrays L[] and R[]
    for i in range(0 , n1):
        L[i] = arr[l + i]
  
    for j in range(0 , n2):
        R[j] = arr[m + 1 + j]
  
    # Hợp nhất các mảng tạm thời trở lại arr[l..r]
    i = 0     # Chỉ mục ban đầu của mảng con đầu tiên
    j = 0     # Chỉ mục ban đầu của mảng con thứ hai
    k = l     # Chỉ mục ban đầu của mảng con đã hợp nhất
  
    while i < n1 and j < n2 :
        if L[i] <= R[j]:
            arr[k] = L[i]
            i += 1
        else:
            arr[k] = R[j]
            j += 1
        k += 1
  
    # Sao chép các phần tử còn lại của L[], nếu có cái nào
    while i < n1:
        arr[k] = L[i]
        i += 1
        k += 1
  
    # Sao chép các phần tử còn lại của R[], nếu có cái nào
    while j < n2:
        arr[k] = R[j]
        j += 1
        k += 1
  
# l là chỉ số bên trái và r là chỉ số bên phải của the sub-array của arr được sắp xếp
def mergeSort(arr,l,r):
    if l < r:
  
        # Giống như (l+r)//2, nhưng tránh tràn cho l và h lớn
        m = (l+(r-1))//2
  
        # Sắp xếp nửa thứ nhất và thứ hai
        mergeSort(arr, l, m)
        mergeSort(arr, m+1, r)
        merge(arr, l, m, r)
  
  
# Mã trình điều khiển để kiểm tra ở trên
arr = [12, 11, 13, 5, 6, 7]
n = len(arr)
print ("Given array is")
for i in range(n):
    print ("%d" %arr[i]),
  
mergeSort(arr,0,n-1)
print ("\n\nSorted array is")
for i in range(n):
    print ("%d" %arr[i]),