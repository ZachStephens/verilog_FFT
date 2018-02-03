
module FFT(
input wire clk,
input wire n_rst,
input wire [0:127][7:0] loading_buffer,
input wire [3:0] stage_select,
input wire [3:0] mul_count,
output reg [0:127][15:0] outReal,
output reg [0:127][15:0] outComplex
);

reg [15:0]   twiddle_real  [0:63]= 
{
      32767,
      32729,
      32611,
      32414,
      32139,
      31785,
      31356,
      30851,
      30274,
      29622,
      28898,
      28105,
      27247,
      26319,
      25330,
      24281,
      23170,
      22007,
      20788,
      19520,
      18206,
      16846,
      15447,
      14012,
      12540,
      11040,
      9513,
      7963,
      6393,
      4807,
      3211,
      1609,
      0,
      -1609,
      -3211,
      -4807,
      -6393,
      -7963,
      -9513,
      -11040,
      -12540,
      -14012,
      -15447,
      -16846,
      -18206,
      -19520,
      -20788,
      -22007,
      -23170,
      -24281,
      -25330,
      -26319,
      -27247,
      -28105,
      -28898,
      -29622,
      -30274,
      -30851,
      -31356,
      -31785,
      -32139,
      -32414,
      -32611,
      -32727
};

reg [15:0] twiddle_complex[0:63] = 
{	0,
      1609,
      3211,
      4807,
      6393,
      7963,
      9513,
      11040,
      12540,
      14012,
      15447,
      16846,
      18206,
      19520,
      20788,
      22007,
      23170,
      24281,
      25330,
      26319,
      27247,
      28105,
      28898,
      29622,
      30274,
      30851,
      31356,
      31785,
      32139,
      32414,
      32611,
      32729,
      32768,
      32729,
      32611,
      32414,
      32139,
      31785,
      31356,
      30851,
      30274,
      29622,
      28898,
      28105,
      27247,
      26319,
      25330,
      24281,
      23170,
      22007,
      20788,
      19520,
      18206,
      16846,
      15447,
      14012,
      12540,
      11040,
      9513,
      7963,
      6393,
      4807,
      3211,
      1609
};




//add working buffer module and use port
reg signed [0:127][15:0] working_real, working_complex; 

//add destination logic and switching logic


//next values of working buffers
reg [0:127][15:0] next_real, next_complex; 


//connect to butterfly wrapper
reg [0:127][15:0] bt_inR;
reg [0:127][15:0] bt_outR;
reg [0:127][15:0] bt_inC;
reg [0:127][15:0] bt_outC;


//connect to mul wrapper
reg [3:0] count;

reg [3:0][15:0] mul_inR;
reg [3:0][15:0] mul_inC;
reg [3:0][15:0] twidR;
reg [3:0][15:0] twidC;
reg [3:0][15:0] mul_outR;
reg [3:0][15:0] mul_outC;




//iterators
int i,j,h,k;

//working buffers complex and real
	working_buffer realbuff(
		.clk(clk),
		.n_rst(n_rst),
		.q_in(next_real),
		.d_out(working_real)
);
	working_buffer complexbuff(
		.clk(clk),
		.n_rst(n_rst),
		.q_in(next_complex),
		.d_out(working_complex)
);

//portmap for the butterflies stages 1,3,5,7,9,11,13
	butterfly_wrapper BW(
	.real_in(bt_inR),
	.complex_in(bt_inC),
	.real_out(bt_outR),
	.complex_out(bt_outC)
);

//portmap for twid mul stages 2,4,6,8,10,12
	mul_wrapper MW(
	.real_in(mul_inR),
	.complex_in(mul_inC),
	.real_twid(twidR),
	.complex_twid(twidC),
	.real_out(mul_outR),
	.complex_out(mul_outC)

);



