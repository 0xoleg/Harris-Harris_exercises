module prefix_adder_32bit (
  input  logic        cin,
  input  logic [15:0] a, b,
  output logic [15:0] s,
  output logic        cout
);

parameter SIZE = 16;

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


assign s[15] = (a[15] ^ b[15]) ^ g4[7];
assign s[14] = (a[14] ^ b[14]) ^ g4[6];
assign s[13] = (a[13] ^ b[13]) ^ g4[5];
assign s[12] = (a[12] ^ b[12]) ^ g4[4];
assign s[11] = (a[11] ^ b[11]) ^ g4[3];
assign s[10] = (a[10] ^ b[10]) ^ g4[2];
assign s[ 9] = (a[ 9] ^ b[ 9]) ^ g4[1];
assign s[ 8] = (a[ 8] ^ b[ 8]) ^ g4[0];
assign s[ 7] = (a[ 7] ^ b[ 7]) ^ g3[3];
assign s[ 6] = (a[ 6] ^ b[ 6]) ^ g3[2];
assign s[ 5] = (a[ 5] ^ b[ 5]) ^ g3[1];
assign s[ 4] = (a[ 4] ^ b[ 4]) ^ g3[0];
assign s[ 3] = (a[ 3] ^ b[ 3]) ^ g2[1];
assign s[ 2] = (a[ 2] ^ b[ 2]) ^ g2[0];
assign s[ 1] = (a[ 1] ^ b[ 1]) ^ g1[0];
assign s[ 0] = (a[ 0] ^ b[ 0]) ^ g0[-1];


endmodule