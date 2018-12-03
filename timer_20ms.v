module time_20ms(
					input clk,
					input start,
					output on
				);
	reg on_r;
	`define NUMBER_20MS 100_000;//100Mclk
	reg [16:0] counter = 17'd0;
	always @ (posedge clk)
		begin
			on_r <= (counter !=0);
		end
		
		
	always @ (posedge clk)
		if (start)
			begin
				counter <= `NUMBER_20MS;
			end
		else if(counter != 0)
				begin
					counter <= counter -1'b1;
				end
		else begin end
		
assign on = on_r;
endmodule
