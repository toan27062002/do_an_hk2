# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 09:13:57 2021

@author: Toan
"""

def insertionSort(arr):
    # Traverse through 1 to len(arr)
    for i in range(1, len(arr)):
        key = arr[i]
        # Move elements of arr[0..i-1], that are
        # greater than key, to one position ahead
        # of their current position
        j = i-1
        while j >= 0 and key < arr[j] :
                arr[j + 1] = arr[j]
                j -= 1
        arr[j + 1] = key
        print('Bước thứ',i+1,':',arr)
 
 
# Driver code to test above
arr = [12, 11, 22, 13, 5, 6]
print('Dãy ban đầu:',arr)
insertionSort(arr)
print('Dãy sau khi sắp xếp:')
for i in range(len(arr)):
    print ("% d" % arr[i])