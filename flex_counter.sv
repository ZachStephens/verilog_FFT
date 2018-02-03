
module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [(NUM_CNT_BITS-1):0] rollover_val,
	output wire [(NUM_CNT_BITS-1):0] count_out,
	output wire rollover_flag
);
	reg [(NUM_CNT_BITS-1):0] q;
	reg [(NUM_CNT_BITS-1):0] next; 
	reg out;
	reg nextout;
	
always_comb 
begin	
	if(count_out == rollover_val)
	begin
		next = 1;
	end
	else 
	begin
		next = q + 1;
	end
	if (rollover_val == next)
	begin
		nextout = 1;
	end
	else
	begin
		nextout = 0;
	end
	
end

assign count_out = q;
assign rollover_flag = out;


always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 1'b0)
	begin
		q <= '0;
		out <= '0;
	end
	else if (clear == 1'b1) 
	begin
		q <= '0;
		out <= '0;
	end
	else if (count_enable == 1'b1)
	begin
		q <= next;
		out <= nextout;
	end
	else
	begin
		q <= q;
		out <= out;
	end
	
end


endmodule
