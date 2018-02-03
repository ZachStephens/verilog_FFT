
module magnitude  // using look up table
(
   input wire [15:0] ima,
   input wire [15:0] rea,
   output reg [15:0] mag
);


   
   reg [15:0] 	      a,comp1,comp2;
   reg [15:0] 	      val;
   reg [31:0] 	      tmp;
   reg [15:0]		      ima_m,rea_m;
   

always_comb begin
   if(ima[15] == 0) ima_m = {0,ima[14:0]};
   else begin
      comp1 = 17'b11111111111111111 - ima + 1;
      ima_m = {0,comp1[14:0]};
   end
    if(rea[15] == 0) rea_m = {0,rea[14:0]};
   else begin
      comp2 = 17'b11111111111111111 - rea + 1;
      rea_m = {0,comp2[14:0]};
   end
   
   val = 0;
   if(rea_m == 0)
     mag = ima_m;
   else if(ima_m == 0)
     mag = rea_m;
   else begin
     a = rea_m/ima_m;
      if(a >= 16'b00000100_00000000)
        mag = rea_m;
      else if(a <= 16'b00000000_01000000)
	mag = ima_m;
      else if(a > 16'b00000000_01000000 & a <= 16'b00000000_10000000) begin// 0.25-0.5
	tmp = 00000001_00010000 * ima_m;
        mag = tmp[23:8];
	end
      else if(a > 16'b00000000_10000000 && a <= 16'b00000000_11000000)begin // 0.5-0.75 
	tmp = 00000001_00111000 * ima_m;
        mag = tmp[23:8];
	end
      else if(a > 16'b00000000_11000000 && a <= 16'b00000001_00000000)begin// 0.75-1
	tmp = 00000001_10111000 * ima_m; 
        mag = tmp[23:8];
	end
      else if(a > 16'b00000001_00000000 && a <= 16'b00000001_01000000) begin //1 -1.25
        tmp = 00000001_10000000 * ima_m;
	mag = tmp[23:8];
	end
      else if(a > 16'b00000001_01000000 && a <= 16'b00000001_10000000) begin//1.25-1.5	
        tmp = 00000001_10110000 * ima_m; //1.7
        mag = tmp[23:8];
	end
      else if(a > 16'b00000001_10000000 && a <= 16'b00000001_11000000) begin//1.5-1.75
        tmp = 00000001_11101000 * ima_m; //1.9
	mag = tmp[23:8];
	end
      else if(a > 16'b00000001_11000000 && a <= 16'b00000010_00000000) begin//1.75-2
	tmp = 00000010_00011111 * ima_m; //2.1
	mag = tmp[23:8];
	end
      else if(a > 16'b00000010_00000000 && a <= 16'b00000010_01000000) begin//2-2.25 
        tmp = 00000001_01111111 * ima_m; //2.4
	mag = tmp[23:8];
	end
      else if(a > 16'b00000010_01000000 && a <= 16'b00000010_10000000)  begin//2.25-2.5
 	tmp = 00000001_10010000 * ima_m;// 2.55
	mag = tmp[23:8];      //
      end
      else if(a > 16'b00000010_10000000 && a <= 16'b00000010_11000000)  begin//2.5-2.75
	tmp = 00000001_11001000 * ima_m;// 2.8
	mag = tmp[23:8];      //
      end
      else if(a > 16'b00000010_11000000 && a <= 16'b00000011_00000000) begin  //2.75-3
	tmp = 00000010_00000000 * ima_m; //3
	mag = tmp[23:8];
	 end
      else if(a > 16'b00000011_00000000 && a <= 16'b00000011_01000000) begin  //3-3.25
	tmp = 00000010_00111000 * ima_m; //3.22
	mag = tmp[23:8];
	end
      else if(a > 16'b00000011_01000000 && a <= 16'b00000011_10000000) begin  //3.25-3.5
	tmp = 00000010_01110000 * ima_m; //3.43
	mag = tmp[23:8];      //
	end
      else if(a > 16'b00000011_10000000 && a <= 16'b00000011_11000000) begin  //3.5-3.75
	tmp = 00000010_10111000 * ima_m; //3.85 
	mag = tmp[23:8];      //
	end 
      else if(a > 16'b00000011_11000000 && a <= 16'b00000100_00000000) begin  //3.75-4
        tmp = 00000010_11110010 * ima_m; //3.95
	mag = tmp[23:8];      
      end
   end // else: !if(ima == 0)
   end

endmodule   