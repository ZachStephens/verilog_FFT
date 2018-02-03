
module topwrapper(
input wire clk,
input wire n_rst,
input wire data_in,
input wire clk_in,
input wire ss,
output reg [0:127][15:0] outReal,outComplex
);


reg [0:127][7:0] loadtoFFT;
reg [3:0] stage_select;
reg [3:0] mul_count;

reg shift_enable,load_buffer_shift;
reg [7:0]load_in;

reg clk_pulse,clk_pulse_fall;

flex_stp_sr #(.NUM_BITS(8),.SHIFT_MSB(0)) STP (
	.clk(clk),
	.n_rst(n_rst),
	.shift_enable(shift_enable), // from rcu
	.serial_in(data_in),
	.parallel_out(load_in)
);

rcu RCU_main(
	.clk(clk),
	.n_reset(n_rst),
   	.spi_clk(clk_pulse),   //from edge pulse
	.spi_clk_fall(clk_pulse_fall),
	.ss(ss),
  	.stage_select(stage_select),
	.shift_lb(load_buffer_shift), //to load buffer
	.shift_s2p(shift_enable),
	.mul_cnt(mul_count)
);

loading_buffer LBuff(
	.clk(clk),
	.n_rst(n_rst),
	.shift_in(load_buffer_shift), // from rcu
	.data_in(load_in),
	.buffer_out(loadtoFFT)
);


edge_detect PULSE(
.clk(clk),
.n_rst(n_rst),
.d_plus(clk_in),
.d_edge(clk_pulse)
);

edge_detect_fall PULSE_fall(
.clk(clk),
.n_rst(n_rst),
.d_plus(clk_in),
.d_edge(clk_pulse_fall)
);


FFT  Fblock(
	.clk(clk),
	.n_rst(n_rst),
	.loading_buffer(loadtoFFT),
	.stage_select(stage_select),
	.mul_count(mul_count),
	.outReal(outReal),
	.outComplex(outComplex)
);


















endmodule
