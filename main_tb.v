// module main_tb();

// 	initial begin
// 		$dumpfile("main_tb.vcd");
// 		$dumpvars(0, main_tb);
// 		rst = 1;
// 		#1 rst = 0;
// 	end

// 	reg clk = 0;
// 	integer i;
// 	initial begin
// 		for (i = 0; i < 128; i++) begin
// 			#1 clk = ~clk;
// 		end
// 	end

// 	reg rst;   
//     wire slow_clk;
//     clock_divider #(.MODULO(3)) cdiv(
//         .clk(clk),
//         .rst(rst),
//         .out(slow_clk)
//     );


//     wire hlt;
//     wire cpu_clk;
//     clock c(
//         .in(slow_clk),
//         .hlt(hlt),
//         .out(cpu_clk)
//     );

//     reg		[7:0]	bus;
//     always @(*) begin
//         if (ir_en) begin
//             bus = ir_out;
//         end else if (adder_en) begin
//             bus = adder_out;
//         end else if (a_en) begin
//             bus = a_out;
//         end else if (mem_en) begin
//             bus = mem_out;
//         end else if (pc_en) begin
//             bus = pc_out;
//         end else begin
//             bus = 8'b0;
//         end
//     end


//     wire pc_inc;
//     wire pc_en;
//     wire    [7:0]   pc_out;  
//     pc pc(
//         .clk(cpu_clk),
//         .rst(rst),
//         .inc(pc_inc),
//         .out(pc_out)
//     );

//     wire mar_load;
//     wire mem_en;
//     wire    [7:0]   mem_out;
//     memory mem(
//         .clk(cpu_clk),
//         .rst(rst),
//         .load(mar_load),
//         .bus(bus),
//         .out(mem_out)
//     );

//     wire a_load;
//     wire a_en;
//     wire    [7:0]   a_out;
//     register reg_a(
//         .clk(cpu_clk),
//         .rst(rst),
//         .load(a_load),
//         .bus(bus),
//         .out(a_out)
//     );

//     wire b_load;
//     wire    [7:0]   b_out;
//     register reg_b(
//         .clk(cpu_clk),
//         .rst(rst),
//         .load(b_load),
//         .bus(bus),
//         .out(b_out)
//     );

//     wire adder_sub;
//     wire adder_en;
//     wire    [7:0]   adder_out;
//     adder adder(
//         .a(a_out),
//         .b(b_out),
//         .sub(adder_sub),
//         .out(adder_out)
//     );

//     wire ir_load;
//     wire ir_en;
//     wire    [7:0]   ir_out;
//     ir ir(
//         .clk(cpu_clk),
//         .rst(rst),
//         .load(ir_load),
//         .bus(bus),
//         .out(ir_out)
//     );

//     controller controller(
//         .clk(cpu_clk),
//         .rst(rst),
//         .opcode(ir_out[7:4]),
//         .out(
//         {
//             hlt,
//             pc_inc,
//             pc_en,
//             mar_load,
//             mem_en,
//             ir_load,
//             ir_en,
//             a_load,
//             a_en,
//             b_load,
//             adder_sub,
//             adder_en
//         })
//     );

// endmodule