
module rcu
#(
   parameter [4:0] idle = 5'd0,
	                   stage0 = 5'd1,
	                   stage1 = 5'd2,
	                   stage2 = 5'd3,
	                   stage3 = 5'd4,
	                   stage4 = 5'd5,
	                   stage5 = 5'd6,
	                   stage6 = 5'd7,
	                   stage7 = 5'd8,
	                   stage8 = 5'd9,
	                   stage9 = 5'd10,
	                   stage10 = 5'd11,
	                   stage11 = 5'd12,
	                   stage12 = 5'd13,
	                   stage13 = 5'd14,
	                   stage14 = 5'd15,
	                   stage15 = 5'd16,
	                   stage16 = 5'd17,
	                   loading = 5'd18,
			   load_lb = 5'd19,
				stage17 =5'd20
)            
(
  	input wire clk,
 	input wire n_reset,
 	input wire spi_clk,   
	input wire spi_clk_fall,
	input wire ss,
   	output reg [3:0] stage_select,
	output reg shift_lb,//when counter flag reaches 8
	output reg shift_s2p,//every spi clk 
  	output [3:0] mul_cnt	
);


reg NA;
//
reg enable_i3,nxt_enable_i3,nxt_shift_s2p,nxt_shift_lb;

reg running;

reg [4:0] current_state, next_state;
reg r_flag;

reg 	 input_enable,mul_enable,clear_sig;
reg [7:0] count_out;
reg[3:0] count_out2;
reg clear_128;

//count 8 bits coming from spi
flex_counter #(.NUM_CNT_BITS(4)) I3 (.clk(clk),.n_rst(n_reset),.clear(1'b0),.count_enable(enable_i3),.rollover_val(4'd8),.count_out(count_out2),.rollover_flag(NA));//tell s2p to shift

 //counts for 128 values
flex_counter #(.NUM_CNT_BITS(8)) I0 (.clk(clk),.n_rst(n_reset),.clear(clear_128),.count_enable(shift_lb),.rollover_val(8'd128),.count_out(count_out),.rollover_flag(input_enable));


//mul counter
flex_counter #(.NUM_CNT_BITS(4)) I1 (.clk(clk),.n_rst(n_reset),.clear(clear_sig),.count_enable(mul_enable),.rollover_val(4'd15),.count_out(mul_cnt),.rollover_flag(r_flag));
   
always_ff @(negedge n_reset, posedge clk)
begin
	if(n_reset == 1'b0) current_state <= idle;
	else 
	begin
		current_state <= next_state;
		enable_i3 <= nxt_enable_i3;	
		shift_s2p<=nxt_shift_s2p;
		shift_lb<=nxt_shift_lb;
	end
end


always_comb
begin

	next_state = current_state;
	case(current_state)
	idle: if(spi_clk_fall == 1 && ss == 0) next_state = load_lb;
	load_lb: if(input_enable) next_state= loading;//idle
	loading: next_state = stage2;              //loading                                                                                                                    
	stage2:next_state = stage3;               //first butterfly
	stage3:if(r_flag) next_state = stage4;    //first multiply
        stage4:next_state = stage5;               //second butterfly
	stage5:if(r_flag) next_state = stage6;    //second multiply
	stage6:next_state = stage7;              //third butterfly
	stage7:if(r_flag) next_state = stage8;   //third multiply
	stage8:next_state = stage9;              //fourth butterfly
        stage9:if(r_flag) next_state = stage10;  //fourth multiply
	stage10:next_state = stage11;            //fifth butterfly
	stage11:if(r_flag) next_state = stage12; //fifth multiply
        stage12:next_state = stage13;            //sixth butterfly
        stage13:if(r_flag) next_state = stage14; //sixth multiply
	stage14:next_state = stage15;            //seventh butterfly
        stage15:    //goes to manitude block
	begin
		next_state = idle;
		if(ss == 0 || (count_out > 1))
			next_state = stage16;

	end
	stage16:
	begin	
		if((count_out2 == 3)  && (count_out ==2 ))
			next_state = loading;
		else if ((ss==1))
			next_state = stage17;
	end
	stage17:next_state = loading;
		
  endcase	  
end // always_comb begin

   

always_comb
begin

  	stage_select  = '0;
  	mul_enable = '0;
   	clear_sig = 0;
  	nxt_enable_i3 = 0;
	nxt_shift_lb = 0;
	nxt_shift_s2p = 0;
	clear_128=0;



	if(current_state != idle)
	begin
		if(spi_clk == 1)
		begin
			nxt_enable_i3 = 1;
			nxt_shift_s2p = 1;
		end
		else 
		begin
			if(count_out2 == 4'd8 && enable_i3 == 1)
				nxt_shift_lb = 1;
		end
	end

	if(current_state == idle) clear_128 = 1; 
   	if(current_state == loading) stage_select = 1;
   	if(current_state == stage2) stage_select = 2;
   	if(current_state == stage3) begin
      stage_select = 3;
      mul_enable = 1;
      end
   if(current_state == stage4) begin
      stage_select = 4;
      clear_sig = 1;
      end
   if(current_state == stage5) begin
      stage_select = 5;
      mul_enable = 1;
      end
   if(current_state == stage6) begin
      stage_select = 6;
      clear_sig = 1;
      end
   if(current_state == stage7) begin
      stage_select = 7;
      mul_enable = 1;
      end
   if(current_state == stage8) begin
      stage_select = 8;
      clear_sig = 1;
      end
   if(current_state == stage9) begin
      stage_select = 9;
      mul_enable = 1;
      end
   if(current_state == stage10) begin
      stage_select = 10;
      clear_sig = 1;
      end
   if(current_state == stage11) begin
      stage_select = 11;
      mul_enable = 1;
      end
   if(current_state == stage12)  begin
      stage_select = 12;
      clear_sig = 1;
      end
   if(current_state == stage13)  begin
      stage_select = 13;
      mul_enable = 1;
      end
   if(current_state == stage14)  begin 
      stage_select = 14; //7th buterfly
      clear_sig = 1;
      end
   if(current_state == stage15)   //load to magnitude block
	begin
		stage_select = 15;
		clear_128 = 1;
	end
	
   if(current_state == stage16) begin
	stage_select = 0; //idle state wait for 64 values
	if(ss == 1)
		nxt_shift_lb = 1;
end
   /*if(current_state == stage17)begin
		
	end*/
end // always_comb begin

   endmodule
   