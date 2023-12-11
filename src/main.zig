const std = @import("std");

const bars = [8][]const u8{
    "Go 'head stupid niggas go fuck wit' them chicks (go 'head)",
    "I'm the third little piggy, I'ma fuck wit' them bricks (bricks)",
    "Better yet the bakery, I got pies and cakes (cakes)",
    "Nigga think doublin' is turnin' five to eight\nI turn eight to twenty, twenty to a hunnid, hunnid to a thousand\nThat to a hunnid thousand (thousand), in front of housin' (housin')",
    "...in front of housin' (housin')\nClosed 'em all down, dawg, no one's allowed in (allowed in)\nI'm coppin' everything I'm done wit' browsin' (gimme that)",
    "It's the top don, Glock palm, dot com\nGet your shit rocked mon like Haseem Rahman (Rahman)",
    "And I'm extra scary CEOs all the frontin' ain't necessary (why?)\nI fuck your secretaries\nAll for information it ain't necessary\nThey in love like the 14th of February",
    "Play 'em like April 1st, right before I slide off (off)\nIt could be March 2nd, sound like July 4th (bah)",
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });

    const value = prng.random().intRangeAtMost(usize, 0, bars.len - 1);

    try stdout.print("\"{s}\"\n\n\t- Cam'ron\n\n", .{bars[value]});
}
