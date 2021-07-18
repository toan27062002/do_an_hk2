# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 07:52:23 2021

@author: Toan
"""


a = int(input('nhap a = '))
b = int(input('nhap b = '))

def ucln(a, b):
    if (b == 0):
        return a
    return ucln(b, a % b)
print('UCLN của',a,'và',b,'là:',ucln(a, b))
