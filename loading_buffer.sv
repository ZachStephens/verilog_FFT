
module loading_buffer(
	input wire clk,
	input wire n_rst,
	input wire shift_in,
	input wire [7:0] data_in,
	output reg [127:0][7:0] buffer_out

);

reg [127:0][7:0] out_buffers;
reg [127:0][7:0] nxt_buffers;
int i;


always_ff@ (posedge clk,negedge n_rst)
begin
	if(n_rst == 1'b0)
		out_buffers <= '0;	
	else
		out_buffers <= nxt_buffers;	
end


always_comb
begin
	if(shift_in == 1'b1)
	begin
		for(i=1;i<128;i++)
		begin
			nxt_buffers[i] = out_buffers[i-1] ;
		end
		nxt_buffers[0] = data_in;
	end
	else
	begin
		for(i=0;i<128;i++)begin
			nxt_buffers[i]= out_buffers[i] ;
		end
	end

	for(i=0;i<128;i++)begin
		buffer_out[i]= out_buffers[i];
	end
end


endmodule


