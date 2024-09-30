module tb();

reg clk = 0;
reg start = 0;
reg [7:0] txin = 0;
wire tx;
reg rx = 0;
wire [7:0] rxout;
wire rxdone, txdone;

wire txrx;

top dut(clk, start, txin, txrx, txrx, rxout, rxdone, txdone);

integer i = 0;

initial begin
start = 1;

for(i = 0; i<10; i = i + 1)begin
    txin = $urandom_range(10,200);
    @(posedge txdone);
    @(posedge rxdone);
end
$stop;
end

always #5 clk = ~clk;

endmodule