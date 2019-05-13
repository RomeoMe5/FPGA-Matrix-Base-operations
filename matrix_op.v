module matrix_op(first, second, result);

parameter size = 1;
parameter operation = 0;
parameter length = 8;

input [size*size*length-1 :0] first;
input [size*size*length-1:0] second;
output [size*size*length-1:0] result;

generate
	case (size)
		1: begin 
			if (operation == 0)
				summ summ1(first[length-1:0], second[length-1:0], result[length-1:0]);
			else if (operation == 1)
				sub sub1(first[length-1:0], second[length-1:0], result[length-1:0]);
			else if (operation == 2) begin
				set set1(first[length-1:0], second[length-1:0], result[length-1:0]);
			end
		end
		2: begin
			if (operation == 0) begin
				summ summ2_1(first[length-1:0]				, second[length-1:0]				, result[length-1:0]);
				summ summ2_2(first[length*2-1:length]		, second[length*2-1:length]	, result[length*2-1:length]);
				summ summ2_3(first[length*3-1:length*2]	, second[length*3-1:length*2]	, result[length*3-1:length*2]);
				summ summ2_4(first[length*4-1:length*3]	, second[length*4-1:length*3]	, result[length*4-1:length*3]);
			end
			else if (operation == 1) begin
				sub sub2_1(first[length-1:0]		    	, second[length-1:0]				, result[length-1:0]);
				sub sub2_2(first[length*2-1:length]		, second[length*2-1:length]	, result[length*2-1:length]);
				sub sub2_3(first[length*3-1:length*2]	, second[length*3-1:length*2]	, result[length*3-1:length*2]);
				sub sub2_4(first[length*4-1:length*3]	, second[length*4-1:length*3]	, result[length*4-1:length*3]);
			end
			else if (operation == 2) begin
				set set2_1(first[length-1:0]			, result[length-1:0]);
				set set2_2(first[length*3-1:length*2]		, result[length*2-1:length]);
				set set2_3(first[length*2-1:length]		, result[length*3-1:length*2]);
				set set2_4(first[length*4-1:length*3]		, result[length*4-1:length*3]);
			end
		end
		3: begin
			if (operation == 0) begin
				summ summ3_1(first[length-1:0]				, second[length-1:0]				, result[length-1:0]);
				summ summ3_2(first[length*2-1:length]		, second[length*2-1:length]	, result[length*2-1:length]);
				summ summ3_3(first[length*3-1:length*2]	, second[length*3-1:length*2]	, result[length*3-1:length*2]);
				summ summ3_4(first[length*4-1:length*3]	, second[length*4-1:length*3]	, result[length*4-1:length*3]);
				summ summ3_5(first[length*5-1:length*4]	, second[length*5-1:length*4]	, result[length*5-1:length*4]);
				summ summ3_6(first[length*6-1:length*5]	, second[length*6-1:length*5]	, result[length*6-1:length*5]);
				summ summ3_7(first[length*7-1:length*6]	, second[length*7-1:length*6]	, result[length*7-1:length*6]);
				summ summ3_8(first[length*8-1:length*7]	, second[length*8-1:length*7]	, result[length*8-1:length*7]);
				summ summ3_9(first[length*9-1:length*8]	, second[length*9-1:length*8]	, result[length*9-1:length*8]);
			end
			else if (operation == 1) begin
				sub sub3_1(first[length-1:0]				, second[length-1:0]				, result[length-1:0]);
				sub sub3_2(first[length*2-1:length]		, second[length*2-1:length]	, result[length*2-1:length]);
				sub sub3_3(first[length*3-1:length*2]	, second[length*3-1:length*2]	, result[length*3-1:length*2]);
				sub sub3_4(first[length*4-1:length*3]	, second[length*4-1:length*3]	, result[length*4-1:length*3]);
				sub sub3_5(first[length*5-1:length*4]	, second[length*5-1:length*4]	, result[length*5-1:length*4]);
				sub sub3_6(first[length*6-1:length*5]	, second[length*6-1:length*5]	, result[length*6-1:length*5]);
				sub sub3_7(first[length*7-1:length*6]	, second[length*7-1:length*6]	, result[length*7-1:length*6]);
				sub sub3_8(first[length*8-1:length*7]	, second[length*8-1:length*7]	, result[length*8-1:length*7]);
				sub sub3_9(first[length*9-1:length*8]	, second[length*9-1:length*8]	, result[length*9-1:length*8]);
			end
			else if (operation == 2) begin
				set set3_1(first[length-1:0]					, result[length-1:0]);
				set set3_2(first[length*4-1:length*3]		, result[length*2-1:length]);
				set set3_3(first[length*7-1:length*6]		, result[length*3-1:length*2]);
				set set3_4(first[length*2-1:length]			, result[length*4-1:length*3]);
				set set3_5(first[length*5-1:length*4]		, result[length*5-1:length*4]);
				set set3_6(first[length*8-1:length*7]		, result[length*6-1:length*5]);
				set set3_7(first[length*3-1:length*2]		, result[length*7-1:length*6]);
				set set3_8(first[length*6-1:length*5]		, result[length*8-1:length*7]);
				set set3_9(first[length*9-1:length*8]		, result[length*9-1:length*8]);
			end
		end
	endcase
	
	$display(result);
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