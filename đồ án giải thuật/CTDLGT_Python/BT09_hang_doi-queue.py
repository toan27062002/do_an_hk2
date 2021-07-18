# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 09:02:24 2021

@author: Toan
"""


# Khởi tạo hàng đợi
queue = ['a']
 
# Thêm các phần tử vào hàng đợie
queue.append('b')
queue.append('c')
queue.append('d')
 
print("Initial queue")
print(queue)
 
# Xóa các phần tử khỏi hàng đợi
print("\nElements dequeued from queue")
print(queue.pop(0))
print(queue.pop(0))

print("\nQueue after removing elements")
print(queue)
 
# bỏ print(queue.pop(0))
# sẽ tăng và IndexError
# vì hàng đợi bây giờ trống