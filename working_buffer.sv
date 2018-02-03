
module working_buffer(
input wire clk,
input wire n_rst,
input wire [127:0][15:0] q_in,
output reg [127:0][15:0] d_out
);


always_ff @ (posedge clk, negedge n_rst)
begin

	if (n_rst == 1'b0)
		d_out <= '0;
	else
		d_out <= q_in;		

end

endmodule
