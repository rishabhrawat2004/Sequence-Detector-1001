module mealy_overlapping(
input clk,rst,
input x,
output reg y
);

parameter a= 2'b00;
parameter b= 2'b01;
parameter c= 2'b10;
parameter d= 2'b11;
reg[1:0]state,next_state;

always @(posedge clk or posedge rst)begin
  if(rst)
    state<=a;
  else
    state<=next_state;
end

always @(*)begin
y=0;
  case(state)
    a: begin
	if(x==0)
	  next_state=a;
	else
	  next_state=b;
    end

    b: begin
	if(x==0)
	  next_state=c;
	else
	  next_state=b;
    end

    c: begin
	if(x==0)
	  next_state=d;
	else
	  next_state=b;
    end

    d: begin
	if(x==1)begin
	  next_state=b;
	  y=1;
	end
	else
	  next_state=a;
    end

    default: begin
	  next_state=a;
	  y=0;
    end
  endcase
end

endmodule

// TESTBENCH

module tb_mealy_overlapping;
reg clk,rst;
reg x;
wire y;

mealy_overlapping dut(clk,rst,x,y);
initial begin
    clk=0;
    forever #5 clk=~clk;
end
initial begin
    $monitor("%dns:clk=%b.rst=%b,x=%b,y=%b",$time,clk,rst,x,y);
    rst=1; x=0;
    #10 rst=0;
    #10 x=1;
    #10 x=0;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #20 $finish;
end

endmodule