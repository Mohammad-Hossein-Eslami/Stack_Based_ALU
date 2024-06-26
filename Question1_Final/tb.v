module stack_based_ALU_tb;

    parameter N = 8;
    reg clk = 0;
    reg rst_n;
    reg [2:0] opcode;
    reg signed [N-1:0] input_data; 
    wire signed [N-1:0] output_data;
    wire overflow;

    integer signed count, count1;
    integer signed overflow_count = 0;
    integer signed correct_answer = 0;
    integer signed in1 = 0;
    integer signed in2 = 0;

    stack_alu #(N) alu (.clk(clk), .rst_n(rst_n), .input_data(input_data[N-1:0]), .opcode(opcode), .output_data(output_data[N-1:0]), .overflow(overflow));

    always begin
        #5 clk = ~clk; 
    end

    initial begin
        #6
        input_data = 0;
        opcode = 0;

        #1
        for (count = -8; count < 8; count = count + 1) begin 
            for (count1 = -8; count1 < 8; count1 = count1 + 1) begin
                input_data = count;
                opcode = 3'b110;
                #10
                input_data = count1;
                opcode = 3'b110;
                #10
                opcode = 3'b100;
                #10
                if (overflow == 1)
                    overflow_count = overflow_count + 1;
                else if (output_data == (count + count1))
                    correct_answer = correct_answer + 1;
                $display("Addition:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", count, count1, output_data, overflow);
            end
        end

        #10
        $display("Number of Overflows: %d. Number of Correct Answers: %d", overflow_count, correct_answer);
        correct_answer = 0;
        overflow_count = 0;

        #10
        rst_n = 0;
        opcode = 3'b000;
        #10
        rst_n = 1;
        #10
        opcode = 3'b111;
        #10

        for (count = -8; count < 8; count = count + 1) begin //checking addition for all the possible numbers in 4 bits
            for (count1 = -8; count1 < 8; count1 = count1 + 1) begin
                input_data = count;
                opcode = 3'b110;
                #10
                input_data = count1;
                opcode = 3'b110;
                #10
                opcode = 3'b101;
                #10
                if (overflow == 1)
                    overflow_count = overflow_count + 1;
                else if (output_data == (count * count1))
                    correct_answer = correct_answer + 1;
                $display("Multiplication:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", count, count1, output_data, overflow);
            end
        end

        #10
        $display("Number of Overflows: %d. Number of Correct Answers: %d", overflow_count, correct_answer);
        correct_answer = 0;
        overflow_count = 0;

        //######################################################################################## 
        //     Common Test Bench For All Bits. This can applied to all bits in the question
        //########################################################################################



        for (count =  0; count < 513; count = count + 1) begin
            opcode = 3'b111;
            #10
            $display("Result of Poping: %d", output_data);
        end

        //######################################################################################## 
        //                                     Pop Test Bench
        //######################################################################################## 


        // #10 

        // for (count = -8; count < 8; count = count + 1) begin
        //     for (count1 = -8; count1 < 8; count1 = count1 + 1) begin
        //         in1 = $random % 128;
        //         input_data = in1;
        //         opcode = 3'b110;
        //         #10
        //         in2 = $random % 128;
        //         input_data = in2;
        //         opcode = 3'b110;
        //         #10
        //         opcode = 3'b100;
        //         #10
        //         if (overflow == 1)
        //             overflow_count = overflow_count + 1;
        //         else if (output_data == (in1 + in2))
        //             correct_answer = correct_answer + 1;
        //         $display("Addition_8bit:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", in1, in2, output_data, overflow);
        //     end
        // end

        // #10
        // $display("Number of Overflows: %d. Number of Correct Answers: %d", overflow_count, correct_answer);
        // correct_answer = 0;
        // overflow_count = 0;
        
        // //######################################################################################## 
        // //                          Random Numbers for 8-bit ALU Addition
        // //######################################################################################## 

        // #10

        // for (count = -8; count < 8; count = count + 1) begin
        //     for (count1 = -8; count1 < 8; count1 = count1 + 1) begin
        //         in1 = $random % 20;
        //         input_data = in1;
        //         opcode = 3'b110;
        //         #10
        //         in2 = $random % 20;
        //         input_data = in2;
        //         opcode = 3'b110;
        //         #10
        //         opcode = 3'b101;
        //         #10
        //         if (overflow == 1)
        //             overflow_count = overflow_count + 1;
        //         else if (output_data == (in1 * in2))
        //             correct_answer = correct_answer + 1;
        //         else
        //             $display("WRONG: Multiplication_8bit:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", in1, in2, output_data, overflow);
        //         $display("Multiplication_8bit:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", in1, in2, output_data, overflow);
        //     end
        // end

        // #10
        // $display("Number of Overflows: %d. Number of Correct Answers: %d", overflow_count, correct_answer);
        // correct_answer = 0;
        // overflow_count = 0;

        // //######################################################################################## 
        // //                          Random Numbers for 8-bit ALU Multiplication
        // //######################################################################################## 



        // for (count =  0; count < 1024; count = count + 1) begin
        //     opcode = 3'b111;
        //     #10
        //     $display("Result of Poping: %d", output_data);
        // end

        // //######################################################################################## 
        // //                                     Pop Test Bench
        // //######################################################################################## 

        // #10 

        // for (count = -8; count < 8; count = count + 1) begin
        //     for (count1 = -8; count1 < 8; count1 = count1 + 1) begin
        //         in1 = $random % 32768;
        //         input_data = in1;
        //         opcode = 3'b110;
        //         #10
        //         in2 = $random % 32768;
        //         input_data = in2;
        //         opcode = 3'b110;
        //         #10
        //         opcode = 3'b100;
        //         #10
        //         if (overflow == 1)
        //             overflow_count = overflow_count + 1;
        //         else if (output_data == (in1 + in2))
        //             correct_answer = correct_answer + 1;
        //         $display("Addition_16bit:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", in1, in2, output_data, overflow);
        //     end
        // end

        // #10
        // $display("Number of Overflows: %d. Number of Correct Answers: %d", overflow_count, correct_answer);
        // correct_answer = 0;
        // overflow_count = 0;

        // //######################################################################################## 
        // //                          Random Numbers for 16-bit ALU Addition
        // //######################################################################################## 

        // #10

        // for (count = -8; count < 8; count = count + 1) begin
        //     for (count1 = -8; count1 < 8; count1 = count1 + 1) begin
        //         in1 = $random % 350;
        //         input_data = in1;
        //         opcode = 3'b110;
        //         #10
        //         in2 = $random % 350;
        //         input_data = in2;
        //         opcode = 3'b110;
        //         #10
        //         opcode = 3'b101;
        //         #10
        //         if (overflow == 1)
        //             overflow_count = overflow_count + 1;
        //         else if (output_data == (in1 * in2))
        //             correct_answer = correct_answer + 1;
        //         $display("Multiplication_16bit:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", in1, in2, output_data, overflow);
        //     end
        // end

        // #10
        // $display("Number of Overflows: %d. Number of Correct Answers: %d", overflow_count, correct_answer);
        // correct_answer = 0;
        // overflow_count = 0;

        // //######################################################################################## 
        // //                          Random Numbers for 16-bit ALU Multiplication
        // //######################################################################################## 

        // for (count =  0; count < 1024; count = count + 1) begin
        //     opcode = 3'b111;
        //     #10
        //     $display("Result of Poping: %d", output_data);
        // end

        // //######################################################################################## 
        // //                                     Pop Test Bench
        // //######################################################################################## 

        // #10 

        // for (count = -8; count < 8; count = count + 1) begin
        //     for (count1 = -8; count1 < 8; count1 = count1 + 1) begin
        //         in1 = $random % 2147483648;
        //         input_data = in1;
        //         opcode = 3'b110;
        //         #10
        //         in2 = $random % 2147483648;
        //         input_data = in2;
        //         opcode = 3'b110;
        //         #10
        //         opcode = 3'b100;
        //         #10
        //         if (overflow == 1)
        //             overflow_count = overflow_count + 1;
        //         else if (output_data == (in1 + in2))
        //             correct_answer = correct_answer + 1;
        //         $display("Addition_32bit:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", in1, in2, output_data, overflow);
        //     end
        // end

        // #10
        // $display("Number of Overflows: %d. Number of Correct Answers: %d", overflow_count, correct_answer);
        // correct_answer = 0;
        // overflow_count = 0;

        // //######################################################################################## 
        // //                          Random Numbers for 32-bit ALU Addition
        // //######################################################################################## 

        // #10

        // for (count = -8; count < 8; count = count + 1) begin
        //     for (count1 = -8; count1 < 8; count1 = count1 + 1) begin
        //         in1 = $random % 92681;
        //         input_data = in1;
        //         opcode = 3'b110;
        //         #10
        //         in2 = $random % 92681;
        //         input_data = in2;
        //         opcode = 3'b110;
        //         #10
        //         opcode = 3'b101;
        //         #10
        //         if (overflow == 1)
        //             overflow_count = overflow_count + 1;
        //         else if (output_data == (in1 * in2))
        //             correct_answer = correct_answer + 1;
        //         $display("Multiplication_32bit:: operand1: %d, operand2: %d, Output Data: %d, Overflow: %d", in1, in2, output_data, overflow);
        //     end
        // end

        // #10
        // $display("Number of Overflows: %d. Number of Correct Answers: %d", overflow_count, correct_answer);
        // correct_answer = 0;
        // overflow_count = 0;

        // //######################################################################################## 
        // //                          Random Numbers for 32-bit ALU Multiplication
        // //######################################################################################## 



        // #10

        // input_data = count;
        // opcode = 3'b110;
        // #10;
        // opcode = 3'b000;
        // //######################################################################################## 
        // //                                     Full Stack Test Bench
        // //######################################################################################## 

        


        // #10 

        // for (count =  0; count < 1024; count = count + 1) begin
        //     opcode = 3'b111;
        //     #10
        //     $display("Result of Poping: %d", output_data);
        // end

        // //######################################################################################## 
        // //                                     Pop Test Bench
        // //######################################################################################## 

        // opcode = 3'b100;
        // #10
        // opcode = 3'b101;
        // #10
        // input_data = 1234;
        // opcode = 3'b110;
        // #10
        // opcode = 3'b100;
        // #10
        // opcode = 3'b101;
        // #10;


        $finish;
    end

endmodule

