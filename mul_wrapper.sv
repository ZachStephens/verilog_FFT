
module mul_wrapper(

input wire [3:0][15:0] real_in,
input wire [3:0][15:0] complex_in,
input wire [3:0][15:0] real_twid,
input wire [3:0][15:0] complex_twid,
output reg [3:0][15:0] real_out,
output reg [3:0][15:0] complex_out
);

complex_mul mul_1(
	.real_in(real_in[3]),
	.complex_in(complex_in[3]),
	.twiddle_real(real_twid[3]),
	.twiddle_complex(complex_twid[3]),
	.C_out(complex_out[3]),
	.R_out(real_out[3])	
);

complex_mul mul_2(
	.real_in(real_in[2]),
	.complex_in(complex_in[2]),
	.twiddle_real(real_twid[2]),
	.twiddle_complex(complex_twid[2]),
	.C_out(complex_out[2]),
	.R_out(real_out[2])	
);

complex_mul mul_3(
	.real_in(real_in[1]),
	.complex_in(complex_in[1]),
	.twiddle_real(real_twid[1]),
	.twiddle_complex(complex_twid[1]),
	.C_out(complex_out[1]),
	.R_out(real_out[1])	
);

complex_mul mul_4(
	.real_in(real_in[0]),
	.complex_in(complex_in[0]),
	.twiddle_real(real_twid[0]),
	.twiddle_complex(complex_twid[0]),
	.C_out(complex_out[0]),
	.R_out(real_out[0])	
);



endmodule
