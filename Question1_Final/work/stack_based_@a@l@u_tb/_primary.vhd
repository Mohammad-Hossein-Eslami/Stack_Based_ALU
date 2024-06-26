library verilog;
use verilog.vl_types.all;
entity stack_based_ALU_tb is
    generic(
        N               : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end stack_based_ALU_tb;
