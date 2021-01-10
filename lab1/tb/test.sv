module test;

bit             clk;
logic   [15:0]  data;
logic   [3:0]   data_mod;
bit             data_val;
bit             srst;

initial
    forever
        #5 clk = !clk;

serializer DUT (
    .clk_i ( clk ),
    .srst_i ( srst ),
    .data_i ( data ),
    .data_mod_i ( data_mod ),
    .data_val_i ( data_val )
);

initial begin
    srst <= 1'b0;
    data <= '0;
    data_mod <= '0;
    data_val <= 1'b0;
    #99;
    @( posedge clk );
    data <= 16'hca00;
    data_mod <= 7;
    data_val <= 1'b1;
    @( posedge clk );
    data <= '0;
    data_mod <= '0;
    data_val <= 1'b0;
    #160
    @( posedge clk );
    data <= '1;
    data_mod <= 11;
    data_val <= 1'b1;
    @( posedge clk );
    data <= '0;
    data_mod <= '0;
    data_val <= 1'b0;
    #40
    @( posedge clk );
    srst <= 1'b1;
    @( posedge clk );
    srst <= 1'b0;
end

endmodule