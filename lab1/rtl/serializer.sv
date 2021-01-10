module serializer (
    input           clk_i,
    input           srst_i,
    input   [15:0]  data_i,
    input   [3:0]   data_mod_i,
    input           data_val_i,
    output          ser_data_o,
    output          ser_data_val_o,
    output          busy_o
);

    logic   [3:0]   counter;
    logic   [3:0]   index;
    logic   [3:0]   data_mod;
    logic   [15:0]  data;
    logic           ser_data;
    logic           ser_data_val;
    logic           busy;

    assign index = 15 - counter;
    
    always_ff @( posedge clk_i ) begin
        if ( srst_i ) begin
            ser_data <= 1'b0;
            ser_data_val <= 1'b0;
            busy <= 1'b0;
            counter <= 4'b0000;
        end
        else if ( data_val_i && data_mod_i >= 3 ) begin
            ser_data_val <= 1'b1;
            busy <= 1'b1;
            ser_data <= data_i[15];
            counter <= 4'b0001;
            data_mod <= data_mod_i;
            data <= data_i;
        end
        else if ( busy && counter != data_mod ) begin
            ser_data <= data[ index ];
            counter <= counter + 4'b0001;
        end
        else begin
            counter <= 4'b0000;
            busy <= 1'b0;
            ser_data_val <= 1'b0;
        end
    end

    assign ser_data_o = ser_data;
    assign ser_data_val_o = ser_data_val;
    assign busy_o = busy;

endmodule