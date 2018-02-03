
`timescale 1ns / 100ps

module tb_topwrapper
(
	output wire [7:0]data_out,
	output wire shift_out
);
reg tb_ss;
reg  tb_clk;
reg  tb_n_rst;
reg  tb_data_in;
reg  tb_clk_in;
reg [7:0] byte_invalue,data_invalue;
reg bit_invalue;
reg [0:127][15:0] tb_outReal,tb_outComplex;
reg [0:127][7:0] testdata;


parameter CLK_PERIOD = 20ns;
parameter CHK_DELAY = CLK_PERIOD/10;

	bit[7:0] twelve_bit_val;


	always 
	begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
	end

topwrapper DUT (
.clk(tb_clk),
.n_rst(tb_n_rst),
.data_in(tb_data_in),
.clk_in(tb_clk_in),
.ss(tb_ss),
.outReal(tb_outReal),
.outComplex(tb_outComplex)
);


task bit_in;//shift in 1 bit
	tb_clk_in = 0;
	#(CLK_PERIOD *4);
	tb_data_in = bit_invalue;
	tb_clk_in = 1;	
	#(CLK_PERIOD *4);	
endtask

task byte_in;//shift in 1 byte
	int i;
	byte_invalue = data_invalue;
	for(i = 0;i<8;i++) begin
		bit_invalue = byte_invalue[i];
		bit_in;
	end
endtask

task data_in;
	int i;
	for(i = 0;i<128;i++) begin
		data_invalue = testdata[i];
		byte_in;
	end
endtask




initial 
begin
int j;
	tb_clk_in = 1;
	tb_data_in = 1;
	tb_ss = 1;
	for(j=0;j<128;j+=1)
		testdata[j]=8'd255;
	//testdata[0]=8'd255;
	tb_n_rst = 1'b1;
	#(CHK_DELAY);
	tb_n_rst = 1'b0;
	@(negedge tb_clk);
	tb_n_rst = 1'b1;
	#(CLK_PERIOD*5);   	
	#(CHK_DELAY);
	@(negedge tb_clk);
	tb_ss = 0;
	#(CHK_DELAY);
	@(negedge tb_clk);
	tb_clk_in = 0;
	data_in;
	
	for(j=0;j<128;j+=1)
		testdata[j]=8'd0;
	testdata[0]=8'd255;
	data_in;
	#(CHK_DELAY);
	@(negedge tb_clk);
	tb_ss = 1;
end

endmodule
