# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 08:57:33 2021

@author: Toan
"""


# sử dụng list 
stack = ['a']
# append() chức năng để đẩy
# phần tử trong ngăn xếp
stack.append('b')
stack.append('c')
 
print('Initial stack')
print(stack)
 
# pop() lấy ra phần tử rồi xóa 
# phần tử từ ngăn xếp trong
# Đặt hàng LIFO
print('\nElements poped from stack:')
print(stack.pop())
print('\nStack after elements are poped:')
print(stack)