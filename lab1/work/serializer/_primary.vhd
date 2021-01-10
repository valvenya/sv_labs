library verilog;
use verilog.vl_types.all;
entity serializer is
    port(
        clk_i           : in     vl_logic;
        srst_i          : in     vl_logic;
        data_i          : in     vl_logic_vector(15 downto 0);
        data_mod_i      : in     vl_logic_vector(3 downto 0);
        data_val_i      : in     vl_logic;
        ser_data_o      : out    vl_logic;
        ser_data_val_o  : out    vl_logic;
        busy_o          : out    vl_logic
    );
end serializer;
