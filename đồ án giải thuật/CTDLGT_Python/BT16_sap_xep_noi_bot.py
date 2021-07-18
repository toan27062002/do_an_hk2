# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 09:22:24 2021

@author: Toan
"""

def bubbleSort(arr):
    n = len(arr)
    # Duyệt qua tất cả các phần tử mảng
    for i in range(n):
        # Các phần tử cuối cùng của tôi đã có sẵn
        for j in range(0, n-i-1):
            # đi qua mảng từ 0 đến n-i-1
            # Hoán đổi nếu phần tử tìm thấy lớn hơn
            # hơn phần tử tiếp theo
            if arr[j] > arr[j+1] :
                arr[j], arr[j+1] = arr[j+1], arr[j]
        print('Bước thứ',i+1,':',arr)
  
# Mã trình điều khiển để kiểm tra ở trên
arr = [64, 34, 12, 25, 90, 22, 11]
print('Mảng ban đầu:',arr)
bubbleSort(arr)
  
print ("Sorted array is:")
for i in range(len(arr)):
    print ("%d" %arr[i])