always_comb
begin
	count = mul_count;
	next_real = working_real;
	next_complex = working_complex ;
	outReal = working_real;
	outComplex = working_complex;
	bt_inR='0;
	bt_inC='0;
	mul_inR='0;
	mul_inC='0;
	

	if(stage_select == 4'b0001)//loading stage
	begin
		next_complex = '0;

		for(i = 0; i< 128; i++) begin
			for(j=0;j<8;j++) begin
				next_real[i][j] = loading_buffer[i][j];
			end
		end
		for(i = 0; i< 128; i++)begin
			for(j=8;j<16;j++)begin//takes signed so 15 will always be 0
				next_real[i][j] = 1'b0;
				end
		end
	end
	else if (stage_select == 4'd2)//first butterfly stage with step of 64
	begin
		for(i = 0; i< 64; i++)	begin
				bt_inR[i] = working_real[i];
				bt_inR[i+64] =working_real[i+64];

				next_real[i]= bt_outR[i];
				next_real[i+64]= bt_outR[i+64];

				bt_inC[i] = working_complex[i];
				bt_inC[i+64] =working_complex[i+64];

				next_complex[i]= bt_outC[i];
				next_complex[i+64]= bt_outC[i+64];
				end
	end

	else if (stage_select == 4'd3)//first mul
	begin
		for(i=0;i<4;i++)begin

				mul_inR[i] =working_real[count*4+i+64];
				mul_inC[i] =working_complex[count*4+i+64];

				twidR[i]= twiddle_real[count*4+i]; //need all 64 values twiddle values to correspond to bottom 64 registers 
				twidC[i]= twiddle_complex[count*4+i];//0 1 2 3 4 ...

				next_real[count*4+i+64]= mul_outR[i];
				next_complex[count*4+i+64]= mul_outC[i];
		
		end
	end

	else if (stage_select == 4'd4)//2 set butterfly stage with step of 32
	begin
		for(h=0;h<2;h++) begin
			for(i = 0; i< 32; i++) begin
					bt_inR[i+32*h] = working_real[h*64+i];	
					bt_inR[i+32*h+64] =working_real[h*64+i+32];

					bt_inC[i+32*h] = working_complex[h*64+i];
					bt_inC[i+32*h+64] =working_complex[h*64+i+32];

					next_real[h*64+i]= bt_outR[i+32*h];
					next_real[h*64+i+32]= bt_outR[i+32*h+64];

					next_complex[h*64+i]= bt_outC[i+32*h];
					next_complex[h*64+i+32]= bt_outC[i+32*h+64];
			end
		end
	end	
	else if (stage_select == 4'd5)//botom 32 of two sets
	begin
		for(i=0;i<2;i++) begin
				mul_inR[i] =working_real[count*2+i+32];//32-63
				mul_inC[i] =working_complex[count*2+i+32];

				next_real[count*2+i+32]= mul_outR[i];
				next_complex[count*2+i+32] = mul_outC[i]; 

				twidR[i]= twiddle_real[count*4+i*2]; //need all every other twiddle value to correspond to bottom 32 registers 
				twidC[i]= twiddle_complex[count*4+i*2];

				mul_inR[i+2] =working_real[count*2+i+96];//32-63
				mul_inC[i+2] =working_complex[count*2+i+96];

				next_real[count*2+i+96]= mul_outR[i+2];
				next_complex[count*2+i+96] = mul_outC[i+2]; 
			
				twidR[i+2]= twiddle_real[count*4+i*2];
				twidC[i+2]= twiddle_complex[count*4+i*2];//twiddles skip 1(0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62)
				end
				//need to add twiddle getter
	end

	else if (stage_select == 4'd6) //first butterfly stage with step of 16
	begin
		for(h=0;h<4;h++) begin
			for(i = 0; i< 16; i++) begin

					bt_inR[i+16*h] = working_real[h*32+i];	
					bt_inR[i+16*h+64] =working_real[h*32+i+16];

					bt_inC[i+i*h] = working_complex[h*32+i];
					bt_inC[i+i*h+64] =working_complex[h*32+i+16];

					next_real[h*32+i]= bt_outR[i+16*h];
					next_real[h*32+i+16]= bt_outR[i+16*h+64];

					next_complex[h*32+i]= bt_outC[i+16*h];
					next_complex[h*32+i+16]= bt_outC[i+16*h+64];
			end
		end
	end	
	else if (stage_select == 4'd7)//bottom 16 of 4 sets
	begin
		//4 of length 16 (16-31,)
			
				mul_inR[0] =working_real[count+16];//
				mul_inC[0] =working_complex[count+16];
				twidR[0]= twiddle_real[count*4];
				twidC[0]= twiddle_complex[count*4];
				next_real[count+16]= mul_outR[0];
				next_complex[count+16] = mul_outC[0]; 



				mul_inR[1] =working_real[count+48];//
				mul_inC[1] =working_complex[count+48];
				twidR[1]= twiddle_real[count*4]; 
				twidC[1]= twiddle_complex[count*4];
				next_real[count+48]= mul_outR[1];
				next_complex[count+48] = mul_outC[1]; 


				mul_inR[2] =working_real[count+80];//
				mul_inC[2] =working_complex[count+80];
				twidR[2]= twiddle_real[count*4] ;
				twidC[2]= twiddle_complex[count*4];
				next_real[count+80]= mul_outR[2];
				next_complex[count+80] = mul_outC[2]; 
				

				mul_inR[3] =working_real[count+112];//
				mul_inC[3] =working_complex[count+112];
				twidR[3]= twiddle_real[count*4]; 
				twidC[3]= twiddle_complex[count*4];//twiddles skip 3(0 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60) x 4
				next_real[count+112]= mul_outR[3];
				next_complex[count+112] = mul_outC[3]; 

			//need to add twiddle getter
	end

	else if (stage_select == 4'd8)//first butterfly stage with step of 8
	begin
		for(h=0;h<8;h++) begin
			for(i = 0; i< 8; i++) begin
					bt_inR[i+8*h] = working_real[h*16+i];	
					bt_inR[i+8*h+64] =working_real[h*16+i+8];

					bt_inC[i+8*h] = working_complex[h*16+i];
					bt_inC[i+8*h+64] =working_complex[h*16+i+8];

					next_real[h*16+i]= bt_outR[i+8*h];
					next_real[h*16+i+8]= bt_outR[i+8*h+64];

					next_complex[h*16+i]= bt_outC[i+8*h];
					next_complex[h*16+i+8]= bt_outC[i+8*h+64];
			end
		end
	end	
	
	else if (stage_select == 4'd9)//bottom 8 of 8 sets
	begin
		if (count < 8)begin
				mul_inR[0] =working_real[count+8];//
				mul_inC[0] =working_complex[count+8];
				twidR[0]= twiddle_real[count*8];//twiddles skip 7(0 8 16 24 32 40 48 56) x 8
				twidC[0]= twiddle_complex[count*8];
				next_real[count+8]= mul_outR[0];
				next_complex[count+8] = mul_outC[0]; 

				mul_inR[1] =working_real[count+24];//
				mul_inC[1] =working_complex[count+24];
				twidR[1]= twiddle_real[count*8];
				twidC[1]= twiddle_complex[count*8];
				next_real[count+24]= mul_outR[1];
				next_complex[count+24] = mul_outC[1]; 


				mul_inR[2] =working_real[count+40];//
				mul_inC[2] =working_complex[count+40];
				twidR[2]= twiddle_real[count*8];
				twidC[2]= twiddle_complex[count*8];
				next_real[count+40]= mul_outR[2];
				next_complex[count+40] = mul_outC[2]; 

				mul_inR[3] =working_real[count+56];//
				mul_inC[3] =working_complex[count+56];
				twidR[3]= twiddle_real[count*8];
				twidC[3]= twiddle_complex[count*8];
				next_real[count+56]= mul_outR[3];
				next_complex[count+56] = mul_outC[3];
		end
		else
		begin
				mul_inR[0] =working_real[(count-8)+72];//
				mul_inC[0] =working_complex[(count-8)+72];
				twidR[0]= twiddle_real[(count-8)*8];//twiddles skip 7(0 8 16 24 32 40 48 56) x 8
				twidC[0]= twiddle_complex[(count-8)*8];
				next_real[(count-8)+72]= mul_outR[0];
				next_complex[(count-8)+72] = mul_outC[0];

				mul_inR[1] =working_real[(count-8)+88];//
				mul_inC[1] =working_complex[(count-8)+88];
				twidR[1]= twiddle_real[(count-8)*8];
				twidC[1]= twiddle_complex[(count-8)*8];
				next_real[(count-8)+88]= mul_outR[1];
				next_complex[(count-8)+88] = mul_outC[1]; 

				mul_inR[2] =working_real[(count-8)+104];//
				mul_inC[2] =working_complex[(count-8)+104];
				twidR[2]= twiddle_real[(count-8)*8];
				twidC[2]= twiddle_complex[(count-8)*8];
				next_real[(count-8)+104]= mul_outR[2];
				next_complex[(count-8)+104] = mul_outC[2]; 

				mul_inR[3] =working_real[(count-8)+120];//
				mul_inC[3] =working_complex[(count-8)+120];
				twidR[3]= twiddle_real[(count-8)*8];
				twidC[3]= twiddle_complex[(count-8)*8];
				next_real[(count-8)+120]= mul_outR[3];
				next_complex[(count-8)+120] = mul_outC[3];

			end
			//need to add twiddle getter
	end

	else if (stage_select == 4'd10)//first butterfly stage with step of 4
	begin
		for(h=0;h<16;h++) begin
			for(i = 0; i< 4; i++) begin
			
				bt_inR[i+4*h] = working_real[h*8+i];	
				bt_inR[i+4*h+64] =working_real[h*8+i+4];

				bt_inC[i+4*h] = working_complex[h*8+i];
				bt_inC[i+4*h+64] =working_complex[h*8+i+4];

				next_real[h*8+i]= bt_outR[i+4*h];
				next_real[h*8+i+4]= bt_outR[i+4*h+64];

				next_complex[h*8+i]= bt_outC[i+4*h];
				next_complex[h*8+i+4]= bt_outC[i+4*h+64];
			end
		end
	end

	else if (stage_select == 4'd11)//bottom 4 of 16 sets
	begin
			
					mul_inR[0] =working_real[count*8+4];//twiddles skip 15(0 16 32 48) x 16
					mul_inC[0] =working_complex[count*8+4];
					twidR[0]= twiddle_real[0];
					twidC[0]= twiddle_complex[0];
					next_real[count*8+4]= mul_outR[0];
					next_complex[count*8+4] = mul_outC[0];

					mul_inR[1] =working_real[count*8+5];//
					mul_inC[1] =working_complex[count*8+5];
					twidR[1]= twiddle_real[16];
					twidC[1]= twiddle_complex[16];
					next_real[count*8+5]= mul_outR[1];
					next_complex[count*8+5] = mul_outC[1];

					mul_inR[2] =working_real[count*8+6];//
					mul_inC[2] =working_complex[count*8+6];
					twidR[2]= twiddle_real[32];
					twidC[2]= twiddle_complex[32];
					next_real[count*8+6]= mul_outR[2];
					next_complex[count*8+6] = mul_outC[2];

					mul_inR[3] =working_real[count*8+7];//
					mul_inC[3] =working_complex[count*8+7];
					twidR[3]= twiddle_real[48];
					twidC[3]= twiddle_complex[48];
					next_real[count*8+7]= mul_outR[3];
					next_complex[count*8+7] = mul_outC[3];
			
			//need to add twiddle getter
	end
	

	else if (stage_select == 4'd12)//first butterfly stage with step of 2
	begin
		for(h=0;h<32;h++) begin
			for(i = 0; i< 2; i++) begin
		
					bt_inR[i+2*h] = working_real[h*4+i];	
					bt_inR[i+2*h+64] =working_real[h*4+i+2];
					

					bt_inC[i+2*h] = working_complex[h*4+i];
					bt_inC[i+2*h+64] =working_complex[h*4+i+2];

					next_real[h*4+i]= bt_outR[i+2*h];
					next_real[h*4+i+2]= bt_outR[i+2*h+64];

					next_complex[h*4+i]= bt_outC[i+2*h];
					next_complex[h*4+i+2]= bt_outC[i+2*h+64];
		
			end
		end
	end

	else if (stage_select == 4'd13)//bottom 2 of 32 sets
	begin
		//
					mul_inR[0] =working_real[count*4+2];//first 16 sets
					mul_inC[0] =working_complex[count*4+2];
					twidR[0]= twiddle_real[0];
					twidC[0]= twiddle_complex[0];
					next_real[count*4+2]= mul_outR[0];
					next_complex[count*4+2] = mul_outC[0];

					mul_inR[1] =working_real[count*4+3];//first 16 sets
					mul_inC[1] =working_complex[count*4+3];
					twidR[1]= twiddle_real[32];
					twidC[1]= twiddle_complex[32];
					next_real[count*4+3]= mul_outR[1];
					next_complex[count*4+3] = mul_outC[1];

					mul_inR[2] =working_real[count*4+2+64];//second 16 set
					mul_inC[2] =working_complex[count*4+2+64];
					twidR[2]= twiddle_real[0];
					twidC[2]= twiddle_complex[0];
					next_real[count*4+2+64]= mul_outR[2];
					next_complex[count*4+2+64] = mul_outC[2];

					mul_inR[3] =working_real[count*4+3+64];//second 16 sets
					mul_inC[3] =working_complex[count*4+3+64];
					twidR[3]= twiddle_real[32];
					twidC[3]= twiddle_complex[32];
					next_real[count*4+3+64]= mul_outR[3];
					next_complex[count*4+3+64] = mul_outC[3];
			
			//need to add twiddle getter
	end

	else if (stage_select == 4'd14)//first butterfly stage with step of 1
	begin
		for(h=0;h<64;h++) begin
			for(i = 0; i< 1; i++) begin
				
					bt_inR[i+h] = working_real[h*2];	
					bt_inR[i+h+64] =working_real[h*2+1];

					bt_inC[h] = working_complex[h*2];
					bt_inC[h+64] =working_complex[h*2+1];

					next_real[h*2]= bt_outR[h];
					next_real[h*2+1]= bt_outR[h+64];

					next_complex[h*2]= bt_outC[h];
					next_complex[h*2+1]= bt_outC[h+64];
				
			end
		end
	end


	else if (stage_select == 4'd15)
	begin
	next_real[0] = working_real[0];
	next_complex[0] = working_complex[0];
	next_real[64] = working_real[1];
	next_complex[64] = working_complex[1];
	next_real[32] = working_real[2];
	next_complex[32] = working_complex[2];
	next_real[96] = working_real[3];
	next_complex[96] = working_complex[3];
	next_real[16] = working_real[4];
	next_complex[16] = working_complex[4];
	next_real[80] = working_real[5];
	next_complex[80] = working_complex[5];
	next_real[48] = working_real[6];
	next_complex[48] = working_complex[6];
	next_real[112] = working_real[7];
	next_complex[112] = working_complex[7];
	next_real[8] = working_real[8];
	next_complex[8] = working_complex[8];
	next_real[72] = working_real[9];
	next_complex[72] = working_complex[9];
	next_real[40] = working_real[10];
	next_complex[40] = working_complex[10];
	next_real[104] = working_real[11];
	next_complex[104] = working_complex[11];
	next_real[24] = working_real[12];
	next_complex[24] = working_complex[12];
	next_real[88] = working_real[13];
	next_complex[88] = working_complex[13];
	next_real[56] = working_real[14];
	next_complex[56] = working_complex[14];
	next_real[120] = working_real[15];
	next_complex[120] = working_complex[15];
	next_real[4] = working_real[16];
	next_complex[4] = working_complex[16];
	next_real[68] = working_real[17];
	next_complex[68] = working_complex[17];
	next_real[36] = working_real[18];
	next_complex[36] = working_complex[18];
	next_real[100] = working_real[19];
	next_complex[100] = working_complex[19];
	next_real[20] = working_real[20];
	next_complex[20] = working_complex[20];
	next_real[84] = working_real[21];
	next_complex[84] = working_complex[21];
	next_real[52] = working_real[22];
	next_complex[52] = working_complex[22];
	next_real[116] = working_real[23];
	next_complex[116] = working_complex[23];
	next_real[12] = working_real[24];
	next_complex[12] = working_complex[24];
	next_real[76] = working_real[25];
	next_complex[76] = working_complex[25];
	next_real[44] = working_real[26];
	next_complex[44] = working_complex[26];
	next_real[108] = working_real[27];
	next_complex[108] = working_complex[27];
	next_real[28] = working_real[28];
	next_complex[28] = working_complex[28];
	next_real[92] = working_real[29];
	next_complex[92] = working_complex[29];
	next_real[60] = working_real[30];
	next_complex[60] = working_complex[30];
	next_real[124] = working_real[31];
	next_complex[124] = working_complex[31];
	next_real[2] = working_real[32];
	next_complex[2] = working_complex[32];
	next_real[66] = working_real[33];
	next_complex[66] = working_complex[33];
	next_real[34] = working_real[34];
	next_complex[34] = working_complex[34];
	next_real[98] = working_real[35];
	next_complex[98] = working_complex[35];
	next_real[18] = working_real[36];
	next_complex[18] = working_complex[36];
	next_real[82] = working_real[37];
	next_complex[82] = working_complex[37];
	next_real[50] = working_real[38];
	next_complex[50] = working_complex[38];
	next_real[114] = working_real[39];
	next_complex[114] = working_complex[39];
	next_real[10] = working_real[40];
	next_complex[10] = working_complex[40];
	next_real[74] = working_real[41];
	next_complex[74] = working_complex[41];
	next_real[42] = working_real[42];
	next_complex[42] = working_complex[42];
	next_real[106] = working_real[43];
	next_complex[106] = working_complex[43];
	next_real[26] = working_real[44];
	next_complex[26] = working_complex[44];
	next_real[90] = working_real[45];
	next_complex[90] = working_complex[45];
	next_real[58] = working_real[46];
	next_complex[58] = working_complex[46];
	next_real[122] = working_real[47];
	next_complex[122] = working_complex[47];
	next_real[6] = working_real[48];
	next_complex[6] = working_complex[48];
	next_real[70] = working_real[49];
	next_complex[70] = working_complex[49];
	next_real[38] = working_real[50];
	next_complex[38] = working_complex[50];
	next_real[102] = working_real[51];
	next_complex[102] = working_complex[51];
	next_real[22] = working_real[52];
	next_complex[22] = working_complex[52];
	next_real[86] = working_real[53];
	next_complex[86] = working_complex[53];
	next_real[54] = working_real[54];
	next_complex[54] = working_complex[54];
	next_real[118] = working_real[55];
	next_complex[118] = working_complex[55];
	next_real[14] = working_real[56];
	next_complex[14] = working_complex[56];
	next_real[78] = working_real[57];
	next_complex[78] = working_complex[57];
	next_real[46] = working_real[58];
	next_complex[46] = working_complex[58];
	next_real[110] = working_real[59];
	next_complex[110] = working_complex[59];
	next_real[30] = working_real[60];
	next_complex[30] = working_complex[60];
	next_real[94] = working_real[61];
	next_complex[94] = working_complex[61];
	next_real[62] = working_real[62];
	next_complex[62] = working_complex[62];
	next_real[126] = working_real[63];
	next_complex[126] = working_complex[63];
	next_real[1] = working_real[64];
	next_complex[1] = working_complex[64];
	next_real[65] = working_real[65];
	next_complex[65] = working_complex[65];
	next_real[33] = working_real[66];
	next_complex[33] = working_complex[66];
	next_real[97] = working_real[67];
	next_complex[97] = working_complex[67];
	next_real[17] = working_real[68];
	next_complex[17] = working_complex[68];
	next_real[81] = working_real[69];
	next_complex[81] = working_complex[69];
	next_real[49] = working_real[70];
	next_complex[49] = working_complex[70];
	next_real[113] = working_real[71];
	next_complex[113] = working_complex[71];
	next_real[9] = working_real[72];
	next_complex[9] = working_complex[72];
	next_real[73] = working_real[73];
	next_complex[73] = working_complex[73];
	next_real[41] = working_real[74];
	next_complex[41] = working_complex[74];
	next_real[105] = working_real[75];
	next_complex[105] = working_complex[75];
	next_real[25] = working_real[76];
	next_complex[25] = working_complex[76];
	next_real[89] = working_real[77];
	next_complex[89] = working_complex[77];
	next_real[57] = working_real[78];
	next_complex[57] = working_complex[78];
	next_real[121] = working_real[79];
	next_complex[121] = working_complex[79];
	next_real[5] = working_real[80];
	next_complex[5] = working_complex[80];
	next_real[69] = working_real[81];
	next_complex[69] = working_complex[81];
	next_real[37] = working_real[82];
	next_complex[37] = working_complex[82];
	next_real[101] = working_real[83];
	next_complex[101] = working_complex[83];
	next_real[21] = working_real[84];
	next_complex[21] = working_complex[84];
	next_real[85] = working_real[85];
	next_complex[85] = working_complex[85];
	next_real[53] = working_real[86];
	next_complex[53] = working_complex[86];
	next_real[117] = working_real[87];
	next_complex[117] = working_complex[87];
	next_real[13] = working_real[88];
	next_complex[13] = working_complex[88];
	next_real[77] = working_real[89];
	next_complex[77] = working_complex[89];
	next_real[45] = working_real[90];
	next_complex[45] = working_complex[90];
	next_real[109] = working_real[91];
	next_complex[109] = working_complex[91];
	next_real[29] = working_real[92];
	next_complex[29] = working_complex[92];
	next_real[93] = working_real[93];
	next_complex[93] = working_complex[93];
	next_real[61] = working_real[94];
	next_complex[61] = working_complex[94];
	next_real[125] = working_real[95];
	next_complex[125] = working_complex[95];
	next_real[3] = working_real[96];
	next_complex[3] = working_complex[96];
	next_real[67] = working_real[97];
	next_complex[67] = working_complex[97];
	next_real[35] = working_real[98];
	next_complex[35] = working_complex[98];
	next_real[99] = working_real[99];
	next_complex[99] = working_complex[99];
	next_real[19] = working_real[100];
	next_complex[19] = working_complex[100];
	next_real[83] = working_real[101];
	next_complex[83] = working_complex[101];
	next_real[51] = working_real[102];
	next_complex[51] = working_complex[102];
	next_real[115] = working_real[103];
	next_complex[115] = working_complex[103];
	next_real[11] = working_real[104];
	next_complex[11] = working_complex[104];
	next_real[75] = working_real[105];
	next_complex[75] = working_complex[105];
	next_real[43] = working_real[106];
	next_complex[43] = working_complex[106];
	next_real[107] = working_real[107];
	next_complex[107] = working_complex[107];
	next_real[27] = working_real[108];
	next_complex[27] = working_complex[108];
	next_real[91] = working_real[109];
	next_complex[91] = working_complex[109];
	next_real[59] = working_real[110];
	next_complex[59] = working_complex[110];
	next_real[123] = working_real[111];
	next_complex[123] = working_complex[111];
	next_real[7] = working_real[112];
	next_complex[7] = working_complex[112];
	next_real[71] = working_real[113];
	next_complex[71] = working_complex[113];
	next_real[39] = working_real[114];
	next_complex[39] = working_complex[114];
	next_real[103] = working_real[115];
	next_complex[103] = working_complex[115];
	next_real[23] = working_real[116];
	next_complex[23] = working_complex[116];
	next_real[87] = working_real[117];
	next_complex[87] = working_complex[117];
	next_real[55] = working_real[118];
	next_complex[55] = working_complex[118];
	next_real[119] = working_real[119];
	next_complex[119] = working_complex[119];
	next_real[15] = working_real[120];
	next_complex[15] = working_complex[120];
	next_real[79] = working_real[121];
	next_complex[79] = working_complex[121];
	next_real[47] = working_real[122];
	next_complex[47] = working_complex[122];
	next_real[111] = working_real[123];
	next_complex[111] = working_complex[123];
	next_real[31] = working_real[124];
	next_complex[31] = working_complex[124];
	next_real[95] = working_real[125];
	next_complex[95] = working_complex[125];
	next_real[63] = working_real[126];
	next_complex[63] = working_complex[126];
	next_real[127] = working_real[127];
	next_complex[127] = working_complex[127];		
	end


end

endmodule
