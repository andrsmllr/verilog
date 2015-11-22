module mode;
    reg e;
    reg q;
    always @ (posedge top.clk)
      q <= e;
endmodule

module modd;
    reg d;
    reg q;
    always @ (posedge top.clk)
      q <= d;
endmodule

module modc;
    reg c;
    reg q;
    mode ME ();
endmodule

module modb;
    reg b;
    reg q;
    modd MD ();
endmodule

module moda;
    reg a;
    reg q;
    modc MC ();
endmodule

module top;
    reg clk = 1'b0;
    reg q;
    
    initial
        forever begin
            #10 clk = !clk;
        end
    
    always @ (posedge clk)
      q <= moda.q ^ modb.q ^ moda.MC.q ^ moda.MC.ME.q ^ modb.MD.q;
    
    moda MA ();
    modb MB ();
endmodule
