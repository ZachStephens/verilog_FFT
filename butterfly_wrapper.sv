
module butterfly_wrapper(
input wire [127:0][15:0] real_in,
input wire [127:0][15:0] complex_in,
output reg [127:0][15:0] real_out,
output reg [127:0][15:0] complex_out
);


genvar i;
generate
	for(i=0;i<64;i=i+1)begin
		butterfly Blist(
		.real_1(real_in[i]),

		.complex_1(complex_in[i]),

		.real_2(real_in[i+64]),

		.complex_2(complex_in[i+64]),

		.out_real_1(real_out[i]),

		.out_complex_1(complex_out[i]),

		.out_real_2(real_out[i+64]),

		.out_complex_2(complex_out[i+64])
		);

	end
endgenerate
endmodule 