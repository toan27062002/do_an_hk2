# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 08:01:59 2021

@author: Toan
"""

def giaithua(n):
    if n == 0 or n ==1:
        return 1
    else:
        return (n*giaithua(n-1))

n = int(input('n = '))  
print('Giai thừa của',n,'là:',giaithua(n))