
module work_buffer
(
	input wire clk,
	input wire n_rst,
	input wire counter_in,
	input wire [127:0][7:0] buffer_in_value,
	output wire [127:0][7:0] buffer_out_value
);


reg [127:0][7:0] nxt_buffer; //this is my actual working buffer
reg [127:0][7:0] buffer_in;

assign buffer_out_value = nxt_buffer;

always_ff @(posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
	begin
		buffer_in <= '0;		
	end

	else
	begin
		buffer_in[0][7:0] <= buffer_in_value[0][7:0];
		buffer_in[1][7:0] <= buffer_in_value[1][7:0];
		buffer_in[2][7:0] <= buffer_in_value[2][7:0];
		buffer_in[3][7:0] <= buffer_in_value[3][7:0];
		buffer_in[4][7:0] <= buffer_in_value[4][7:0];
		buffer_in[5][7:0] <= buffer_in_value[5][7:0];
		buffer_in[6][7:0] <= buffer_in_value[6][7:0];
		buffer_in[7][7:0] <= buffer_in_value[7][7:0];


		buffer_in[8][7:0] <= buffer_in_value[8][7:0];
		buffer_in[9][7:0] <= buffer_in_value[9][7:0];
		buffer_in[10][7:0] <= buffer_in_value[10][7:0];
		buffer_in[11][7:0] <= buffer_in_value[11][7:0];
		buffer_in[12][7:0] <= buffer_in_value[12][7:0];
		buffer_in[13][7:0] <= buffer_in_value[13][7:0];
		buffer_in[14][7:0] <= buffer_in_value[14][7:0];
		buffer_in[15][7:0] <= buffer_in_value[15][7:0];
		buffer_in[16][7:0] <= buffer_in_value[16][7:0];
		buffer_in[17][7:0] <= buffer_in_value[17][7:0];
		buffer_in[18][7:0] <= buffer_in_value[18][7:0];
		buffer_in[19][7:0] <= buffer_in_value[19][7:0];
		buffer_in[20][7:0] <= buffer_in_value[20][7:0];

		buffer_in[21][7:0] <= buffer_in_value[21][7:0];
		buffer_in[22][7:0] <= buffer_in_value[22][7:0];
		buffer_in[23][7:0] <= buffer_in_value[23][7:0];
		buffer_in[24][7:0] <= buffer_in_value[24][7:0];
		buffer_in[25][7:0] <= buffer_in_value[25][7:0];
		buffer_in[26][7:0] <= buffer_in_value[26][7:0];
		buffer_in[27][7:0] <= buffer_in_value[27][7:0];
		buffer_in[28][7:0] <= buffer_in_value[28][7:0];
		buffer_in[29][7:0] <= buffer_in_value[29][7:0];
		buffer_in[30][7:0] <= buffer_in_value[30][7:0];

		buffer_in[31][7:0] <= buffer_in_value[31][7:0];
		buffer_in[32][7:0] <= buffer_in_value[32][7:0];
		buffer_in[33][7:0] <= buffer_in_value[33][7:0];
		buffer_in[34][7:0] <= buffer_in_value[34][7:0];
		buffer_in[35][7:0] <= buffer_in_value[35][7:0];
		buffer_in[36][7:0] <= buffer_in_value[36][7:0];
		buffer_in[37][7:0] <= buffer_in_value[37][7:0];
		buffer_in[38][7:0] <= buffer_in_value[38][7:0];
		buffer_in[39][7:0] <= buffer_in_value[39][7:0];
		buffer_in[40][7:0] <= buffer_in_value[40][7:0];
		buffer_in[41][7:0] <= buffer_in_value[41][7:0];
		buffer_in[42][7:0] <= buffer_in_value[42][7:0];

		buffer_in[43][7:0] <= buffer_in_value[43][7:0];
		buffer_in[44][7:0] <= buffer_in_value[44][7:0];
		buffer_in[45][7:0] <= buffer_in_value[45][7:0];
		buffer_in[46][7:0] <= buffer_in_value[46][7:0];
		buffer_in[47][7:0] <= buffer_in_value[47][7:0];
		buffer_in[48][7:0] <= buffer_in_value[48][7:0];
		buffer_in[49][7:0] <= buffer_in_value[49][7:0];
		
		buffer_in[50][7:0] <= buffer_in_value[50][7:0];
		buffer_in[51][7:0] <= buffer_in_value[51][7:0];
		buffer_in[52][7:0] <= buffer_in_value[52][7:0];
		buffer_in[53][7:0] <= buffer_in_value[53][7:0];
		buffer_in[54][7:0] <= buffer_in_value[54][7:0];
		buffer_in[55][7:0] <= buffer_in_value[55][7:0];
		buffer_in[56][7:0] <= buffer_in_value[56][7:0];
		buffer_in[57][7:0] <= buffer_in_value[57][7:0];
		buffer_in[58][7:0] <= buffer_in_value[58][7:0];
		buffer_in[59][7:0] <= buffer_in_value[59][7:0];
		buffer_in[60][7:0] <= buffer_in_value[60][7:0];

		buffer_in[61][7:0] <= buffer_in_value[61][7:0];
		buffer_in[62][7:0] <= buffer_in_value[62][7:0];
		buffer_in[63][7:0] <= buffer_in_value[63][7:0];
		buffer_in[64][7:0] <= buffer_in_value[64][7:0];
		buffer_in[65][7:0] <= buffer_in_value[65][7:0];
		buffer_in[66][7:0] <= buffer_in_value[66][7:0];
		buffer_in[67][7:0] <= buffer_in_value[67][7:0];
		buffer_in[68][7:0] <= buffer_in_value[68][7:0];
		buffer_in[69][7:0] <= buffer_in_value[69][7:0];
		buffer_in[70][7:0] <= buffer_in_value[70][7:0];

		buffer_in[71][7:0] <= buffer_in_value[71][7:0];
		buffer_in[72][7:0] <= buffer_in_value[72][7:0];
		buffer_in[73][7:0] <= buffer_in_value[73][7:0];
		buffer_in[74][7:0] <= buffer_in_value[74][7:0];
		buffer_in[75][7:0] <= buffer_in_value[75][7:0];
		buffer_in[76][7:0] <= buffer_in_value[76][7:0];
		buffer_in[77][7:0] <= buffer_in_value[77][7:0];
		buffer_in[78][7:0] <= buffer_in_value[78][7:0];
		buffer_in[79][7:0] <= buffer_in_value[79][7:0];
		buffer_in[80][7:0] <= buffer_in_value[80][7:0];

		buffer_in[81][7:0] <= buffer_in_value[81][7:0];
		buffer_in[82][7:0] <= buffer_in_value[82][7:0];
		buffer_in[83][7:0] <= buffer_in_value[83][7:0];
		buffer_in[84][7:0] <= buffer_in_value[84][7:0];
		buffer_in[85][7:0] <= buffer_in_value[85][7:0];
		buffer_in[86][7:0] <= buffer_in_value[86][7:0];
		buffer_in[87][7:0] <= buffer_in_value[87][7:0];
		buffer_in[88][7:0] <= buffer_in_value[88][7:0];
		buffer_in[89][7:0] <= buffer_in_value[89][7:0];
		buffer_in[90][7:0] <= buffer_in_value[90][7:0];
		buffer_in[91][7:0] <= buffer_in_value[91][7:0];
		buffer_in[92][7:0] <= buffer_in_value[92][7:0];
		buffer_in[93][7:0] <= buffer_in_value[93][7:0];
		buffer_in[94][7:0] <= buffer_in_value[94][7:0];
		buffer_in[95][7:0] <= buffer_in_value[95][7:0];
		buffer_in[96][7:0] <= buffer_in_value[96][7:0];
		buffer_in[97][7:0] <= buffer_in_value[97][7:0];
		buffer_in[98][7:0] <= buffer_in_value[98][7:0];
		buffer_in[99][7:0] <= buffer_in_value[99][7:0];

		buffer_in[100][7:0] <= buffer_in_value[100][7:0];
		buffer_in[101][7:0] <= buffer_in_value[101][7:0];
		buffer_in[102][7:0] <= buffer_in_value[102][7:0];
		buffer_in[103][7:0] <= buffer_in_value[103][7:0];
		buffer_in[104][7:0] <= buffer_in_value[104][7:0];
		buffer_in[105][7:0] <= buffer_in_value[105][7:0];
		buffer_in[106][7:0] <= buffer_in_value[106][7:0];
		buffer_in[107][7:0] <= buffer_in_value[107][7:0];
		buffer_in[108][7:0] <= buffer_in_value[108][7:0];
		buffer_in[109][7:0] <= buffer_in_value[109][7:0];

		buffer_in[110][7:0] <= buffer_in_value[110][7:0];
		buffer_in[111][7:0] <= buffer_in_value[111][7:0];
		buffer_in[112][7:0] <= buffer_in_value[112][7:0];
		buffer_in[113][7:0] <= buffer_in_value[113][7:0];
		buffer_in[114][7:0] <= buffer_in_value[114][7:0];
		buffer_in[115][7:0] <= buffer_in_value[115][7:0];
		buffer_in[116][7:0] <= buffer_in_value[116][7:0];
		buffer_in[117][7:0] <= buffer_in_value[117][7:0];
		buffer_in[118][7:0] <= buffer_in_value[118][7:0];
		buffer_in[119][7:0] <= buffer_in_value[119][7:0];

		buffer_in[120][7:0] <= buffer_in_value[120][7:0];
		buffer_in[121][7:0] <= buffer_in_value[121][7:0];
		buffer_in[122][7:0] <= buffer_in_value[122][7:0];
		buffer_in[123][7:0] <= buffer_in_value[123][7:0];
		buffer_in[124][7:0] <= buffer_in_value[124][7:0];
		buffer_in[125][7:0] <= buffer_in_value[125][7:0];
		buffer_in[126][7:0] <= buffer_in_value[126][7:0];
		buffer_in[127][7:0] <= buffer_in_value[127][7:0];
	end
end

always_comb
begin

	if(counter_in == 1'b1)
	begin
		nxt_buffer[0][7:0] = buffer_in[0][7:0];
		nxt_buffer[1][7:0] = buffer_in[1][7:0];
		nxt_buffer[2][7:0] = buffer_in[2][7:0];
		nxt_buffer[3][7:0] = buffer_in[3][7:0];
		nxt_buffer[4][7:0] = buffer_in[4][7:0];
		nxt_buffer[5][7:0] = buffer_in[5][7:0];
		nxt_buffer[6][7:0] = buffer_in[6][7:0];
		nxt_buffer[7][7:0] = buffer_in[7][7:0];


		nxt_buffer[8][7:0] = buffer_in[8][7:0];
		nxt_buffer[9][7:0] = buffer_in[9][7:0];
		nxt_buffer[10][7:0] = buffer_in[10][7:0];
		nxt_buffer[11][7:0] = buffer_in[11][7:0];
		nxt_buffer[12][7:0] = buffer_in[12][7:0];
		nxt_buffer[13][7:0] = buffer_in[13][7:0];
		nxt_buffer[14][7:0] = buffer_in[14][7:0];
		nxt_buffer[15][7:0] = buffer_in[15][7:0];
		nxt_buffer[16][7:0] = buffer_in[16][7:0];
		nxt_buffer[17][7:0] = buffer_in[17][7:0];
		nxt_buffer[18][7:0] = buffer_in[18][7:0];
		nxt_buffer[19][7:0] = buffer_in[19][7:0];
		nxt_buffer[20][7:0] = buffer_in[20][7:0];

		nxt_buffer[21][7:0] = buffer_in[21][7:0];
		nxt_buffer[22][7:0] = buffer_in[22][7:0];
		nxt_buffer[23][7:0] = buffer_in[23][7:0];
		nxt_buffer[24][7:0] = buffer_in[24][7:0];
		nxt_buffer[25][7:0] = buffer_in[25][7:0];
		nxt_buffer[26][7:0] = buffer_in[26][7:0];
		nxt_buffer[27][7:0] = buffer_in[27][7:0];
		nxt_buffer[28][7:0] = buffer_in[28][7:0];
		nxt_buffer[29][7:0] = buffer_in[29][7:0];
		nxt_buffer[30][7:0] = buffer_in[30][7:0];

		nxt_buffer[31][7:0] = buffer_in[31][7:0];
		nxt_buffer[32][7:0] = buffer_in[32][7:0];
		nxt_buffer[33][7:0] = buffer_in[33][7:0];
		nxt_buffer[34][7:0] = buffer_in[34][7:0];
		nxt_buffer[35][7:0] = buffer_in[35][7:0];
		nxt_buffer[36][7:0] = buffer_in[36][7:0];
		nxt_buffer[37][7:0] = buffer_in[37][7:0];
		nxt_buffer[38][7:0] = buffer_in[38][7:0];
		nxt_buffer[39][7:0] = buffer_in[39][7:0];
		nxt_buffer[40][7:0] = buffer_in[40][7:0];
		nxt_buffer[41][7:0] = buffer_in[41][7:0];
		nxt_buffer[42][7:0] = buffer_in[42][7:0];

		nxt_buffer[43][7:0] = buffer_in[43][7:0];
		nxt_buffer[44][7:0] = buffer_in[44][7:0];
		nxt_buffer[45][7:0] = buffer_in[45][7:0];
		nxt_buffer[46][7:0] = buffer_in[46][7:0];
		nxt_buffer[47][7:0] = buffer_in[47][7:0];
		nxt_buffer[48][7:0] = buffer_in[48][7:0];
		nxt_buffer[49][7:0] = buffer_in[49][7:0];
		
		nxt_buffer[50][7:0] = buffer_in[50][7:0];
		nxt_buffer[51][7:0] = buffer_in[51][7:0];
		nxt_buffer[52][7:0] = buffer_in[52][7:0];
		nxt_buffer[53][7:0] = buffer_in[53][7:0];
		nxt_buffer[54][7:0] = buffer_in[54][7:0];
		nxt_buffer[55][7:0] = buffer_in[55][7:0];
		nxt_buffer[56][7:0] = buffer_in[56][7:0];
		nxt_buffer[57][7:0] = buffer_in[57][7:0];
		nxt_buffer[58][7:0] = buffer_in[58][7:0];
		nxt_buffer[59][7:0] = buffer_in[59][7:0];
		nxt_buffer[60][7:0] = buffer_in[60][7:0];

		nxt_buffer[61][7:0] = buffer_in[61][7:0];
		nxt_buffer[62][7:0] = buffer_in[62][7:0];
		nxt_buffer[63][7:0] = buffer_in[63][7:0];
		nxt_buffer[64][7:0] = buffer_in[64][7:0];
		nxt_buffer[65][7:0] = buffer_in[65][7:0];
		nxt_buffer[66][7:0] = buffer_in[66][7:0];
		nxt_buffer[67][7:0] = buffer_in[67][7:0];
		nxt_buffer[68][7:0] = buffer_in[68][7:0];
		nxt_buffer[69][7:0] = buffer_in[69][7:0];
		nxt_buffer[70][7:0] = buffer_in[70][7:0];

		nxt_buffer[71][7:0] = buffer_in[71][7:0];
		nxt_buffer[72][7:0] = buffer_in[72][7:0];
		nxt_buffer[73][7:0] = buffer_in[73][7:0];
		nxt_buffer[74][7:0] = buffer_in[74][7:0];
		nxt_buffer[75][7:0] = buffer_in[75][7:0];
		nxt_buffer[76][7:0] = buffer_in[76][7:0];
		nxt_buffer[77][7:0] = buffer_in[77][7:0];
		nxt_buffer[78][7:0] = buffer_in[78][7:0];
		nxt_buffer[79][7:0] = buffer_in[79][7:0];
		nxt_buffer[80][7:0] = buffer_in[80][7:0];

		nxt_buffer[81][7:0] = buffer_in[81][7:0];
		nxt_buffer[82][7:0] = buffer_in[82][7:0];
		nxt_buffer[83][7:0] = buffer_in[83][7:0];
		nxt_buffer[84][7:0] = buffer_in[84][7:0];
		nxt_buffer[85][7:0] = buffer_in[85][7:0];
		nxt_buffer[86][7:0] = buffer_in[86][7:0];
		nxt_buffer[87][7:0] = buffer_in[87][7:0];
		nxt_buffer[88][7:0] = buffer_in[88][7:0];
		nxt_buffer[89][7:0] = buffer_in[89][7:0];
		nxt_buffer[90][7:0] = buffer_in[90][7:0];
		nxt_buffer[91][7:0] = buffer_in[91][7:0];
		nxt_buffer[92][7:0] = buffer_in[92][7:0];
		nxt_buffer[93][7:0] = buffer_in[93][7:0];
		nxt_buffer[94][7:0] = buffer_in[94][7:0];
		nxt_buffer[95][7:0] = buffer_in[95][7:0];
		nxt_buffer[96][7:0] = buffer_in[96][7:0];
		nxt_buffer[97][7:0] = buffer_in[97][7:0];
		nxt_buffer[98][7:0] = buffer_in[98][7:0];
		nxt_buffer[99][7:0] = buffer_in[99][7:0];

		nxt_buffer[100][7:0] = buffer_in[100][7:0];
		nxt_buffer[101][7:0] = buffer_in[101][7:0];
		nxt_buffer[102][7:0] = buffer_in[102][7:0];
		nxt_buffer[103][7:0] = buffer_in[103][7:0];
		nxt_buffer[104][7:0] = buffer_in[104][7:0];
		nxt_buffer[105][7:0] = buffer_in[105][7:0];
		nxt_buffer[106][7:0] = buffer_in[106][7:0];
		nxt_buffer[107][7:0] = buffer_in[107][7:0];
		nxt_buffer[108][7:0] = buffer_in[108][7:0];
		nxt_buffer[109][7:0] = buffer_in[109][7:0];

		nxt_buffer[110][7:0] = buffer_in[110][7:0];
		nxt_buffer[111][7:0] = buffer_in[111][7:0];
		nxt_buffer[112][7:0] = buffer_in[112][7:0];
		nxt_buffer[113][7:0] = buffer_in[113][7:0];
		nxt_buffer[114][7:0] = buffer_in[114][7:0];
		nxt_buffer[115][7:0] = buffer_in[115][7:0];
		nxt_buffer[116][7:0] = buffer_in[116][7:0];
		nxt_buffer[117][7:0] = buffer_in[117][7:0];
		nxt_buffer[118][7:0] = buffer_in[118][7:0];
		nxt_buffer[119][7:0] = buffer_in[119][7:0];

		nxt_buffer[120][7:0] = buffer_in[120][7:0];
		nxt_buffer[121][7:0] = buffer_in[121][7:0];
		nxt_buffer[122][7:0] = buffer_in[122][7:0];
		nxt_buffer[123][7:0] = buffer_in[123][7:0];
		nxt_buffer[124][7:0] = buffer_in[124][7:0];
		nxt_buffer[125][7:0] = buffer_in[125][7:0];
		nxt_buffer[126][7:0] = buffer_in[126][7:0];
		nxt_buffer[127][7:0] = buffer_in[127][7:0];
	end

	else
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
	
end

endmodule
