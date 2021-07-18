# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 09:24:37 2021

@author: Toan
"""

def partition(arr, low, high):
    i = (low-1)         
    pivot = arr[high]    
    for j in range(low, high):
        if arr[j] <= pivot:
            i = i+1
            arr[i], arr[j] = arr[j], arr[i]
    arr[i+1], arr[high] = arr[high], arr[i+1]
    return (i+1)


def quickSort(arr, low, high):
    if len(arr) == 1:
        return arr
    if low < high:
        pi = partition(arr, low, high)
        quickSort(arr, low, pi-1)
        quickSort(arr, pi+1, high)
  

arr = [10, 7, 8, 9, 1, 5]
n = len(arr)
quickSort(arr, 0, n-1)
print("Sorted array is:")
for i in range(n):
    print("%d" % arr[i])

def sort(array):
    less = []
    equal = []
    greater = []
    if len(array) > 1:
        pivot = array[0]
        for x in array:
            if x < pivot:
                less.append(x)
            elif x == pivot:
                equal.append(x)
            elif x > pivot:
                greater.append(x)
        return sort(less)+equal+sort(greater)
    else:  # xử lý phần ở cuối đệ quy - khi chỉ có một phần tử trong mảng của mình, chỉ cần trả về mảng. 
        return array

array=[19,33,11,55,33]
print(sort(array))