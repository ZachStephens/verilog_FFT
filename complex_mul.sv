

module complex_mul(
input wire signed [15:0] real_in,
input wire signed [15:0] complex_in,
input wire signed [15:0] twiddle_real,
input wire signed [15:0] twiddle_complex,
output reg signed [15:0] C_out,
output reg signed [15:0] R_out
);

reg signed [31:0] tmpR,tmpC;

always_comb
begin
	tmpR = real_in * twiddle_real - complex_in * twiddle_complex;
	tmpC = real_in * twiddle_complex + twiddle_real * complex_in;

	R_out = {tmpR[31],tmpR[29:15]};
	C_out = {tmpC[31],tmpC[29:15]};
end
endmodule

