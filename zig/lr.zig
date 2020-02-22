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

//***************************************************************
//  global variables
//***************************************************************
const std = @import("std");
const io = std.io;
const warn = std.debug.warn;
const Allocator = std.mem.Allocator;
const fixed_allocator = std.heap.FixedBufferAllocator;

const end = "end";

var data_entry: bool = true;

//***************************************************************

pub fn main() !void {
    var n: f32 = 0; //yup!
    var sum_x: f32 = 0.0;
    var sum_xx: f32 = 0.0;
    var sum_y: f32 = 0.0;
    var sum_yy: f32 = 0;
    var sum_xy: f32 = 0.0;
    warn("\nLR - perform linear regeression");
    warn("\nenter 'end' to stop data entry and compute LR.");
    warn("\n\n");

    var buffer: [50]u8 = undefined;
    const allocator = &fixed_allocator.init(&buffer).allocator;

    while (n < 5) {
        n += 1;
        const line = try io.readLineSlice(buffer[0..]);
        var x_y = std.mem.separate(line, ",");
        var first: bool = true;
        var x: f32 = 0.0;
        var y: f32 = 0.0;
        while (x_y.next()) |val| {
            if (first == true) {
                var trimmed = std.mem.trim(u8, val, " \n\r\t");
                x = try std.fmt.parseFloat(f32, trimmed);
                first = false;
                //warn("\nx value is {}\n", x);
                sum_x += x;
                sum_xx += x * x;
            } else {
                var trimmed = std.mem.trim(u8, val, " \n\r\t");
                y = try std.fmt.parseFloat(f32, trimmed);
                //warn("y value is {}\n", y);
                sum_y += y;
                sum_yy += y * y;
                sum_xy += x * y;
            }
        }
    }
    warn("\nsum_x is {}\n", sum_x);
    warn("sum_y is {}\n", sum_y);
    warn("sum_xx is {}\n", sum_xx);
    warn("sum_yy is {}\n", sum_yy);
    warn("sum_xy is {}\n", sum_xy);
    const m = (n * sum_xy - sum_x * sum_y) / (n * sum_xx - @exp2(f32, sum_x));
    const b = (sum_y * sum_xx - sum_x * sum_xy) / (n * sum_xx - @exp2(f32, sum_x));
    const r = (sum_xy - sum_x * sum_y / n) / @sqrt(f32, (sum_xx - @exp2(f32, sum_x) / n) * (@exp2(f32, sum_y) / 2));

    //**************************************************************
    //  print results
    //**************************************************************
    warn("\n] slope m = {}", m);
    warn("\n] y-intercept b = {}", b);
    warn("\n] correlation r = {}", r);
}
