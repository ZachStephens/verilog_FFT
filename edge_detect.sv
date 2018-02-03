
module edge_detect(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	output wire d_edge
);

	reg q1, q2;
always_ff @(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		q1<=1;
		q2<=1;
	end
	else
	begin
		q1<=d_plus;
		q2<=q1;
	end
end

assign d_edge = ~q1&q2;

endmodule
