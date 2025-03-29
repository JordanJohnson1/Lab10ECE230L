module top(
    input [15:0] sw,
    input btnC,
    output [15:0] led
);
    // Part 1: D-Latch single bit
    d_latch part1(
        .D(sw[0]),
        .E(btnC),
        .Q(led[0]),
        .NotQ(led[1])
    );

    // Part 2: 4-byte memory system
    memory_system part2(
        .data(sw[15:8]),
        .addr(sw[7:6]),
        .store(btnC),
        .memory(led[15:8])
    );
endmodule