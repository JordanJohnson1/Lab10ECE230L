module demultiplexer(
    input [7:0] data,
    input [1:0] sel,
    output reg [7:0] A, B, C, D
);
    always @(*) begin
        A = 8'b0; B = 8'b0; C = 8'b0; D = 8'b0;
        case (sel)
            2'b00: A = data;
            2'b01: B = data;
            2'b10: C = data;
            2'b11: D = data;
        endcase
    end
endmodule
