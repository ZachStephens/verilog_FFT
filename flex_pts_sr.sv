

module flex_pts_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire load_enable,
	input wire [NUM_BITS-1:0] parallel_in,
	output wire serial_out
);

	reg [NUM_BITS-2:0] q;
	reg out;

always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 1'b0)
	begin
	q[NUM_BITS-2:0] <= '1;
	out<=1;
	end
	else if (load_enable == 1)
	begin
		if (SHIFT_MSB == 1)
		begin
			q[NUM_BITS-2:0] <= parallel_in[NUM_BITS-2:0];
			out <= parallel_in[NUM_BITS-1];
		end
		else
		begin
			q[NUM_BITS-2:0] <= parallel_in[NUM_BITS-1:1];
			out <= parallel_in[0];
		end	
	end
	else if (shift_enable == 1)
	begin
		if (SHIFT_MSB == 1)
		begin
			q[NUM_BITS-2:0]<={q[NUM_BITS-3:0],1'b1};
			out<=q[NUM_BITS-2];
		end
		else
		begin
			q[NUM_BITS-2:0]<={1'b1,q[NUM_BITS-2:1]};
			out<=q[0];
		end
	end	
	else
	begin
		q[NUM_BITS-2:0]<=q[NUM_BITS-2:0];
		out <= out;
	end
end
assign serial_out=out;
endmodule 