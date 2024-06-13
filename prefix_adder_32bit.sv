module prefix_adder_32bit (
  input  logic        cin,
  input  logic [31:0] a, b,
  output logic [31:0] s,
  output logic        cout
);

parameter SIZE = 32;

logic [SIZE - 1 : -1] p0;
logic [SIZE - 1 : -1] g0;

logic [SIZE/2 - 1 : 0] p1;
logic [SIZE/2 - 1 : 0] g1;
logic [SIZE/2 - 1 : 0] p2;
logic [SIZE/2 - 1 : 0] g2;
logic [SIZE/2 - 1 : 0] p3;
logic [SIZE/2 - 1 : 0] g3;
logic [SIZE/2 - 1 : 0] p4;
logic [SIZE/2 - 1 : 0] g4;
logic [SIZE/2 - 1 : 0] p5;
logic [SIZE/2 - 1 : 0] g5;

assign p0[-1] = 1'b0;
assign g0[-1] = cin;

assign p0[SIZE - 1 : 0] = a | b;
assign g0[SIZE - 1 : 0] = a & b;

assign p1[0] = p0[0] & p0[-1];
assign g1[0] = g0[0] | ( p0[0] & g0[-1]);

assign p1[1] = p0[2] & p0[1];
assign g1[1] = g0[2] | ( g0[2] & p0[1] );

assign p1[2] = p0[4] & p0[3];
assign g1[2] = g0[4] | ( p0[4] & g0[3] );

assign p1[3] = p0[6] & p0[5];
assign g1[3] = g0[6] | ( p0[6] & g0[5] );

assign p1[4] = p0[8] & p0[7];
assign g1[4] = g0[8] | ( p0[8] & g0[7] );

assign p1[5] = p0[10] & p0[9];
assign g1[5] = g0[10] | ( p0[10] & g0[9] );

assign p1[6] = p0[12] & p0[11];
assign g1[6] = g0[12] | ( p0[12] & g0[11] );

assign p1[7] = p0[14] & p0[13];
assign g1[7] = g0[14] | ( p0[14] & g0[13] );

assign p1[8] = p0[16] & p0[15];
assign g1[8] = g0[16] | ( p0[16] & g0[15]);

assign p1[9] = p0[18] & p0[18];
assign g1[9] = g0[18] | ( g0[18] & p0[17] );

assign p1[10] = p0[20] & p0[20];
assign g1[10] = g0[20] | ( p0[20] & g0[19] );

assign p1[11] = p0[22] & p0[22];
assign g1[11] = g0[22] | ( p0[22] & g0[21] );

assign p1[12] = p0[24] & p0[24];
assign g1[12] = g0[24] | ( p0[24] & g0[23] );

assign p1[13] = p0[26] & p0[26];
assign g1[13] = g0[26] | ( p0[26] & g0[25] );

assign p1[14] = p0[28] & p0[27];
assign g1[14] = g0[28] | ( p0[28] & g0[27] );

assign p1[15] = p0[30] & p0[30];
assign g1[15] = g0[30] | ( p0[30] & g0[29] );


assign p2[0] = p0[1] & p1[0];
assign g2[0] = g0[1] | ( p0[1] & g1[0] );

assign p2[1] = p1[1] & p1[0];
assign g2[1] = g1[1] | ( p1[1] & g1[0] );

assign p2[2] = p0[5] & p1[2];
assign g2[2] = g0[5] | ( p0[5] & g1[2] );

assign p2[3] = p1[3] & p1[2];
assign g2[3] = g1[3] | ( p1[3] & g1[2] );

assign p2[4] = p0[9] & p1[4];
assign g2[4] = g0[9] | ( p0[9] & g1[4] );

assign p2[5] = p1[5] & p1[4];
assign g2[5] = g1[5] | ( p1[5] & g1[4] );

assign p2[6] = p0[13] & p1[6];
assign g2[6] = g0[13] | ( p0[13] & g1[6] );

assign p2[7] = p1[7] & p1[6];
assign g2[7] = g1[7] | ( p1[7] & g1[6] );

assign p2[8] = p0[17] & p1[8];
assign g2[8] = g0[17] | ( p0[17] & g1[8] );

assign p2[9] = p1[9] & p1[8];
assign g2[9] = g1[9] | ( p1[9] & g1[8] );

assign p2[10] = p0[21] & p1[10];
assign g2[10] = g0[21] | ( p0[21] & g1[10] );

assign p2[11] = p1[11] & p1[10];
assign g2[11] = g1[11] | ( p1[11] & g1[10] );

