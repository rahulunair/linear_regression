//**************************************************************
//
//
//  program: LR: Linear Regression
//  programmer: unrahul
//  language: zig (version:0.5.0+dca19b675)
//  version: 0.0.1
//  description: this program performs linear
//               regression analysis for a set
//               of data in as (x, y) pairs. The
//               output is the slope and y-intercept
//               of the least squares best fit
//               straight line through the data points.
//
//  files: source files:
//          lr.zig                     main program
//
//
//***************************************************************

//***************************************************************
//  library imports
//***************************************************************
const std = @import("std");
const stdin = std.io.getStdIn();
const warn = std.debug.warn;
//***************************************************************

//***************************************************************
//  global variables
//***************************************************************
var input: [20]u8 = undefined;
var n: f32 = 0;
var x: f32 = 0.0;
var y: f32 = 0.0;
var sum_x: f32 = 0.0;
var sum_xx: f32 = 0.0;
var sum_y: f32 = 0.0;
var sum_yy: f32 = 0;
var sum_xy: f32 = 0.0;
//***************************************************************

pub fn main() !void {
    warn("\nLR - perform linear regeression", .{});
    warn("\n\n", .{});
    warn("How many (x, y) pairs do you have? ", .{});
    const num = try stdin.read(&input);
    warn("Number of pairs {}", .{num});
    while (@floatToInt(u8, n) <= num) {
        warn("\nloop number: {}", .{@floatToInt(u8, n)});
        n += 1;
        var buffer: [50]u8 = undefined;
        warn("\nEnter x: ", .{});
        x = @intToFloat(f32, try stdin.read(&buffer));
        warn("Enter y: ", .{});
        y = @intToFloat(f32, try stdin.read(&buffer));
        sum_x += x;
        sum_xx += x * x;
        sum_y += y;
        sum_yy += y * y;
        sum_xy += x * y;
    }
    warn("total n {}", .{n});
    const m = (n * sum_xy - sum_x * sum_y) / (n * sum_xx - @exp2(sum_x));
    const b = (sum_y * sum_xx - sum_x * sum_xy) / (n * sum_xx - @exp2(sum_x));
    const r = (sum_xy - sum_x * sum_y / n) / @sqrt((sum_xx - @exp2(sum_x) / n) * (@exp2(sum_y) / 2));
    //**************************************************************
    //  print results
    //**************************************************************
    warn("\n] slope m = {}", .{m});
    warn("\n] y-intercept b = {}", .{b});
    warn("\n] correlation r = {}", .{r});
}
