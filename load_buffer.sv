
module load_buffer
(
	input wire clk,
	input wire n_rst,
	input wire shift_in,
	input wire[7:0] data_in,
	output wire counter_complete,
	output reg[127:0][7:0] buffer_out_val
);

reg rf1;
reg [127:0][7:0] nxt_buffer;
reg [6:0]i;
reg [6:0]i_next;
//wire clk_new;
//wire rst_n;
reg [7:0]count_out;
reg [7:0]count_out_next;
assign counter_complete = rf1;

typedef enum bit[1:0] {idle,load_buffer} state_type;
state_type current_state, next_state;


work_buffer W
(
	.clk(clk),
	.n_rst(n_rst),
	.counter_in(counter_complete),
	.buffer_in_value(buffer_out_val)
);

always_ff @(posedge clk, negedge n_rst)
begin
	
	if(n_rst == 1'b0) //reset is active-low asynchronus
	begin
		buffer_out_val <= '0;
		current_state <= idle;
		count_out <='0;
		//i <= 0;
	end

	else begin

		buffer_out_val[0][7:0] <= nxt_buffer[0][7:0];
		buffer_out_val[1][7:0] <= nxt_buffer[1][7:0];
		buffer_out_val[2][7:0] <= nxt_buffer[2][7:0];
		buffer_out_val[3][7:0] <= nxt_buffer[3][7:0];
		buffer_out_val[4][7:0] <= nxt_buffer[4][7:0];
		buffer_out_val[5][7:0] <= nxt_buffer[5][7:0];
		buffer_out_val[6][7:0] <= nxt_buffer[6][7:0];
		buffer_out_val[7][7:0] <= nxt_buffer[7][7:0];
		buffer_out_val[8][7:0] <= nxt_buffer[8][7:0];
		buffer_out_val[9][7:0] <= nxt_buffer[9][7:0];
		buffer_out_val[10][7:0] <= nxt_buffer[10][7:0];
		buffer_out_val[11][7:0] <= nxt_buffer[11][7:0];
		buffer_out_val[12][7:0] <= nxt_buffer[12][7:0];
		buffer_out_val[13][7:0] <= nxt_buffer[13][7:0];
		buffer_out_val[14][7:0] <= nxt_buffer[14][7:0];
		buffer_out_val[15][7:0] <= nxt_buffer[15][7:0];
		buffer_out_val[16][7:0] <= nxt_buffer[16][7:0];
		buffer_out_val[17][7:0] <= nxt_buffer[17][7:0];
		buffer_out_val[18][7:0] <= nxt_buffer[18][7:0];
		buffer_out_val[19][7:0] <= nxt_buffer[19][7:0];
		buffer_out_val[20][7:0] <= nxt_buffer[20][7:0];

		buffer_out_val[21][7:0] <= nxt_buffer[21][7:0];
		buffer_out_val[22][7:0] <= nxt_buffer[22][7:0];
		buffer_out_val[23][7:0] <= nxt_buffer[23][7:0];
		buffer_out_val[24][7:0] <= nxt_buffer[24][7:0];
		buffer_out_val[25][7:0] <= nxt_buffer[25][7:0];
		buffer_out_val[26][7:0] <= nxt_buffer[26][7:0];
		buffer_out_val[27][7:0] <= nxt_buffer[27][7:0];
		buffer_out_val[28][7:0] <= nxt_buffer[28][7:0];
		buffer_out_val[29][7:0] <= nxt_buffer[29][7:0];
		buffer_out_val[30][7:0] <= nxt_buffer[30][7:0];

		buffer_out_val[31][7:0] <= nxt_buffer[31][7:0];
		buffer_out_val[32][7:0] <= nxt_buffer[32][7:0];
		buffer_out_val[33][7:0] <= nxt_buffer[33][7:0];
		buffer_out_val[34][7:0] <= nxt_buffer[34][7:0];
		buffer_out_val[35][7:0] <= nxt_buffer[35][7:0];
		buffer_out_val[36][7:0] <= nxt_buffer[36][7:0];
		buffer_out_val[37][7:0] <= nxt_buffer[37][7:0];
		buffer_out_val[38][7:0] <= nxt_buffer[38][7:0];
		buffer_out_val[39][7:0] <= nxt_buffer[39][7:0];
		buffer_out_val[40][7:0] <= nxt_buffer[40][7:0];
		buffer_out_val[41][7:0] <= nxt_buffer[41][7:0];
		buffer_out_val[42][7:0] <= nxt_buffer[42][7:0];

		buffer_out_val[43][7:0] <= nxt_buffer[43][7:0];
		buffer_out_val[44][7:0] <= nxt_buffer[44][7:0];
		buffer_out_val[45][7:0] <= nxt_buffer[45][7:0];
		buffer_out_val[46][7:0] <= nxt_buffer[46][7:0];
		buffer_out_val[47][7:0] <= nxt_buffer[47][7:0];
		buffer_out_val[48][7:0] <= nxt_buffer[48][7:0];
		buffer_out_val[49][7:0] <= nxt_buffer[49][7:0];
		
		buffer_out_val[50][7:0] <= nxt_buffer[50][7:0];
		buffer_out_val[51][7:0] <= nxt_buffer[51][7:0];
		buffer_out_val[52][7:0] <= nxt_buffer[52][7:0];
		buffer_out_val[53][7:0] <= nxt_buffer[53][7:0];
		buffer_out_val[54][7:0] <= nxt_buffer[54][7:0];
		buffer_out_val[55][7:0] <= nxt_buffer[55][7:0];
		buffer_out_val[56][7:0] <= nxt_buffer[56][7:0];
		buffer_out_val[57][7:0] <= nxt_buffer[57][7:0];
		buffer_out_val[58][7:0] <= nxt_buffer[58][7:0];
		buffer_out_val[59][7:0] <= nxt_buffer[59][7:0];
		buffer_out_val[60][7:0] <= nxt_buffer[60][7:0];

		buffer_out_val[61][7:0] <= nxt_buffer[61][7:0];
		buffer_out_val[62][7:0] <= nxt_buffer[62][7:0];
		buffer_out_val[63][7:0] <= nxt_buffer[63][7:0];
		buffer_out_val[64][7:0] <= nxt_buffer[64][7:0];
		buffer_out_val[65][7:0] <= nxt_buffer[65][7:0];
		buffer_out_val[66][7:0] <= nxt_buffer[66][7:0];
		buffer_out_val[67][7:0] <= nxt_buffer[67][7:0];
		buffer_out_val[68][7:0] <= nxt_buffer[68][7:0];
		buffer_out_val[69][7:0] <= nxt_buffer[69][7:0];
		buffer_out_val[70][7:0] <= nxt_buffer[70][7:0];

		buffer_out_val[71][7:0] <= nxt_buffer[71][7:0];
		buffer_out_val[72][7:0] <= nxt_buffer[72][7:0];
		buffer_out_val[73][7:0] <= nxt_buffer[73][7:0];
		buffer_out_val[74][7:0] <= nxt_buffer[74][7:0];
		buffer_out_val[75][7:0] <= nxt_buffer[75][7:0];
		buffer_out_val[76][7:0] <= nxt_buffer[76][7:0];
		buffer_out_val[77][7:0] <= nxt_buffer[77][7:0];
		buffer_out_val[78][7:0] <= nxt_buffer[78][7:0];
		buffer_out_val[79][7:0] <= nxt_buffer[79][7:0];
		buffer_out_val[80][7:0] <= nxt_buffer[80][7:0];

		buffer_out_val[81][7:0] <= nxt_buffer[81][7:0];
		buffer_out_val[82][7:0] <= nxt_buffer[82][7:0];
		buffer_out_val[83][7:0] <= nxt_buffer[83][7:0];
		buffer_out_val[84][7:0] <= nxt_buffer[84][7:0];
		buffer_out_val[85][7:0] <= nxt_buffer[85][7:0];
		buffer_out_val[86][7:0] <= nxt_buffer[86][7:0];
		buffer_out_val[87][7:0] <= nxt_buffer[87][7:0];
		buffer_out_val[88][7:0] <= nxt_buffer[88][7:0];
		buffer_out_val[89][7:0] <= nxt_buffer[89][7:0];
		buffer_out_val[90][7:0] <= nxt_buffer[90][7:0];
		buffer_out_val[91][7:0] <= nxt_buffer[91][7:0];
		buffer_out_val[92][7:0] <= nxt_buffer[92][7:0];
		buffer_out_val[93][7:0] <= nxt_buffer[93][7:0];
		buffer_out_val[94][7:0] <= nxt_buffer[94][7:0];
		buffer_out_val[95][7:0] <= nxt_buffer[95][7:0];
		buffer_out_val[96][7:0] <= nxt_buffer[96][7:0];
		buffer_out_val[97][7:0] <= nxt_buffer[97][7:0];
		buffer_out_val[98][7:0] <= nxt_buffer[98][7:0];
		buffer_out_val[99][7:0] <= nxt_buffer[99][7:0];

		buffer_out_val[100][7:0] <= nxt_buffer[100][7:0];
		buffer_out_val[101][7:0] <= nxt_buffer[101][7:0];
		buffer_out_val[102][7:0] <= nxt_buffer[102][7:0];
		buffer_out_val[103][7:0] <= nxt_buffer[103][7:0];
		buffer_out_val[104][7:0] <= nxt_buffer[104][7:0];
		buffer_out_val[105][7:0] <= nxt_buffer[105][7:0];
		buffer_out_val[106][7:0] <= nxt_buffer[106][7:0];
		buffer_out_val[107][7:0] <= nxt_buffer[107][7:0];
		buffer_out_val[108][7:0] <= nxt_buffer[108][7:0];
		buffer_out_val[109][7:0] <= nxt_buffer[109][7:0];

		buffer_out_val[110][7:0] <= nxt_buffer[110][7:0];
		buffer_out_val[111][7:0] <= nxt_buffer[111][7:0];
		buffer_out_val[112][7:0] <= nxt_buffer[112][7:0];
		buffer_out_val[113][7:0] <= nxt_buffer[113][7:0];
		buffer_out_val[114][7:0] <= nxt_buffer[114][7:0];
		buffer_out_val[115][7:0] <= nxt_buffer[115][7:0];
		buffer_out_val[116][7:0] <= nxt_buffer[116][7:0];
		buffer_out_val[117][7:0] <= nxt_buffer[117][7:0];
		buffer_out_val[118][7:0] <= nxt_buffer[118][7:0];
		buffer_out_val[119][7:0] <= nxt_buffer[119][7:0];

		buffer_out_val[120][7:0] <= nxt_buffer[120][7:0];
		buffer_out_val[121][7:0] <= nxt_buffer[121][7:0];
		buffer_out_val[122][7:0] <= nxt_buffer[122][7:0];
		buffer_out_val[123][7:0] <= nxt_buffer[123][7:0];
		buffer_out_val[124][7:0] <= nxt_buffer[124][7:0];
		buffer_out_val[125][7:0] <= nxt_buffer[125][7:0];
		buffer_out_val[126][7:0] <= nxt_buffer[126][7:0];
		buffer_out_val[127][7:0] <= nxt_buffer[127][7:0];
		current_state <= next_state;
		count_out <= count_out_next;
		//i <= i_next;





	//for(i = 0; i < 127; i++)
		//	begin
			//for(j = 0; j < 7; j++)
				//begin

				//	buffer_out_val[i][j] <= nxt_buffer[i][j];

				//end//second for loop ends
			//end //first for loop ends
	end //else ends	
	end



always_comb
begin
	next_state = current_state;
	//i_next = i;
	count_out_next = count_out;
		nxt_buffer[0][7:0] = buffer_out_val[0][7:0];
		nxt_buffer[1][7:0] = buffer_out_val[1][7:0];
		nxt_buffer[2][7:0] = buffer_out_val[2][7:0];
		nxt_buffer[3][7:0] = buffer_out_val[3][7:0];
		nxt_buffer[4][7:0] = buffer_out_val[4][7:0];
		nxt_buffer[5][7:0] = buffer_out_val[5][7:0];
		nxt_buffer[6][7:0] = buffer_out_val[6][7:0];
		nxt_buffer[7][7:0] = buffer_out_val[7][7:0];


		nxt_buffer[8][7:0] = buffer_out_val[8][7:0];
		nxt_buffer[9][7:0] = buffer_out_val[9][7:0];
		nxt_buffer[10][7:0] = buffer_out_val[10][7:0];
		nxt_buffer[11][7:0] = buffer_out_val[11][7:0];
		nxt_buffer[12][7:0] = buffer_out_val[12][7:0];
		nxt_buffer[13][7:0] = buffer_out_val[13][7:0];
		nxt_buffer[14][7:0] = buffer_out_val[14][7:0];
		nxt_buffer[15][7:0] = buffer_out_val[15][7:0];
		nxt_buffer[16][7:0] = buffer_out_val[16][7:0];
		nxt_buffer[17][7:0] = buffer_out_val[17][7:0];
		nxt_buffer[18][7:0] = buffer_out_val[18][7:0];
		nxt_buffer[19][7:0] = buffer_out_val[19][7:0];
		nxt_buffer[20][7:0] = buffer_out_val[20][7:0];

		nxt_buffer[21][7:0] = buffer_out_val[21][7:0];
		nxt_buffer[22][7:0] = buffer_out_val[22][7:0];
		nxt_buffer[23][7:0] = buffer_out_val[23][7:0];
		nxt_buffer[24][7:0] = buffer_out_val[24][7:0];
		nxt_buffer[25][7:0] = buffer_out_val[25][7:0];
		nxt_buffer[26][7:0] = buffer_out_val[26][7:0];
		nxt_buffer[27][7:0] = buffer_out_val[27][7:0];
		nxt_buffer[28][7:0] = buffer_out_val[28][7:0];
		nxt_buffer[29][7:0] = buffer_out_val[29][7:0];
		nxt_buffer[30][7:0] = buffer_out_val[30][7:0];

		nxt_buffer[31][7:0] = buffer_out_val[31][7:0];
		nxt_buffer[32][7:0] = buffer_out_val[32][7:0];
		nxt_buffer[33][7:0] = buffer_out_val[33][7:0];
		nxt_buffer[34][7:0] = buffer_out_val[34][7:0];
		nxt_buffer[35][7:0] = buffer_out_val[35][7:0];
		nxt_buffer[36][7:0] = buffer_out_val[36][7:0];
		nxt_buffer[37][7:0] = buffer_out_val[37][7:0];
		nxt_buffer[38][7:0] = buffer_out_val[38][7:0];
		nxt_buffer[39][7:0] = buffer_out_val[39][7:0];
		nxt_buffer[40][7:0] = buffer_out_val[40][7:0];
		nxt_buffer[41][7:0] = buffer_out_val[41][7:0];
		nxt_buffer[42][7:0] = buffer_out_val[42][7:0];

		nxt_buffer[43][7:0] = buffer_out_val[43][7:0];
		nxt_buffer[44][7:0] = buffer_out_val[44][7:0];
		nxt_buffer[45][7:0] = buffer_out_val[45][7:0];
		nxt_buffer[46][7:0] = buffer_out_val[46][7:0];
		nxt_buffer[47][7:0] = buffer_out_val[47][7:0];
		nxt_buffer[48][7:0] = buffer_out_val[48][7:0];
		nxt_buffer[49][7:0] = buffer_out_val[49][7:0];
		
		nxt_buffer[50][7:0] = buffer_out_val[50][7:0];
		nxt_buffer[51][7:0] = buffer_out_val[51][7:0];
		nxt_buffer[52][7:0] = buffer_out_val[52][7:0];
		nxt_buffer[53][7:0] = buffer_out_val[53][7:0];
		nxt_buffer[54][7:0] = buffer_out_val[54][7:0];
		nxt_buffer[55][7:0] = buffer_out_val[55][7:0];
		nxt_buffer[56][7:0] = buffer_out_val[56][7:0];
		nxt_buffer[57][7:0] = buffer_out_val[57][7:0];
		nxt_buffer[58][7:0] = buffer_out_val[58][7:0];
		nxt_buffer[59][7:0] = buffer_out_val[59][7:0];
		nxt_buffer[60][7:0] = buffer_out_val[60][7:0];

		nxt_buffer[61][7:0] = buffer_out_val[61][7:0];
		nxt_buffer[62][7:0] = buffer_out_val[62][7:0];
		nxt_buffer[63][7:0] = buffer_out_val[63][7:0];
		nxt_buffer[64][7:0] = buffer_out_val[64][7:0];
		nxt_buffer[65][7:0] = buffer_out_val[65][7:0];
		nxt_buffer[66][7:0] = buffer_out_val[66][7:0];
		nxt_buffer[67][7:0] = buffer_out_val[67][7:0];
		nxt_buffer[68][7:0] = buffer_out_val[68][7:0];
		nxt_buffer[69][7:0] = buffer_out_val[69][7:0];
		nxt_buffer[70][7:0] = buffer_out_val[70][7:0];

		nxt_buffer[71][7:0] = buffer_out_val[71][7:0];
		nxt_buffer[72][7:0] = buffer_out_val[72][7:0];
		nxt_buffer[73][7:0] = buffer_out_val[73][7:0];
		nxt_buffer[74][7:0] = buffer_out_val[74][7:0];
		nxt_buffer[75][7:0] = buffer_out_val[75][7:0];
		nxt_buffer[76][7:0] = buffer_out_val[76][7:0];
		nxt_buffer[77][7:0] = buffer_out_val[77][7:0];
		nxt_buffer[78][7:0] = buffer_out_val[78][7:0];
		nxt_buffer[79][7:0] = buffer_out_val[79][7:0];
		nxt_buffer[80][7:0] = buffer_out_val[80][7:0];

		nxt_buffer[81][7:0] = buffer_out_val[81][7:0];
		nxt_buffer[82][7:0] = buffer_out_val[82][7:0];
		nxt_buffer[83][7:0] = buffer_out_val[83][7:0];
		nxt_buffer[84][7:0] = buffer_out_val[84][7:0];
		nxt_buffer[85][7:0] = buffer_out_val[85][7:0];
		nxt_buffer[86][7:0] = buffer_out_val[86][7:0];
		nxt_buffer[87][7:0] = buffer_out_val[87][7:0];
		nxt_buffer[88][7:0] = buffer_out_val[88][7:0];
		nxt_buffer[89][7:0] = buffer_out_val[89][7:0];
		nxt_buffer[90][7:0] = buffer_out_val[90][7:0];
		nxt_buffer[91][7:0] = buffer_out_val[91][7:0];
		nxt_buffer[92][7:0] = buffer_out_val[92][7:0];
		nxt_buffer[93][7:0] = buffer_out_val[93][7:0];
		nxt_buffer[94][7:0] = buffer_out_val[94][7:0];
		nxt_buffer[95][7:0] = buffer_out_val[95][7:0];
		nxt_buffer[96][7:0] = buffer_out_val[96][7:0];
		nxt_buffer[97][7:0] = buffer_out_val[97][7:0];
		nxt_buffer[98][7:0] = buffer_out_val[98][7:0];
		nxt_buffer[99][7:0] = buffer_out_val[99][7:0];

		nxt_buffer[100][7:0] = buffer_out_val[100][7:0];
		nxt_buffer[101][7:0] = buffer_out_val[101][7:0];
		nxt_buffer[102][7:0] = buffer_out_val[102][7:0];
		nxt_buffer[103][7:0] = buffer_out_val[103][7:0];
		nxt_buffer[104][7:0] = buffer_out_val[104][7:0];
		nxt_buffer[105][7:0] = buffer_out_val[105][7:0];
		nxt_buffer[106][7:0] = buffer_out_val[106][7:0];
		nxt_buffer[107][7:0] = buffer_out_val[107][7:0];
		nxt_buffer[108][7:0] = buffer_out_val[108][7:0];
		nxt_buffer[109][7:0] = buffer_out_val[109][7:0];

		nxt_buffer[110][7:0] = buffer_out_val[110][7:0];
		nxt_buffer[111][7:0] = buffer_out_val[111][7:0];
		nxt_buffer[112][7:0] = buffer_out_val[112][7:0];
		nxt_buffer[113][7:0] = buffer_out_val[113][7:0];
		nxt_buffer[114][7:0] = buffer_out_val[114][7:0];
		nxt_buffer[115][7:0] = buffer_out_val[115][7:0];
		nxt_buffer[116][7:0] = buffer_out_val[116][7:0];
		nxt_buffer[117][7:0] = buffer_out_val[117][7:0];
		nxt_buffer[118][7:0] = buffer_out_val[118][7:0];
		nxt_buffer[119][7:0] = buffer_out_val[119][7:0];

		nxt_buffer[120][7:0] = buffer_out_val[120][7:0];
		nxt_buffer[121][7:0] = buffer_out_val[121][7:0];
		nxt_buffer[122][7:0] = buffer_out_val[122][7:0];
		nxt_buffer[123][7:0] = buffer_out_val[123][7:0];
		nxt_buffer[124][7:0] = buffer_out_val[124][7:0];
		nxt_buffer[125][7:0] = buffer_out_val[125][7:0];
		nxt_buffer[126][7:0] = buffer_out_val[126][7:0];
		nxt_buffer[127][7:0] = buffer_out_val[127][7:0];
	case(next_state)
	idle: 
	begin

		if(shift_in == 1'b1)
		begin

			next_state = load_buffer;
			count_out_next = count_out + 1;

		end

		else
		begin
			count_out_next = count_out;
		nxt_buffer[0][7:0] = buffer_out_val[0][7:0];
		nxt_buffer[1][7:0] = buffer_out_val[1][7:0];
		nxt_buffer[2][7:0] = buffer_out_val[2][7:0];
		nxt_buffer[3][7:0] = buffer_out_val[3][7:0];
		nxt_buffer[4][7:0] = buffer_out_val[4][7:0];
		nxt_buffer[5][7:0] = buffer_out_val[5][7:0];
		nxt_buffer[6][7:0] = buffer_out_val[6][7:0];
		nxt_buffer[7][7:0] = buffer_out_val[7][7:0];


		nxt_buffer[8][7:0] = buffer_out_val[8][7:0];
		nxt_buffer[9][7:0] = buffer_out_val[9][7:0];
		nxt_buffer[10][7:0] = buffer_out_val[10][7:0];
		nxt_buffer[11][7:0] = buffer_out_val[11][7:0];
		nxt_buffer[12][7:0] = buffer_out_val[12][7:0];
		nxt_buffer[13][7:0] = buffer_out_val[13][7:0];
		nxt_buffer[14][7:0] = buffer_out_val[14][7:0];
		nxt_buffer[15][7:0] = buffer_out_val[15][7:0];
		nxt_buffer[16][7:0] = buffer_out_val[16][7:0];
		nxt_buffer[17][7:0] = buffer_out_val[17][7:0];
		nxt_buffer[18][7:0] = buffer_out_val[18][7:0];
		nxt_buffer[19][7:0] = buffer_out_val[19][7:0];
		nxt_buffer[20][7:0] = buffer_out_val[20][7:0];

		nxt_buffer[21][7:0] = buffer_out_val[21][7:0];
		nxt_buffer[22][7:0] = buffer_out_val[22][7:0];
		nxt_buffer[23][7:0] = buffer_out_val[23][7:0];
		nxt_buffer[24][7:0] = buffer_out_val[24][7:0];
		nxt_buffer[25][7:0] = buffer_out_val[25][7:0];
		nxt_buffer[26][7:0] = buffer_out_val[26][7:0];
		nxt_buffer[27][7:0] = buffer_out_val[27][7:0];
		nxt_buffer[28][7:0] = buffer_out_val[28][7:0];
		nxt_buffer[29][7:0] = buffer_out_val[29][7:0];
		nxt_buffer[30][7:0] = buffer_out_val[30][7:0];

		nxt_buffer[31][7:0] = buffer_out_val[31][7:0];
		nxt_buffer[32][7:0] = buffer_out_val[32][7:0];
		nxt_buffer[33][7:0] = buffer_out_val[33][7:0];
		nxt_buffer[34][7:0] = buffer_out_val[34][7:0];
		nxt_buffer[35][7:0] = buffer_out_val[35][7:0];
		nxt_buffer[36][7:0] = buffer_out_val[36][7:0];
		nxt_buffer[37][7:0] = buffer_out_val[37][7:0];
		nxt_buffer[38][7:0] = buffer_out_val[38][7:0];
		nxt_buffer[39][7:0] = buffer_out_val[39][7:0];
		nxt_buffer[40][7:0] = buffer_out_val[40][7:0];
		nxt_buffer[41][7:0] = buffer_out_val[41][7:0];
		nxt_buffer[42][7:0] = buffer_out_val[42][7:0];

		nxt_buffer[43][7:0] = buffer_out_val[43][7:0];
		nxt_buffer[44][7:0] = buffer_out_val[44][7:0];
		nxt_buffer[45][7:0] = buffer_out_val[45][7:0];
		nxt_buffer[46][7:0] = buffer_out_val[46][7:0];
		nxt_buffer[47][7:0] = buffer_out_val[47][7:0];
		nxt_buffer[48][7:0] = buffer_out_val[48][7:0];
		nxt_buffer[49][7:0] = buffer_out_val[49][7:0];
		
		nxt_buffer[50][7:0] = buffer_out_val[50][7:0];
		nxt_buffer[51][7:0] = buffer_out_val[51][7:0];
		nxt_buffer[52][7:0] = buffer_out_val[52][7:0];
		nxt_buffer[53][7:0] = buffer_out_val[53][7:0];
		nxt_buffer[54][7:0] = buffer_out_val[54][7:0];
		nxt_buffer[55][7:0] = buffer_out_val[55][7:0];
		nxt_buffer[56][7:0] = buffer_out_val[56][7:0];
		nxt_buffer[57][7:0] = buffer_out_val[57][7:0];
		nxt_buffer[58][7:0] = buffer_out_val[58][7:0];
		nxt_buffer[59][7:0] = buffer_out_val[59][7:0];
		nxt_buffer[60][7:0] = buffer_out_val[60][7:0];

		nxt_buffer[61][7:0] = buffer_out_val[61][7:0];
		nxt_buffer[62][7:0] = buffer_out_val[62][7:0];
		nxt_buffer[63][7:0] = buffer_out_val[63][7:0];
		nxt_buffer[64][7:0] = buffer_out_val[64][7:0];
		nxt_buffer[65][7:0] = buffer_out_val[65][7:0];
		nxt_buffer[66][7:0] = buffer_out_val[66][7:0];
		nxt_buffer[67][7:0] = buffer_out_val[67][7:0];
		nxt_buffer[68][7:0] = buffer_out_val[68][7:0];
		nxt_buffer[69][7:0] = buffer_out_val[69][7:0];
		nxt_buffer[70][7:0] = buffer_out_val[70][7:0];

		nxt_buffer[71][7:0] = buffer_out_val[71][7:0];
		nxt_buffer[72][7:0] = buffer_out_val[72][7:0];
		nxt_buffer[73][7:0] = buffer_out_val[73][7:0];
		nxt_buffer[74][7:0] = buffer_out_val[74][7:0];
		nxt_buffer[75][7:0] = buffer_out_val[75][7:0];
		nxt_buffer[76][7:0] = buffer_out_val[76][7:0];
		nxt_buffer[77][7:0] = buffer_out_val[77][7:0];
		nxt_buffer[78][7:0] = buffer_out_val[78][7:0];
		nxt_buffer[79][7:0] = buffer_out_val[79][7:0];
		nxt_buffer[80][7:0] = buffer_out_val[80][7:0];

		nxt_buffer[81][7:0] = buffer_out_val[81][7:0];
		nxt_buffer[82][7:0] = buffer_out_val[82][7:0];
		nxt_buffer[83][7:0] = buffer_out_val[83][7:0];
		nxt_buffer[84][7:0] = buffer_out_val[84][7:0];
		nxt_buffer[85][7:0] = buffer_out_val[85][7:0];
		nxt_buffer[86][7:0] = buffer_out_val[86][7:0];
		nxt_buffer[87][7:0] = buffer_out_val[87][7:0];
		nxt_buffer[88][7:0] = buffer_out_val[88][7:0];
		nxt_buffer[89][7:0] = buffer_out_val[89][7:0];
		nxt_buffer[90][7:0] = buffer_out_val[90][7:0];
		nxt_buffer[91][7:0] = buffer_out_val[91][7:0];
		nxt_buffer[92][7:0] = buffer_out_val[92][7:0];
		nxt_buffer[93][7:0] = buffer_out_val[93][7:0];
		nxt_buffer[94][7:0] = buffer_out_val[94][7:0];
		nxt_buffer[95][7:0] = buffer_out_val[95][7:0];
		nxt_buffer[96][7:0] = buffer_out_val[96][7:0];
		nxt_buffer[97][7:0] = buffer_out_val[97][7:0];
		nxt_buffer[98][7:0] = buffer_out_val[98][7:0];
		nxt_buffer[99][7:0] = buffer_out_val[99][7:0];

		nxt_buffer[100][7:0] = buffer_out_val[100][7:0];
		nxt_buffer[101][7:0] = buffer_out_val[101][7:0];
		nxt_buffer[102][7:0] = buffer_out_val[102][7:0];
		nxt_buffer[103][7:0] = buffer_out_val[103][7:0];
		nxt_buffer[104][7:0] = buffer_out_val[104][7:0];
		nxt_buffer[105][7:0] = buffer_out_val[105][7:0];
		nxt_buffer[106][7:0] = buffer_out_val[106][7:0];
		nxt_buffer[107][7:0] = buffer_out_val[107][7:0];
		nxt_buffer[108][7:0] = buffer_out_val[108][7:0];
		nxt_buffer[109][7:0] = buffer_out_val[109][7:0];

		nxt_buffer[110][7:0] = buffer_out_val[110][7:0];
		nxt_buffer[111][7:0] = buffer_out_val[111][7:0];
		nxt_buffer[112][7:0] = buffer_out_val[112][7:0];
		nxt_buffer[113][7:0] = buffer_out_val[113][7:0];
		nxt_buffer[114][7:0] = buffer_out_val[114][7:0];
		nxt_buffer[115][7:0] = buffer_out_val[115][7:0];
		nxt_buffer[116][7:0] = buffer_out_val[116][7:0];
		nxt_buffer[117][7:0] = buffer_out_val[117][7:0];
		nxt_buffer[118][7:0] = buffer_out_val[118][7:0];
		nxt_buffer[119][7:0] = buffer_out_val[119][7:0];

		nxt_buffer[120][7:0] = buffer_out_val[120][7:0];
		nxt_buffer[121][7:0] = buffer_out_val[121][7:0];
		nxt_buffer[122][7:0] = buffer_out_val[122][7:0];
		nxt_buffer[123][7:0] = buffer_out_val[123][7:0];
		nxt_buffer[124][7:0] = buffer_out_val[124][7:0];
		nxt_buffer[125][7:0] = buffer_out_val[125][7:0];
		nxt_buffer[126][7:0] = buffer_out_val[126][7:0];
		nxt_buffer[127][7:0] = buffer_out_val[127][7:0];
		next_state = idle;
		end//else ends

end//idle state ends
	load_buffer:
	begin
		
		if(shift_in == 1'b0)
		begin
		nxt_buffer[0][7:0] = nxt_buffer[0][7:0];
		nxt_buffer[1][7:0] = nxt_buffer[1][7:0];
		nxt_buffer[2][7:0] = nxt_buffer[2][7:0];
		nxt_buffer[3][7:0] = nxt_buffer[3][7:0];
		nxt_buffer[4][7:0] = nxt_buffer[4][7:0];
		nxt_buffer[5][7:0] = nxt_buffer[5][7:0];
		nxt_buffer[6][7:0] = nxt_buffer[6][7:0];
		nxt_buffer[7][7:0] = nxt_buffer[7][7:0];


		nxt_buffer[8][7:0] = nxt_buffer[8][7:0];
		nxt_buffer[9][7:0] = nxt_buffer[9][7:0];
		nxt_buffer[10][7:0] = nxt_buffer[10][7:0];
		nxt_buffer[11][7:0] = nxt_buffer[11][7:0];
		nxt_buffer[12][7:0] = nxt_buffer[12][7:0];
		nxt_buffer[13][7:0] = nxt_buffer[13][7:0];
		nxt_buffer[14][7:0] = nxt_buffer[14][7:0];
		nxt_buffer[15][7:0] = nxt_buffer[15][7:0];
		nxt_buffer[16][7:0] = nxt_buffer[16][7:0];
		nxt_buffer[17][7:0] = nxt_buffer[17][7:0];
		nxt_buffer[18][7:0] = nxt_buffer[18][7:0];
		nxt_buffer[19][7:0] = nxt_buffer[19][7:0];
		nxt_buffer[20][7:0] = nxt_buffer[20][7:0];

		nxt_buffer[21][7:0] = nxt_buffer[21][7:0];
		nxt_buffer[22][7:0] = nxt_buffer[22][7:0];
		nxt_buffer[23][7:0] = nxt_buffer[23][7:0];
		nxt_buffer[24][7:0] = nxt_buffer[24][7:0];
		nxt_buffer[25][7:0] = nxt_buffer[25][7:0];
		nxt_buffer[26][7:0] = nxt_buffer[26][7:0];
		nxt_buffer[27][7:0] = nxt_buffer[27][7:0];
		nxt_buffer[28][7:0] = nxt_buffer[28][7:0];
		nxt_buffer[29][7:0] = nxt_buffer[29][7:0];
		nxt_buffer[30][7:0] = nxt_buffer[30][7:0];

		nxt_buffer[31][7:0] = nxt_buffer[31][7:0];
		nxt_buffer[32][7:0] = nxt_buffer[32][7:0];
		nxt_buffer[33][7:0] = nxt_buffer[33][7:0];
		nxt_buffer[34][7:0] = nxt_buffer[34][7:0];
		nxt_buffer[35][7:0] = nxt_buffer[35][7:0];
		nxt_buffer[36][7:0] = nxt_buffer[36][7:0];
		nxt_buffer[37][7:0] = nxt_buffer[37][7:0];
		nxt_buffer[38][7:0] = nxt_buffer[38][7:0];
		nxt_buffer[39][7:0] = nxt_buffer[39][7:0];
		nxt_buffer[40][7:0] = nxt_buffer[40][7:0];
		nxt_buffer[41][7:0] = nxt_buffer[41][7:0];
		nxt_buffer[42][7:0] = nxt_buffer[42][7:0];

		nxt_buffer[43][7:0] = nxt_buffer[43][7:0];
		nxt_buffer[44][7:0] = nxt_buffer[44][7:0];
		nxt_buffer[45][7:0] = nxt_buffer[45][7:0];
		nxt_buffer[46][7:0] = nxt_buffer[46][7:0];
		nxt_buffer[47][7:0] = nxt_buffer[47][7:0];
		nxt_buffer[48][7:0] = nxt_buffer[48][7:0];
		nxt_buffer[49][7:0] = nxt_buffer[49][7:0];
		
		nxt_buffer[50][7:0] = nxt_buffer[50][7:0];
		nxt_buffer[51][7:0] = nxt_buffer[51][7:0];
		nxt_buffer[52][7:0] = nxt_buffer[52][7:0];
		nxt_buffer[53][7:0] = nxt_buffer[53][7:0];
		nxt_buffer[54][7:0] = nxt_buffer[54][7:0];
		nxt_buffer[55][7:0] = nxt_buffer[55][7:0];
		nxt_buffer[56][7:0] = nxt_buffer[56][7:0];
		nxt_buffer[57][7:0] = nxt_buffer[57][7:0];
		nxt_buffer[58][7:0] = nxt_buffer[58][7:0];
		nxt_buffer[59][7:0] = nxt_buffer[59][7:0];
		nxt_buffer[60][7:0] = nxt_buffer[60][7:0];

		nxt_buffer[61][7:0] = nxt_buffer[61][7:0];
		nxt_buffer[62][7:0] = nxt_buffer[62][7:0];
		nxt_buffer[63][7:0] = nxt_buffer[63][7:0];
		nxt_buffer[64][7:0] = nxt_buffer[64][7:0];
		nxt_buffer[65][7:0] = nxt_buffer[65][7:0];
		nxt_buffer[66][7:0] = nxt_buffer[66][7:0];
		nxt_buffer[67][7:0] = nxt_buffer[67][7:0];
		nxt_buffer[68][7:0] = nxt_buffer[68][7:0];
		nxt_buffer[69][7:0] = nxt_buffer[69][7:0];
		nxt_buffer[70][7:0] = nxt_buffer[70][7:0];

		nxt_buffer[71][7:0] = nxt_buffer[71][7:0];
		nxt_buffer[72][7:0] = nxt_buffer[72][7:0];
		nxt_buffer[73][7:0] = nxt_buffer[73][7:0];
		nxt_buffer[74][7:0] = nxt_buffer[74][7:0];
		nxt_buffer[75][7:0] = nxt_buffer[75][7:0];
		nxt_buffer[76][7:0] = nxt_buffer[76][7:0];
		nxt_buffer[77][7:0] = nxt_buffer[77][7:0];
		nxt_buffer[78][7:0] = nxt_buffer[78][7:0];
		nxt_buffer[79][7:0] = nxt_buffer[79][7:0];
		nxt_buffer[80][7:0] = nxt_buffer[80][7:0];

		nxt_buffer[81][7:0] = nxt_buffer[81][7:0];
		nxt_buffer[82][7:0] = nxt_buffer[82][7:0];
		nxt_buffer[83][7:0] = nxt_buffer[83][7:0];
		nxt_buffer[84][7:0] = nxt_buffer[84][7:0];
		nxt_buffer[85][7:0] = nxt_buffer[85][7:0];
		nxt_buffer[86][7:0] = nxt_buffer[86][7:0];
		nxt_buffer[87][7:0] = nxt_buffer[87][7:0];
		nxt_buffer[88][7:0] = nxt_buffer[88][7:0];
		nxt_buffer[89][7:0] = nxt_buffer[89][7:0];
		nxt_buffer[90][7:0] = nxt_buffer[90][7:0];
		nxt_buffer[91][7:0] = nxt_buffer[91][7:0];
		nxt_buffer[92][7:0] = nxt_buffer[92][7:0];
		nxt_buffer[93][7:0] = nxt_buffer[93][7:0];
		nxt_buffer[94][7:0] = nxt_buffer[94][7:0];
		nxt_buffer[95][7:0] = nxt_buffer[95][7:0];
		nxt_buffer[96][7:0] = nxt_buffer[96][7:0];
		nxt_buffer[97][7:0] = nxt_buffer[97][7:0];
		nxt_buffer[98][7:0] = nxt_buffer[98][7:0];
		nxt_buffer[99][7:0] = nxt_buffer[99][7:0];

		nxt_buffer[100][7:0] = nxt_buffer[100][7:0];
		nxt_buffer[101][7:0] = nxt_buffer[101][7:0];
		nxt_buffer[102][7:0] = nxt_buffer[102][7:0];
		nxt_buffer[103][7:0] = nxt_buffer[103][7:0];
		nxt_buffer[104][7:0] = nxt_buffer[104][7:0];
		nxt_buffer[105][7:0] = nxt_buffer[105][7:0];
		nxt_buffer[106][7:0] = nxt_buffer[106][7:0];
		nxt_buffer[107][7:0] = nxt_buffer[107][7:0];
		nxt_buffer[108][7:0] = nxt_buffer[108][7:0];
		nxt_buffer[109][7:0] = nxt_buffer[109][7:0];

		nxt_buffer[110][7:0] = nxt_buffer[110][7:0];
		nxt_buffer[111][7:0] = nxt_buffer[111][7:0];
		nxt_buffer[112][7:0] = nxt_buffer[112][7:0];
		nxt_buffer[113][7:0] = nxt_buffer[113][7:0];
		nxt_buffer[114][7:0] = nxt_buffer[114][7:0];
		nxt_buffer[115][7:0] = nxt_buffer[115][7:0];
		nxt_buffer[116][7:0] = nxt_buffer[116][7:0];
		nxt_buffer[117][7:0] = nxt_buffer[117][7:0];
		nxt_buffer[118][7:0] = nxt_buffer[118][7:0];
		nxt_buffer[119][7:0] = nxt_buffer[119][7:0];

		nxt_buffer[120][7:0] = nxt_buffer[120][7:0];
		nxt_buffer[121][7:0] = nxt_buffer[121][7:0];
		nxt_buffer[122][7:0] = nxt_buffer[122][7:0];
		nxt_buffer[123][7:0] = nxt_buffer[123][7:0];
		nxt_buffer[124][7:0] = nxt_buffer[124][7:0];
		nxt_buffer[125][7:0] = nxt_buffer[125][7:0];
		nxt_buffer[126][7:0] = nxt_buffer[126][7:0];
		nxt_buffer[127][7:0] = nxt_buffer[127][7:0];
		next_state = idle;
		end

		else
		begin
		//i_next = i_next + 1; //increment till 128 values have been reached
		nxt_buffer[0][7:0] = data_in[7:0];

		nxt_buffer[1][7:0] = buffer_out_val[0][7:0];
		nxt_buffer[2][7:0] = buffer_out_val[1][7:0];
		nxt_buffer[3][7:0] = buffer_out_val[2][7:0];
		nxt_buffer[4][7:0] = buffer_out_val[3][7:0];
		nxt_buffer[5][7:0] = buffer_out_val[4][7:0];
		nxt_buffer[6][7:0] = buffer_out_val[5][7:0];
		nxt_buffer[7][7:0] = buffer_out_val[6][7:0];
		nxt_buffer[8][7:0] = buffer_out_val[7][7:0];


		nxt_buffer[9][7:0] = buffer_out_val[8][7:0];
		nxt_buffer[10][7:0] = buffer_out_val[9][7:0];
		nxt_buffer[11][7:0] = buffer_out_val[10][7:0];
		nxt_buffer[12][7:0] = buffer_out_val[11][7:0];
		nxt_buffer[13][7:0] = buffer_out_val[12][7:0];
		nxt_buffer[14][7:0] = buffer_out_val[13][7:0];
		nxt_buffer[15][7:0] = buffer_out_val[14][7:0];
		nxt_buffer[16][7:0] = buffer_out_val[15][7:0];
		nxt_buffer[17][7:0] = buffer_out_val[16][7:0];
		nxt_buffer[18][7:0] = buffer_out_val[17][7:0];
		nxt_buffer[19][7:0] = buffer_out_val[18][7:0];
		nxt_buffer[20][7:0] = buffer_out_val[19][7:0];
		nxt_buffer[21][7:0] = buffer_out_val[20][7:0];

		nxt_buffer[22][7:0] = buffer_out_val[21][7:0];
		nxt_buffer[23][7:0] = buffer_out_val[22][7:0];
		nxt_buffer[24][7:0] = buffer_out_val[23][7:0];
		nxt_buffer[25][7:0] = buffer_out_val[24][7:0];
		nxt_buffer[26][7:0] = buffer_out_val[25][7:0];
		nxt_buffer[27][7:0] = buffer_out_val[26][7:0];
		nxt_buffer[28][7:0] = buffer_out_val[27][7:0];
		nxt_buffer[29][7:0] = buffer_out_val[28][7:0];
		nxt_buffer[30][7:0] = buffer_out_val[29][7:0];
		nxt_buffer[31][7:0] = buffer_out_val[30][7:0];

		nxt_buffer[32][7:0] = buffer_out_val[31][7:0];
		nxt_buffer[33][7:0] = buffer_out_val[32][7:0];
		nxt_buffer[34][7:0] = buffer_out_val[33][7:0];
		nxt_buffer[35][7:0] = buffer_out_val[34][7:0];
		nxt_buffer[36][7:0] = buffer_out_val[35][7:0];
		nxt_buffer[37][7:0] = buffer_out_val[36][7:0];
		nxt_buffer[38][7:0] = buffer_out_val[37][7:0];
		nxt_buffer[39][7:0] = buffer_out_val[38][7:0];
		nxt_buffer[40][7:0] = buffer_out_val[39][7:0];
		nxt_buffer[41][7:0] = buffer_out_val[40][7:0];
		nxt_buffer[42][7:0] = buffer_out_val[41][7:0];
		nxt_buffer[43][7:0] = buffer_out_val[42][7:0];

		nxt_buffer[44][7:0] = buffer_out_val[43][7:0];
		nxt_buffer[45][7:0] = buffer_out_val[44][7:0];
		nxt_buffer[46][7:0] = buffer_out_val[45][7:0];
		nxt_buffer[47][7:0] = buffer_out_val[46][7:0];
		nxt_buffer[48][7:0] = buffer_out_val[47][7:0];
		nxt_buffer[49][7:0] = buffer_out_val[48][7:0];
		nxt_buffer[50][7:0] = buffer_out_val[49][7:0];
		
		nxt_buffer[51][7:0] = buffer_out_val[50][7:0];
		nxt_buffer[52][7:0] = buffer_out_val[51][7:0];
		nxt_buffer[53][7:0] = buffer_out_val[52][7:0];
		nxt_buffer[54][7:0] = buffer_out_val[53][7:0];
		nxt_buffer[55][7:0] = buffer_out_val[54][7:0];
		nxt_buffer[56][7:0] = buffer_out_val[55][7:0];
		nxt_buffer[57][7:0] = buffer_out_val[56][7:0];
		nxt_buffer[58][7:0] = buffer_out_val[57][7:0];
		nxt_buffer[59][7:0] = buffer_out_val[58][7:0];
		nxt_buffer[60][7:0] = buffer_out_val[59][7:0];
		nxt_buffer[61][7:0] = buffer_out_val[60][7:0];

		nxt_buffer[62][7:0] = buffer_out_val[61][7:0];
		nxt_buffer[63][7:0] = buffer_out_val[62][7:0];
		nxt_buffer[64][7:0] = buffer_out_val[63][7:0];
		nxt_buffer[65][7:0] = buffer_out_val[64][7:0];
		nxt_buffer[66][7:0] = buffer_out_val[65][7:0];
		nxt_buffer[67][7:0] = buffer_out_val[66][7:0];
		nxt_buffer[68][7:0] = buffer_out_val[67][7:0];
		nxt_buffer[69][7:0] = buffer_out_val[68][7:0];
		nxt_buffer[70][7:0] = buffer_out_val[69][7:0];
		nxt_buffer[71][7:0] = buffer_out_val[70][7:0];

		nxt_buffer[72][7:0] = buffer_out_val[71][7:0];
		nxt_buffer[73][7:0] = buffer_out_val[72][7:0];
		nxt_buffer[74][7:0] = buffer_out_val[73][7:0];
		nxt_buffer[75][7:0] = buffer_out_val[74][7:0];
		nxt_buffer[76][7:0] = buffer_out_val[75][7:0];
		nxt_buffer[77][7:0] = buffer_out_val[76][7:0];
		nxt_buffer[78][7:0] = buffer_out_val[77][7:0];
		nxt_buffer[79][7:0] = buffer_out_val[78][7:0];
		nxt_buffer[80][7:0] = buffer_out_val[79][7:0];
		nxt_buffer[81][7:0] = buffer_out_val[80][7:0];

		nxt_buffer[82][7:0] = buffer_out_val[81][7:0];
		nxt_buffer[83][7:0] = buffer_out_val[82][7:0];
		nxt_buffer[84][7:0] = buffer_out_val[83][7:0];
		nxt_buffer[85][7:0] = buffer_out_val[84][7:0];
		nxt_buffer[86][7:0] = buffer_out_val[85][7:0];
		nxt_buffer[87][7:0] = buffer_out_val[86][7:0];
		nxt_buffer[88][7:0] = buffer_out_val[87][7:0];
		nxt_buffer[89][7:0] = buffer_out_val[88][7:0];
		nxt_buffer[90][7:0] = buffer_out_val[89][7:0];
		nxt_buffer[91][7:0] = buffer_out_val[90][7:0];
		nxt_buffer[92][7:0] = buffer_out_val[91][7:0];
		nxt_buffer[93][7:0] = buffer_out_val[92][7:0];
		nxt_buffer[94][7:0] = buffer_out_val[93][7:0];
		nxt_buffer[95][7:0] = buffer_out_val[94][7:0];
		nxt_buffer[96][7:0] = buffer_out_val[95][7:0];
		nxt_buffer[97][7:0] = buffer_out_val[96][7:0];
		nxt_buffer[98][7:0] = buffer_out_val[97][7:0];
		nxt_buffer[99][7:0] = buffer_out_val[98][7:0];
		nxt_buffer[100][7:0] = buffer_out_val[99][7:0];

		nxt_buffer[101][7:0] = buffer_out_val[100][7:0];
		nxt_buffer[102][7:0] = buffer_out_val[101][7:0];
		nxt_buffer[103][7:0] = buffer_out_val[102][7:0];
		nxt_buffer[104][7:0] = buffer_out_val[103][7:0];
		nxt_buffer[105][7:0] = buffer_out_val[104][7:0];
		nxt_buffer[106][7:0] = buffer_out_val[105][7:0];
		nxt_buffer[107][7:0] = buffer_out_val[106][7:0];
		nxt_buffer[108][7:0] = buffer_out_val[107][7:0];
		nxt_buffer[109][7:0] = buffer_out_val[108][7:0];
		nxt_buffer[110][7:0] = buffer_out_val[109][7:0];

		nxt_buffer[111][7:0] = buffer_out_val[110][7:0];
		nxt_buffer[112][7:0] = buffer_out_val[111][7:0];
		nxt_buffer[113][7:0] = buffer_out_val[112][7:0];
		nxt_buffer[114][7:0] = buffer_out_val[113][7:0];
		nxt_buffer[115][7:0] = buffer_out_val[114][7:0];
		nxt_buffer[116][7:0] = buffer_out_val[115][7:0];
		nxt_buffer[117][7:0] = buffer_out_val[116][7:0];
		nxt_buffer[118][7:0] = buffer_out_val[117][7:0];
		nxt_buffer[119][7:0] = buffer_out_val[118][7:0];
		nxt_buffer[120][7:0] = buffer_out_val[119][7:0];

		nxt_buffer[121][7:0] = buffer_out_val[120][7:0];
		nxt_buffer[122][7:0] = buffer_out_val[121][7:0];
		nxt_buffer[123][7:0] = buffer_out_val[122][7:0];
		nxt_buffer[124][7:0] = buffer_out_val[123][7:0];
		nxt_buffer[125][7:0] = buffer_out_val[124][7:0];
		nxt_buffer[126][7:0] = buffer_out_val[125][7:0];
		nxt_buffer[127][7:0] = buffer_out_val[126][7:0];
		next_state = load_buffer;
		end//else ends
	//if(shift_in == 1'b1)
	//begin





		//for(i1 = 1; i1 < 127; i1++)
		//begin
			//for(j1 = 0; j1 < 7 ; j1++)
			//begin
			//	nxt_buffer[i][j] = buffer_out_val[i-1][j];
			//end
		//end
		//nxt_buffer[0] = data_in;
	//end

	//else
	//begin


		//for(i1 = 0; i1 < 127; i1++)
		//begin
			//for(j1=0; j1<7; j1++)
			//begin
			//	nxt_buffer[i][j] = buffer_out_val[i][j];
			//end
		//end //second for loop ends
	//end//else ends

end//load_buffer state ends
	
	default:
	begin
		nxt_buffer[0][7:0] = nxt_buffer[0][7:0];
		nxt_buffer[1][7:0] = nxt_buffer[1][7:0];
		nxt_buffer[2][7:0] = nxt_buffer[2][7:0];
		nxt_buffer[3][7:0] = nxt_buffer[3][7:0];
		nxt_buffer[4][7:0] = nxt_buffer[4][7:0];
		nxt_buffer[5][7:0] = nxt_buffer[5][7:0];
		nxt_buffer[6][7:0] = nxt_buffer[6][7:0];
		nxt_buffer[7][7:0] = nxt_buffer[7][7:0];


		nxt_buffer[8][7:0] = nxt_buffer[8][7:0];
		nxt_buffer[9][7:0] = nxt_buffer[9][7:0];
		nxt_buffer[10][7:0] = nxt_buffer[10][7:0];
		nxt_buffer[11][7:0] = nxt_buffer[11][7:0];
		nxt_buffer[12][7:0] = nxt_buffer[12][7:0];
		nxt_buffer[13][7:0] = nxt_buffer[13][7:0];
		nxt_buffer[14][7:0] = nxt_buffer[14][7:0];
		nxt_buffer[15][7:0] = nxt_buffer[15][7:0];
		nxt_buffer[16][7:0] = nxt_buffer[16][7:0];
		nxt_buffer[17][7:0] = nxt_buffer[17][7:0];
		nxt_buffer[18][7:0] = nxt_buffer[18][7:0];
		nxt_buffer[19][7:0] = nxt_buffer[19][7:0];
		nxt_buffer[20][7:0] = nxt_buffer[20][7:0];

		nxt_buffer[21][7:0] = nxt_buffer[21][7:0];
		nxt_buffer[22][7:0] = nxt_buffer[22][7:0];
		nxt_buffer[23][7:0] = nxt_buffer[23][7:0];
		nxt_buffer[24][7:0] = nxt_buffer[24][7:0];
		nxt_buffer[25][7:0] = nxt_buffer[25][7:0];
		nxt_buffer[26][7:0] = nxt_buffer[26][7:0];
		nxt_buffer[27][7:0] = nxt_buffer[27][7:0];
		nxt_buffer[28][7:0] = nxt_buffer[28][7:0];
		nxt_buffer[29][7:0] = nxt_buffer[29][7:0];
		nxt_buffer[30][7:0] = nxt_buffer[30][7:0];

		nxt_buffer[31][7:0] = nxt_buffer[31][7:0];
		nxt_buffer[32][7:0] = nxt_buffer[32][7:0];
		nxt_buffer[33][7:0] = nxt_buffer[33][7:0];
		nxt_buffer[34][7:0] = nxt_buffer[34][7:0];
		nxt_buffer[35][7:0] = nxt_buffer[35][7:0];
		nxt_buffer[36][7:0] = nxt_buffer[36][7:0];
		nxt_buffer[37][7:0] = nxt_buffer[37][7:0];
		nxt_buffer[38][7:0] = nxt_buffer[38][7:0];
		nxt_buffer[39][7:0] = nxt_buffer[39][7:0];
		nxt_buffer[40][7:0] = nxt_buffer[40][7:0];
		nxt_buffer[41][7:0] = nxt_buffer[41][7:0];
		nxt_buffer[42][7:0] = nxt_buffer[42][7:0];

		nxt_buffer[43][7:0] = nxt_buffer[43][7:0];
		nxt_buffer[44][7:0] = nxt_buffer[44][7:0];
		nxt_buffer[45][7:0] = nxt_buffer[45][7:0];
		nxt_buffer[46][7:0] = nxt_buffer[46][7:0];
		nxt_buffer[47][7:0] = nxt_buffer[47][7:0];
		nxt_buffer[48][7:0] = nxt_buffer[48][7:0];
		nxt_buffer[49][7:0] = nxt_buffer[49][7:0];
		
		nxt_buffer[50][7:0] = nxt_buffer[50][7:0];
		nxt_buffer[51][7:0] = nxt_buffer[51][7:0];
		nxt_buffer[52][7:0] = nxt_buffer[52][7:0];
		nxt_buffer[53][7:0] = nxt_buffer[53][7:0];
		nxt_buffer[54][7:0] = nxt_buffer[54][7:0];
		nxt_buffer[55][7:0] = nxt_buffer[55][7:0];
		nxt_buffer[56][7:0] = nxt_buffer[56][7:0];
		nxt_buffer[57][7:0] = nxt_buffer[57][7:0];
		nxt_buffer[58][7:0] = nxt_buffer[58][7:0];
		nxt_buffer[59][7:0] = nxt_buffer[59][7:0];
		nxt_buffer[60][7:0] = nxt_buffer[60][7:0];

		nxt_buffer[61][7:0] = nxt_buffer[61][7:0];
		nxt_buffer[62][7:0] = nxt_buffer[62][7:0];
		nxt_buffer[63][7:0] = nxt_buffer[63][7:0];
		nxt_buffer[64][7:0] = nxt_buffer[64][7:0];
		nxt_buffer[65][7:0] = nxt_buffer[65][7:0];
		nxt_buffer[66][7:0] = nxt_buffer[66][7:0];
		nxt_buffer[67][7:0] = nxt_buffer[67][7:0];
		nxt_buffer[68][7:0] = nxt_buffer[68][7:0];
		nxt_buffer[69][7:0] = nxt_buffer[69][7:0];
		nxt_buffer[70][7:0] = nxt_buffer[70][7:0];

		nxt_buffer[71][7:0] = nxt_buffer[71][7:0];
		nxt_buffer[72][7:0] = nxt_buffer[72][7:0];
		nxt_buffer[73][7:0] = nxt_buffer[73][7:0];
		nxt_buffer[74][7:0] = nxt_buffer[74][7:0];
		nxt_buffer[75][7:0] = nxt_buffer[75][7:0];
		nxt_buffer[76][7:0] = nxt_buffer[76][7:0];
		nxt_buffer[77][7:0] = nxt_buffer[77][7:0];
		nxt_buffer[78][7:0] = nxt_buffer[78][7:0];
		nxt_buffer[79][7:0] = nxt_buffer[79][7:0];
		nxt_buffer[80][7:0] = nxt_buffer[80][7:0];

		nxt_buffer[81][7:0] = nxt_buffer[81][7:0];
		nxt_buffer[82][7:0] = nxt_buffer[82][7:0];
		nxt_buffer[83][7:0] = nxt_buffer[83][7:0];
		nxt_buffer[84][7:0] = nxt_buffer[84][7:0];
		nxt_buffer[85][7:0] = nxt_buffer[85][7:0];
		nxt_buffer[86][7:0] = nxt_buffer[86][7:0];
		nxt_buffer[87][7:0] = nxt_buffer[87][7:0];
		nxt_buffer[88][7:0] = nxt_buffer[88][7:0];
		nxt_buffer[89][7:0] = nxt_buffer[89][7:0];
		nxt_buffer[90][7:0] = nxt_buffer[90][7:0];
		nxt_buffer[91][7:0] = nxt_buffer[91][7:0];
		nxt_buffer[92][7:0] = nxt_buffer[92][7:0];
		nxt_buffer[93][7:0] = nxt_buffer[93][7:0];
		nxt_buffer[94][7:0] = nxt_buffer[94][7:0];
		nxt_buffer[95][7:0] = nxt_buffer[95][7:0];
		nxt_buffer[96][7:0] = nxt_buffer[96][7:0];
		nxt_buffer[97][7:0] = nxt_buffer[97][7:0];
		nxt_buffer[98][7:0] = nxt_buffer[98][7:0];
		nxt_buffer[99][7:0] = nxt_buffer[99][7:0];

		nxt_buffer[100][7:0] = nxt_buffer[100][7:0];
		nxt_buffer[101][7:0] = nxt_buffer[101][7:0];
		nxt_buffer[102][7:0] = nxt_buffer[102][7:0];
		nxt_buffer[103][7:0] = nxt_buffer[103][7:0];
		nxt_buffer[104][7:0] = nxt_buffer[104][7:0];
		nxt_buffer[105][7:0] = nxt_buffer[105][7:0];
		nxt_buffer[106][7:0] = nxt_buffer[106][7:0];
		nxt_buffer[107][7:0] = nxt_buffer[107][7:0];
		nxt_buffer[108][7:0] = nxt_buffer[108][7:0];
		nxt_buffer[109][7:0] = nxt_buffer[109][7:0];

		nxt_buffer[110][7:0] = nxt_buffer[110][7:0];
		nxt_buffer[111][7:0] = nxt_buffer[111][7:0];
		nxt_buffer[112][7:0] = nxt_buffer[112][7:0];
		nxt_buffer[113][7:0] = nxt_buffer[113][7:0];
		nxt_buffer[114][7:0] = nxt_buffer[114][7:0];
		nxt_buffer[115][7:0] = nxt_buffer[115][7:0];
		nxt_buffer[116][7:0] = nxt_buffer[116][7:0];
		nxt_buffer[117][7:0] = nxt_buffer[117][7:0];
		nxt_buffer[118][7:0] = nxt_buffer[118][7:0];
		nxt_buffer[119][7:0] = nxt_buffer[119][7:0];

		nxt_buffer[120][7:0] = nxt_buffer[120][7:0];
		nxt_buffer[121][7:0] = nxt_buffer[121][7:0];
		nxt_buffer[122][7:0] = nxt_buffer[122][7:0];
		nxt_buffer[123][7:0] = nxt_buffer[123][7:0];
		nxt_buffer[124][7:0] = nxt_buffer[124][7:0];
		nxt_buffer[125][7:0] = nxt_buffer[125][7:0];
		nxt_buffer[126][7:0] = nxt_buffer[126][7:0];
		nxt_buffer[127][7:0] = nxt_buffer[127][7:0];
	end
endcase

	if(count_out == 9'd63)
	begin
		rf1 = 1;
		count_out_next ='0;
	end

	else
	begin
		rf1 = 0;
	end
end//always_comb block ends

endmodule