assign p2[12] = p0[25] & p1[12];
assign g2[12] = g0[25] | ( p0[25] & g1[12] );

assign p2[13] = p1[13] & p1[12];
assign g2[13] = g1[13] | ( p1[13] & g1[12] );

assign p2[14] = p0[29] & p1[14];
assign g2[14] = g0[29] | ( p0[29] & g1[14] );

assign p2[15] = p1[15] & p1[14];
assign g2[15] = g1[15] | ( p1[15] & g1[14] );


assign p3[0] = p0[3] & p2[1];
assign g3[0] = g0[3] | ( p0[3] & g2[1] );

assign p3[1] = p1[2] & p2[1];
assign g3[1] = g1[2] | ( p1[2] & g2[1] );

assign p3[2] = p2[2] & p2[1];
assign g3[2] = g2[2] | ( p2[2] & g2[1] );

assign p3[3] = p2[3] & p2[1];
assign g3[3] = g2[3] | ( p2[3] & g2[1] );

assign p3[4] = p0[11] & p2[5];
assign g3[4] = g0[11] | ( p0[11] & g2[5] );

assign p3[5] = p1[6] & p2[5];
assign g3[5] = g1[6] | ( p1[6] & g2[5] );

assign p3[6] = p2[6] & p2[5];
assign g3[6] = g2[6] | ( p2[6] & g2[5] );

assign p3[7] = p2[7] & p2[5];
assign g3[7] = g2[7] | ( p2[7] & g2[5] );

assign p3[8] = p0[19] & p2[9];
assign g3[8] = g0[19] | ( p0[19] & g2[9] );

assign p3[9] = p1[10] & p2[9];
assign g3[9] = g1[10] | ( p1[10] & g2[9] );

assign p3[10] = p2[10] & p2[9];
assign g3[10] = g2[10] | ( p2[10] & g2[9] );

assign p3[11] = p2[11] & p2[9];
assign g3[11] = g2[11] | ( p2[11] & g2[9] );

assign p3[12] = p0[27] & p2[13];
assign g3[12] = g0[27] | ( p0[27] & g2[13] );

assign p3[13] = p1[14] & p2[13];
assign g3[13] = g1[14] | ( p1[14] & g2[13] );

assign p3[14] = p2[14] & p2[13];
assign g3[14] = g2[14] | ( p2[14] & g2[13] );

assign p3[15] = p2[15] & p2[13];
assign g3[15] = g2[15] | ( p2[15] & g2[13] );


assign p4[0] = p0[7] & p3[3];
assign g4[0] = g0[7] | ( p0[7] & g3[3] );

assign p4[1] = p1[4] & p3[3];
assign g4[1] = g1[4] | ( p1[4] & g3[3] );

assign p4[2] = p2[4] & p3[3];
assign g4[2] = g2[4] | ( p2[4] & g3[3] );

assign p4[3] = p2[5] & p3[3];
assign g4[3] = g2[5] | ( p2[5] & g3[3] );

assign p4[4] = p3[4] & p3[3];
assign g4[4] = g3[4] | ( p3[4] & g3[3] );

assign p4[5] = p3[5] & p3[3];
assign g4[5] = g3[5] | ( p3[5] & g3[3] );

assign p4[6] = p3[6] & p3[3];
assign g4[6] = g3[6] | ( p3[6] & g3[3] );

assign p4[7] = p3[7] & p3[3];
assign g4[7] = g3[7] | ( p3[7] & g3[3] );

assign p4[8] = p0[23] & p3[11];
assign g4[8] = g0[23] | ( p0[23] & g3[11] );

assign p4[9] = p1[12] & p3[11];
assign g4[9] = g1[12] | ( p1[12] & g3[11] );

assign p4[10] = p2[12] & p3[11];
assign g4[10] = g2[12] | ( p2[12] & g3[11] );

assign p4[11] = p2[13] & p3[11];
assign g4[11] = g2[13] | ( p2[13] & g3[11] );

assign p4[12] = p3[12] & p3[11];
assign g4[12] = g3[12] | ( p3[12] & g3[11] );

assign p4[13] = p3[13] & p3[11];
assign g4[13] = g3[13] | ( p3[13] & g3[11] );

assign p4[14] = p3[14] & p3[11];
assign g4[14] = g3[14] | ( p3[14] & g3[11] );

assign p4[15] = p3[15] & p3[11];
assign g4[15] = g3[15] | ( p3[15] & g3[11] );


assign p5[0] = p0[15] & p4[7];
assign g5[0] = g0[15] | ( p0[15] & g4[7] );

