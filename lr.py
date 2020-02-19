#!/usr/bin/env python
# *************************************************************
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
# *************************************************************

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
sum_x  = 0.0
sum_xx = 0.0
sum_y  = 0.0
sum_yy = 0.0
sum_xy = 0.0
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
        sum_x  += x
        sum_xx += x * x
        sum_xy += x * y
        sum_y  += y
        sum_yy += y * y

#
# compute slope - m, y-intercept - b and correlation coefficient - r
#

m = (n * sum_xy - sum_x * sum_y) / (n * sum_xx - sum_x ** 2)
b = (sum_y * sum_xx - sum_x * sum_xy) / (n * sum_xx - sum_x ** 2)
r = (sum_xy - sum_x * sum_y / n) / sqrt((sum_xx - sum_x ** 2 / n) * (sum_y ** 2 / n))

#
# print results
#

print("\n] slope m = {:3.3f}".format(m))
print("] y-intercept b = {:3.3f}".format(b))
print("] correlation r = {:3.3f}".format(r))
