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
//          lr.zig                     Main program
//
//
//***************************************************************
const warn = std.debug.warn;
const std = @import("std");
const os = std.os;
const assert = std.debug.assert;

const end = "end";

var n: u32 = 0;
var sum_x: f32  = 0.0;
var sum_xx: f32 = 0.0;
var sum_y: f32  = 0.0;
var sum_yy: f32 = 0;
var sum_xy: f32 = 0.0;
var data_entry: bool = true;

pub fn main() void {
    warn("\nLR - perform linear regeression");
    warn("\nenter 'end' to stop data entry and compute LR.");
    warn("\n\n");
    warn("{}", sum_x);

    
}