assign p5[1] = p1[8] & p4[7];
assign g5[1] = g1[8] | ( p1[8] & g4[7] );

assign p5[2] = p2[8] & p4[7];
assign g5[2] = g2[8] | ( p2[8] & g4[7] );

assign p5[3] = p2[9] & p4[7];
assign g5[3] = g2[9] | ( p2[9] & g4[7] );

assign p5[4] = p3[8] & p4[7];
assign g5[4] = g3[8] | ( p3[8] & g4[7] );

assign p5[5] = p3[9] & p4[7];
assign g5[5] = g3[9] | ( p3[9] & g4[7] );

assign p5[6] = p3[10] & p4[7];
assign g5[6] = g3[10] | ( p3[10] & g4[7] );

assign p5[7] = p3[11] & p4[7];
assign g5[7] = g3[11] | ( p3[11] & g4[7] );

assign p5[8] = p4[8] & p4[7];
assign g5[8] = g4[8] | ( p4[8] & g4[7] );

assign p5[9] = p4[9] & p4[7];
assign g5[9] = g4[9] | ( p4[9] & g4[7] );

assign p5[10] = p4[10] & p4[7];
assign g5[10] = g4[10] | ( p4[10] & g4[7] );

assign p5[11] = p4[11] & p4[7];
assign g5[11] = g4[11] | ( p4[11] & g4[7] );

assign p5[12] = p4[12] & p4[7];
assign g5[12] = g4[12] | ( p4[12] & g4[7] );

assign p5[13] = p4[13] & p4[7];
assign g5[13] = g4[13] | ( p4[13] & g4[7] );

assign p5[14] = p4[14] & p4[7];
assign g5[14] = g4[14] | ( p4[14] & g4[7] );

assign p5[15] = p4[15] & p4[7];
assign g5[15] = g4[15] | ( p4[15] & g4[7] );


assign cout = ( cin & p5[15] ) | g5[15];

assign s[31] = (a[31] ^ b[31]) ^ g5[15];
assign s[30] = (a[30] ^ b[30]) ^ g5[14];
assign s[29] = (a[29] ^ b[29]) ^ g5[13];
assign s[28] = (a[28] ^ b[28]) ^ g5[12];
assign s[27] = (a[27] ^ b[27]) ^ g5[11];
assign s[26] = (a[26] ^ b[26]) ^ g5[10];
assign s[25] = (a[25] ^ b[25]) ^ g5[ 9];
assign s[24] = (a[24] ^ b[24]) ^ g5[ 8];
assign s[23] = (a[23] ^ b[23]) ^ g5[ 7];
assign s[22] = (a[22] ^ b[22]) ^ g5[ 6];
assign s[21] = (a[21] ^ b[21]) ^ g5[ 5];
assign s[20] = (a[20] ^ b[20]) ^ g5[ 4];
assign s[19] = (a[19] ^ b[19]) ^ g5[ 3];
assign s[18] = (a[18] ^ b[18]) ^ g5[ 2];
assign s[17] = (a[17] ^ b[17]) ^ g5[ 1];
assign s[16] = (a[16] ^ b[16]) ^ g5[ 0];
assign s[15] = (a[15] ^ b[15]) ^ g4[ 7];
assign s[14] = (a[14] ^ b[14]) ^ g4[ 6];
assign s[13] = (a[13] ^ b[13]) ^ g4[ 5];
assign s[12] = (a[12] ^ b[12]) ^ g4[ 4];
assign s[11] = (a[11] ^ b[11]) ^ g4[ 3];
assign s[10] = (a[10] ^ b[10]) ^ g4[ 2];
assign s[ 9] = (a[ 9] ^ b[ 9]) ^ g4[ 1];
assign s[ 8] = (a[ 8] ^ b[ 8]) ^ g4[ 0];
assign s[ 7] = (a[ 7] ^ b[ 7]) ^ g3[ 3];
assign s[ 6] = (a[ 6] ^ b[ 6]) ^ g3[ 2];
assign s[ 5] = (a[ 5] ^ b[ 5]) ^ g3[ 1];
assign s[ 4] = (a[ 4] ^ b[ 4]) ^ g3[ 0];
assign s[ 3] = (a[ 3] ^ b[ 3]) ^ g2[ 1];
assign s[ 2] = (a[ 2] ^ b[ 2]) ^ g2[ 0];
assign s[ 1] = (a[ 1] ^ b[ 1]) ^ g1[ 0];
assign s[ 0] = (a[ 0] ^ b[ 0]) ^ g0[-1];


endmodule