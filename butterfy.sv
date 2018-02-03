
module butterfly(
input wire signed [15:0] real_1,
input wire signed [15:0] complex_1,
input wire signed [15:0] real_2,
input wire signed [15:0] complex_2,
output reg signed [15:0] out_real_1,
output reg signed [15:0] out_complex_1,
output reg signed [15:0] out_real_2,
output reg signed [15:0] out_complex_2,
);

always_comb
begin
	out_real_2 = real_1 + real_2;
	out_complex_2 = complex_1 + complex_2;
	out_real_1 = real_1 - real_2;
	out_complex_1 = complex_1 - complex_2;
end


endmodule
