module edge_detect(
						input clk,
						input input_signal,
						input enable,
						output detected
					);
	reg input_delay;//延迟一个时钟
	reg detected_r;//打一拍
	
	always @ (posedge clk)
		begin
			input_delay <= input_signal;
		end
		
//**************************************************
	always @ (posedge clk)
		if(enable)
			begin
				detected_r <= (input_delay == 1'b1) && (input_signal == 1'b0);
			end
		else
			detected_r <= 1'b0;
			
	assign detected = detected_r;
	
endmodule

	
	
	