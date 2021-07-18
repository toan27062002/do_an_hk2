# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
def thapHaNoi(n, goc, trung, dich):

    if n == 1:
        print("from ", goc, "to ", dich)
    else:
        thapHaNoi(n-1,goc,dich ,trung)
        print("from ", goc, "to ", dich)
        thapHaNoi(n-1,trung,goc, dich)

thapHaNoi(3,'A','B','C')
