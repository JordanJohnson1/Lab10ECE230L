module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);
    wire [7:0] mem0_out, mem1_out, mem2_out, mem3_out;
    wire [7:0] d0, d1, d2, d3;
    wire s0, s1, s2, s3;

    demultiplexer data_demux(
        .data(data),
        .sel(addr),
        .A(d0),
        .B(d1),
        .C(d2),
        .D(d3)
    );

    store_demux store_split(
        .store(store),
        .sel(addr),
        .A(s0),
        .B(s1),
        .C(s2),
        .D(s3)
    );

    byte_memory byte0(.data(d0), .store(s0), .memory(mem0_out));
    byte_memory byte1(.data(d1), .store(s1), .memory(mem1_out));
    byte_memory byte2(.data(d2), .store(s2), .memory(mem2_out));
    byte_memory byte3(.data(d3), .store(s3), .memory(mem3_out));

    multiplexer mem_mux(
        .A(mem0_out),
        .B(mem1_out),
        .C(mem2_out),
        .D(mem3_out),
        .sel(addr),
        .out(memory)
    );
endmodule