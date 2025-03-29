module store_demux(
    input store,
    input [1:0] sel,
    output reg A, B, C, D
);
    always @(*) begin
        A = 0; B = 0; C = 0; D = 0;
        case (sel)
            2'b00: A = store;
            2'b01: B = store;
            2'b10: C = store;
            2'b11: D = store;
        endcase
    end
endmodule
