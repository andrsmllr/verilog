module cases(
    data,
    sel,
    res
);

input  data;
input  sel;
output res;

wire [7:0] data;
wire [3:0] sel;
reg  [1:0] res;

// Verilog-1995 case statement.
always @ (data, sel)
begin
    case (sel)
        4'b0001:
            res = data[1:0];
        4'b0010:
            res = data[3:2];
        4'b0100:
            res = data[5:4];
        4'b1000:
            res = data[7:6];
        default:
            res = 2'b00;
    endcase
end

// Verilog- casex statement.

// Verilog- casez statement.

endmodule
