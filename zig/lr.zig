//**************************************************************
//
//
//  program: LR: Linear Regression
//  programmer: unrahul
//  Language: zig
//  Version: 0.0.1
//  Description: This program performs linear
//               regression analysis for a set
//               of data in as (x, y) pairs. The
//               output is the slope and y-intercept
//               of the least squares best fit   
//               straight line through the data points.
//
//  Files: Source files:
//          lr.py                       Main program
//
//
//***************************************************************
const warn = std.debug.warn;
const std = @import("std");
const os = std.os;
const assert = std.debug.assert;

pub fn main() void {
    warn("\nLR - perform linear regeression");
    warn("\nenter 'end' to stop data entry and compute LR.");
    warn("\n\n");
}