
module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output wire [(NUM_BITS-1):0] parallel_out
);

	reg [(NUM_BITS-1):0] q;

always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 1'b0)
	begin
		q[(NUM_BITS-1):0] <= '1;//how to sero fill?
	end
	else if (shift_enable == 1'b1)
	begin
		if (SHIFT_MSB == 0)
		begin
			q[(NUM_BITS-1):0]<={serial_in,q[(NUM_BITS-1):1]};
		end
		else
		begin
			q[(NUM_BITS-1):0]<={q[(NUM_BITS-2):0],serial_in};
		end
	end
	else
	begin
		q[(NUM_BITS-1):0] <= q[(NUM_BITS-1):0];
	end		
end
	assign parallel_out[(NUM_BITS-1):0] = q[(NUM_BITS-1):0];
endmodule
