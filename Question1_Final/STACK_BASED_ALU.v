module stack_alu #(
    parameter N 
) (
    input clk,
    input rst_n,
    input signed [N-1:0] input_data,
    input [2:0] opcode,
    output reg signed [N-1:0] output_data,
    output reg overflow
);

reg signed [N-1:0] stack [0:1023]; //here we are defining a momery block that will work as a stack
reg [10:0] sp; //Stackpointer

reg signed [N-1:0] temp_result_add;
reg signed [N-1: 0] temp_result_mult;
integer signed overflow_control;

initial begin //this block initializes the parameters that have to be zero in the beginning
    sp = 0;
    overflow = 0;
    temp_result_add = 0;
    temp_result_mult = 0;
    overflow_control = 0;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sp <= 0;
        overflow <= 0;
        output_data <= 0;
    end else begin
        case (opcode)
            3'b100: begin
                if (sp >= 2) begin
                    temp_result_add = stack[sp-1] + stack[sp - 2];
                    output_data = temp_result_add[N-1:0];
                    if (stack[sp-1][N-1] ^ stack[sp-2][N-1] == 1 ) begin
                        overflow = 0;
                    end
                    else begin
                        overflow = stack[sp-1][N-1] ^ temp_result_add[N-1];
                    end
                end else begin
                    $display("You do not have enough numbers to perform addition");
                    output_data = 1'bx;
                    overflow = 0;
                end
            end
            3'b101: begin
                if (sp >= 2) begin
                    temp_result_mult = stack[sp-1] * stack[sp-2];
                    output_data = temp_result_mult[N-1:0];
                    overflow_control = temp_result_mult / stack[sp- 1];
                    if (stack[sp-1] != 0 && overflow_control != stack[sp-2])
                        overflow = 1;
                    else begin
                        overflow = 0;
                    end

                end else begin
                        $display("You do not have enough numbers to perform multiplication");
                        output_data = 1'bx;
                        overflow = 0;
                    end
            end
            3'b110: begin
                if (sp < 1024) begin
                    stack[sp] = input_data;
                    sp = sp + 1;
                end else begin
                    $display("There is not enough space for another push");
                end
                output_data = 1'bx;
                overflow = 0;
            end
            3'b111: begin
                if (sp > 0) begin
                    output_data = stack[sp - 1];
                    sp = sp - 1;
                end else begin
                    $display("There is no number to pop. The stack is empty.");
                    output_data = 1'bx;
                end
            end
            default: begin
                $display("No Operation is happening right now");
                output_data = 0;
                overflow = 0;
            end
        endcase

    end 
end
endmodule

