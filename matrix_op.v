module matrix_op(first, second, result);

parameter size = 1;
parameter operation = 0;
parameter length = 8;

input [size*size*length-1 :0] first;
input [size*size*length-1:0] second;
output [size*size*length-1:0] result;

genvar i,j;
generate
	for(i = 0; i < size; i = i+1) begin : row_generation
		for (j = 0; j < size; j = j + 1) begin : column_generation
			case (operation)
				0: summ _summ(first[(length*(size*i + j + 1)) -1 : length*(size*i + j)],second[(length*(size*i + j + 1)) -1 : length*(size*i + j)],result[(length*(size*i + j + 1)) -1 : length*(size*i + j)]);
				1: sub _sub(first[(length*(size*i + j + 1)) -1 : length*(size*i + j)],second[(length*(size*i + j + 1)) -1 : length*(size*i + j)],result[(length*(size*i + j + 1)) -1 : length*(size*i + j)]);
				2: set _set(first[(length*(size*j + i + 1)) -1 : length*(size*j + i)],result[(length*(size*i + j + 1)) -1 : length*(size*i + j)]);

			endcase
		end
	end
endgenerate


endmodule


module summ(Ain, Bin,Sout);

input [7:0] Ain, Bin;
output [7:0] Sout;

assign Sout = Ain + Bin;

endmodule

module sub(Ain, Bin,Sout);

input [7:0] Ain, Bin;
output [7:0] Sout;

assign Sout = Ain - Bin;

endmodule

module set(Ain,Sout);

input [7:0] Ain;
output [7:0] Sout;

assign Sout = Ain;

endmodule
