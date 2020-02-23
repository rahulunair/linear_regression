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
const fmt = std.fmt;
//***************************************************************

//***************************************************************
//  global variables
//***************************************************************
var n: u16 = 0;
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
    warn("\nHow many (x, y) pairs? ", .{});
    var num_buf: [20]u8 = undefined;
    const amt = try stdin.read(&num_buf);
    const line = std.mem.trimRight(u8, num_buf[0..amt], " \r\n\t");
    while (true) {
        const num = std.fmt.parseUnsigned(u16, line, 10) catch {
            continue;
        };
        if (n == num) {
            break;
        }
        n += 1; // loop counter
        warn("\nPair: {}", .{n});
        warn("\nEnter x: ", .{});
        var x_buf: [20]u8 = undefined;
        const x_len = try stdin.read(&x_buf);
        const x_line = std.mem.trimRight(u8, x_buf[0..x_len], " \r\n\t");
        x = std.fmt.parseFloat(f32, x_line) catch {
            continue;
        };

        warn("Enter y: ", .{});
        var y_buf: [20]u8 = undefined;
        const y_len = try stdin.read(&y_buf);
        const y_line = std.mem.trimRight(u8, y_buf[0..y_len], " \r\n\t");
        y = std.fmt.parseFloat(f32, y_line) catch {
            continue;
        };
        sum_x += x;
        sum_xx += x * x;
        sum_y += y;
        sum_yy += y * y;
        sum_xy += x * y;
    }
    warn("\n]- total N = {}", .{n});
    const N = @intToFloat(f32, n);
    const m = (N * sum_xy - sum_x * sum_y) / (N * sum_xx - @exp2(sum_x));
    const b = (sum_y * sum_xx - sum_x * sum_xy) / (N * sum_xx - @exp2(sum_x));
    const r = (sum_xy - sum_x * sum_y / N) / @sqrt((sum_xx - @exp2(sum_x) / N) * (@exp2(sum_y) / 2));
    //**************************************************************
    //  print results
    //**************************************************************
    warn("\n]- slope m = {}", .{m});
    warn("\n]- y-intercept b = {}", .{b});
    warn("\n]- correlation r = {}\n", .{r});
}
