
`timescale 1ns / 1ps

module blink(
		input wire clk,
		input wire rst,
		output reg led
	);

	localparam MAX_COUNT = 1_000_000;
	localparam CNT_TOP = $clog2(MAX_COUNT);

	wire i_clk;
	reg [CNT_TOP-1:0] counter;

	assign i_clk = clk;

	always @(posedge i_clk)
	begin
		if (!rst) begin
			led <= 0;
			counter <= 0;
		end else begin
			if(counter < MAX_COUNT/2)
				led <= 1;
			else
				led <= 0;

			if (counter >= MAX_COUNT)
				counter <= 0;
			else
				counter <= counter + 1'b1;
		end
	end

endmodule
