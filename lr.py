#!/usr/bin/env python
# *************************************************
#
#
#   program: LR: Linear Regression
#   programmer: unrahul
#   original: http://www.pgccphy.net/Linreg/linreg_py.txt
#   Language: Python 3
#   Version: 0.0.1
#   Description: This program performs linear
#                regression analysis for a set
#                set of data iven as (x,y) pairs.
#                The output is the slope and
#                y-intercept of the least squares
#                best fit straight line through the
#                data points
#
#   Files: Source files:
#           lr.py                   Main program
#
#   Reason: I am fascinated by the original code,
#           the various implementaitons and the
#           style that I wanted to replicate it.
#
# *************************************************

from math import sqrt

#
# print introductory message.
#

print("LR - perform linear regerssion")
print("enter 'end' to stop data entry and compute LR.")

#
# initialize sums
#

n = 0.0
sumx  = 0.0
sumx2 = 0.0
sumy  = 0.0
sumy2 = 0.0
sumxy = 0.0
data_entry = True

#
# start of data entry loop
#

while data_entry:
    string = input("\n x: ")
    if string == "end" or str == "END":
        data_entry = False
    else:
        x = float(string)
        y = float(input(" y: "))
        n += 1.0                    # compute sums
        sumx  += x
        sumx2 += x * x
        sumxy += x * y
        sumy  += y
        sumy2 += y * y

#
# compute slope - m, y-intercept - b and correlation coefficient - r
#

m = (n * sumxy - sumx * sumy) / (n * sumx2 - sumx ** 2)
b = (sumy * sumx2 - sumx * sumxy) / (n * sumx2 - sumx ** 2)
r = (sumxy - sumx * sumy / n) / sqrt((sumx2 - sumx ** 2 / n) * (sumy ** 2 / n))

#
# print results
#

print("\n] slope m = {:3.3f}".format(m))
print("] y-intercept b = {:3.3f}".format(b))
print("] correlation r = {:3.3f}".format(r))
