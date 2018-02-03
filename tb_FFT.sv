

`timescale 1ns / 100ps
module tb_FFT ();
   localparam CLK_PERIOD = 20;
	localparam CHECK = CLK_PERIOD/10;
   	localparam PI = 3.1415962;
   reg tb_clk,tb_n_rst;
   reg [0:127][7:0] tb_loading_buffer;
	reg [3:0] tb_stage_select;
	reg [3:0] tb_mul_count;
	reg [0:127][15:0]tb_outReal;
	reg [0:127][15:0]tb_outComplex;
	

initial begin
int j;

for(j=0;j<128;j+=1)begin
//	tb_loading_buffer[j]=8'd0;
//tb_loading_buffer[0]=8'd255;


	tb_loading_buffer[j-1]=8'd127;
	tb_loading_buffer[j]=8'd90;
	tb_loading_buffer[j+1]=8'd0;
	tb_loading_buffer[j+2]=8'd90;
	tb_loading_buffer[j+3]=8'd127;
	tb_loading_buffer[j+4]=8'd172;
	tb_loading_buffer[j+5]=8'd255;
	tb_loading_buffer[j+6]=8'd172;

end



/*
   	tb_loading_buffer[0]  = 8'd25;
 	tb_loading_buffer[1]  = 8'd25;
        tb_loading_buffer[2]  = 8'd25;
        tb_loading_buffer[3]  = 8'd25;
        tb_loading_buffer[4]  = 8'd25;
        tb_loading_buffer[5]  = 8'd25;
        tb_loading_buffer[6]  = 8'd25;
        tb_loading_buffer[7]  = 8'd25;
        tb_loading_buffer[8]  = 8'd25;
        tb_loading_buffer[9]  = 8'd25;
        tb_loading_buffer[10]  = 8'd25;
        tb_loading_buffer[11]  = 8'd25;
        tb_loading_buffer[12]  = 8'd25;
        tb_loading_buffer[13]  = 8'd25;
        tb_loading_buffer[14]  = 8'd25;
        tb_loading_buffer[15]  = 8'd25;
        tb_loading_buffer[16]  = 8'd25;
        tb_loading_buffer[17]  = 8'd25;
        tb_loading_buffer[18]  = 8'd25;
        tb_loading_buffer[19]  = 8'd25;
        tb_loading_buffer[20]  = 8'd25;
        tb_loading_buffer[21]  = 8'd25;
        tb_loading_buffer[22]  = 8'd25;
        tb_loading_buffer[23]  = 8'd25;
        tb_loading_buffer[24]  = 8'd25;
        tb_loading_buffer[25]  = 8'd25;
        tb_loading_buffer[26]  = 8'd25;
        tb_loading_buffer[27]  = 8'd25;
        tb_loading_buffer[28]  = 8'd25;
        tb_loading_buffer[29]  = 8'd25;
        tb_loading_buffer[30]  = 8'd25;
        tb_loading_buffer[31]  = 8'd25;
        tb_loading_buffer[32]  = 8'd25;
        tb_loading_buffer[33]  = 8'd25;
        tb_loading_buffer[34]  = 8'd25;
        tb_loading_buffer[35]  = 8'd25;
        tb_loading_buffer[36]  = 8'd25;
        tb_loading_buffer[37]  = 8'd25;
        tb_loading_buffer[38]  = 8'd25;
        tb_loading_buffer[39]  = 8'd25;
        tb_loading_buffer[40]  = 8'd25;
        tb_loading_buffer[41]  = 8'd25;
        tb_loading_buffer[42]  = 8'd25;
        tb_loading_buffer[43]  = 8'd25;
        tb_loading_buffer[44]  = 8'd25;
        tb_loading_buffer[45]  = 8'd25;
        tb_loading_buffer[46]  = 8'd25;
        tb_loading_buffer[47]  = 8'd25;
        tb_loading_buffer[48]  = 8'd25;
        tb_loading_buffer[49]  = 8'd25;
        tb_loading_buffer[50]  = 8'd25;
        tb_loading_buffer[51]  = 8'd25;
        tb_loading_buffer[52]  = 8'd25;
        tb_loading_buffer[53]  = 8'd25;
        tb_loading_buffer[54]  = 8'd25;
        tb_loading_buffer[55]  = 8'd25;
        tb_loading_buffer[56]  = 8'd25;
        tb_loading_buffer[57]  = 8'd25;
        tb_loading_buffer[58]  = 8'd25;
        tb_loading_buffer[59]  = 8'd25;
        tb_loading_buffer[60]  = 8'd25;
        tb_loading_buffer[61]  = 8'd25;
        tb_loading_buffer[62]  = 8'd25;
        tb_loading_buffer[63]  = 8'd25;
        tb_loading_buffer[64]  = 8'd25;
        tb_loading_buffer[65]  = 8'd25;
        tb_loading_buffer[66]  = 8'd25;
        tb_loading_buffer[67]  = 8'd25;
        tb_loading_buffer[68]  = 8'd25;
        tb_loading_buffer[69]  = 8'd25;
        tb_loading_buffer[70]  = 8'd25;
        tb_loading_buffer[71]  = 8'd25;
        tb_loading_buffer[72]  = 8'd25;
        tb_loading_buffer[73]  = 8'd25;
        tb_loading_buffer[74]  = 8'd25;
        tb_loading_buffer[75]  = 8'd25;
        tb_loading_buffer[76]  = 8'd25;
        tb_loading_buffer[77]  = 8'd25;
        tb_loading_buffer[78]  = 8'd25;
        tb_loading_buffer[79]  = 8'd25;
        tb_loading_buffer[80]  = 8'd25;
        tb_loading_buffer[81]  = 8'd25;
        tb_loading_buffer[82]  = 8'd25;
        tb_loading_buffer[83]  = 8'd25;
        tb_loading_buffer[84]  = 8'd25;
        tb_loading_buffer[85]  = 8'd25;
        tb_loading_buffer[86]  = 8'd25;
        tb_loading_buffer[87]  = 8'd25;
        tb_loading_buffer[88]  = 8'd25;
        tb_loading_buffer[89]  = 8'd25;   
        tb_loading_buffer[90]  = 8'd25;
        tb_loading_buffer[91]  = 8'd25;
        tb_loading_buffer[92]  = 8'd25;
        tb_loading_buffer[93]  = 8'd25;
        tb_loading_buffer[94]  = 8'd25;
        tb_loading_buffer[95]  = 8'd25;
        tb_loading_buffer[96]  = 8'd25;
        tb_loading_buffer[97]  = 8'd25;
        tb_loading_buffer[98]  = 8'd25;
        tb_loading_buffer[99]  = 8'd25;
        tb_loading_buffer[100]  = 8'd25;
        tb_loading_buffer[101]  = 8'd25;
        tb_loading_buffer[102]  = 8'd25;
        tb_loading_buffer[103]  = 8'd25;
        tb_loading_buffer[104]  = 8'd25;
        tb_loading_buffer[105]  = 8'd25;
        tb_loading_buffer[106]  = 8'd25;
        tb_loading_buffer[107]  = 8'd25;
        tb_loading_buffer[108]  = 8'd25;
        tb_loading_buffer[109]  = 8'd25;
        tb_loading_buffer[110]  = 8'd25;
        tb_loading_buffer[111]  = 8'd25;
        tb_loading_buffer[112]  = 8'd25;
        tb_loading_buffer[113]  = 8'd25;
        tb_loading_buffer[114]  = 8'd25;
        tb_loading_buffer[115]  = 8'd25;
        tb_loading_buffer[116]  = 8'd25;
        tb_loading_buffer[117]  = 8'd25;
        tb_loading_buffer[118]  = 8'd25;
        tb_loading_buffer[119]  = 8'd25;
        tb_loading_buffer[120]  = 8'd25;
        tb_loading_buffer[121]  = 8'd25;
        tb_loading_buffer[122]  = 8'd25;
        tb_loading_buffer[123]  = 8'd25;
        tb_loading_buffer[124]  = 8'd25;
        tb_loading_buffer[125]  = 8'd25;
        tb_loading_buffer[126]  = 8'd25;
        tb_loading_buffer[127]  = 8'd25;
        tb_loading_buffer[128]  = 8'd25;
*/
 end  
	

   always begin
      tb_clk = 1'b0;
      #(CLK_PERIOD/2.0);
      tb_clk = 1'b1;
      #(CLK_PERIOD/2.0);
    end


   FFT Ix (.clk(tb_clk),.n_rst(tb_n_rst),.loading_buffer(tb_loading_buffer),.stage_select(tb_stage_select),.mul_count(tb_mul_count),.outReal(tb_outReal),.outComplex(tb_outComplex));


	task multask;
		int i;
		for(i=1;i<16;i++)begin
			@(posedge tb_clk);
			#CHECK;	
			tb_mul_count = i;
		end
	endtask


   initial begin
      tb_n_rst = 0;
      tb_stage_select = 0;
      tb_mul_count = 0;

      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 0;
      tb_mul_count = 0;
      
      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 1;
      tb_mul_count = 0;

      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 2;
      tb_mul_count = 0;

	@(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 3;
      tb_mul_count = 0;
	multask;

     

      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 4;
      tb_mul_count = 0;

     @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 5;
      tb_mul_count = 0;
	multask;



      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 6;
      tb_mul_count = 0;
      

       @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 7;
      tb_mul_count = 0;
	multask;
       

      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 8;
      tb_mul_count = 0;
      

      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 9;
      tb_mul_count = 0;
	multask;



      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 10;
      tb_mul_count = 0;
            
      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 11;
      tb_mul_count = 0;
	multask;



      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select= 12;
      tb_mul_count = 0;

      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 13;
      tb_mul_count = 0;
	multask;


      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 14;
      tb_mul_count = 0;


      @(posedge tb_clk);
	#CHECK;
      tb_n_rst = 1;
      tb_stage_select = 15;
      tb_mul_count = 0;

   end // initial begin
   endmodule
 

      
   
   
  
