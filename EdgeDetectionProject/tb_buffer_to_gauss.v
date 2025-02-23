`timescale 1 ps / 1 ps
module tb_buffer_to_gauss
#(
	parameter integer WIDTH = 512,
	parameter integer HEIGHT = 512,
	parameter integer R_KERNEL = 2
	);
	parameter sizeOfWidth = 8;
	parameter sizeOfLengthReal = WIDTH*HEIGHT;
	parameter OUTPUT_IMAGE_SIZE = (WIDTH-(R_KERNEL*2))*(HEIGHT-(R_KERNEL*2));
	integer j = 0;
	integer k = 0;
	integer fd = 0;
	integer row_gen = 0;
	reg write = 1'b0;
	wire ready;
	reg clk = 1'b0;
	wire [7:0] 	in_pix0,in_pix1,in_pix2,in_pix3,in_pix4,in_pix5,in_pix6,in_pix7,in_pix8,in_pix9,in_pix10,in_pix11,
	in_pix12,in_pix13,in_pix14,in_pix15,in_pix16,in_pix17,in_pix18,in_pix19,in_pix20,in_pix21,in_pix22,in_pix23,
	in_pix24;	
	reg[7:0] input_serial;


	buf_to_gauss gauss_buffer(
	clk,
	write,
	input_serial,
	in_pix0,
	in_pix1,
	in_pix2,
	in_pix3,
	in_pix4,
	in_pix5,
	in_pix6,
	in_pix7,
	in_pix8,
	in_pix9,
	in_pix10,
	in_pix11,
	in_pix12,
	in_pix13,
	in_pix14,
	in_pix15,
	in_pix16,
	in_pix17,
	in_pix18,
	in_pix19,
	in_pix20,
	in_pix21,
	in_pix22,
	in_pix23,
	in_pix24,
	ready);
		
	initial begin
		forever
			#1 clk = ~clk;
	end
	
	always@(posedge clk)begin
		if(j < HEIGHT) begin
			if(k < WIDTH)begin
					input_serial = row_gen;
					write = 1'b1;
			end
		end
		else
			write = 1'b0;
			
		if(k == WIDTH-1)begin
			k = 0;
			j=j+1;
		end else
			k = k+1;
		if(row_gen == WIDTH/2-1)
			row_gen = 0;
		else
			row_gen = row_gen+1;
	end
endmodule