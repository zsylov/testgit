module reset_recover(
						input clk,
						input PCB_RST,
						output reg reset
					);
	wire time_on;
	wire time_start;
	
	edge_detect E1(
						.clk(clk),
						.input_signal(PCB_RST),
						.enable(~time_on),
						.detected(time_start)
					);
					
	time_20ms 	T1(
					.clk(clk),
					.start(time_start),
					.on(time_on)
				);
				
	always @ (posedge clk)
		begin
			reset <= ~time_on;
		end

endmodule
