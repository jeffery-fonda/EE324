`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2017 10:36:41 PM
// Design Name: 
// Module Name: myled_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module myled_tb();

wire [3:0] led;

reg  s_axi_aclk = 1'b0;
reg  s_axi_aresetn;

// AW Channel
reg [31 : 0] s_axi_awaddr = 32'h0;
reg [2 : 0] s_axi_awprot = 3'd0;
reg  s_axi_awvalid = 1'b0;
wire  s_axi_awready;

// W Channel
reg [31 : 0] s_axi_wdata = 32'h0;
reg [3 : 0] s_axi_wstrb = 4'hF;
reg  s_axi_wvalid = 1'b0;
wire  s_axi_wready;

// W Response Channel
wire [1 : 0] s_axi_bresp;
wire  s_axi_bvalid;
reg  s_axi_bready = 1'b1;

// AR Channel
reg [31 : 0] s_axi_araddr = 32'h0;
reg [2 : 0] s_axi_arprot = 3'd0;
reg  s_axi_arvalid = 1'b0;
wire  s_axi_arready;

// R Channel
wire [31 : 0] s_axi_rdata;
wire [1 : 0] s_axi_rresp;
wire  s_axi_rvalid;
reg  s_axi_rready = 1'b1;

myled_v1_0 # (
    .C_S_AXI_DATA_WIDTH(32),
    .C_S_AXI_ADDR_WIDTH(32)
) myled_v1_0_inst (
    .led(led),
    .s_axi_aclk(s_axi_aclk),
    .s_axi_aresetn(s_axi_aresetn),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready)
);

// Generate Signal Waveform
// Clock Generation
always @ *
    #5 s_axi_aclk <= ~s_axi_aclk;

initial
begin
    // Assert Reset Signal
    s_axi_aresetn = 1'b0;
    // Wait for 2 clock cycle and then de-assert reset signal
    #20 s_axi_aresetn = 1'b1;
    // Wait for 2 clock cycle and call axi_write task to
    // write 32'h0 to address 0x43c00000
    #20 axi_write(32'h43c00000, 32'h0);
    // Wait for 2 clock cycle and call axi_read task to
    // read from address 0x43c00000
    #20 axi_read(32'h43c00000);
    // Wait for 3 clock cycle and call axi_write task to
    // write 32'hffffffff to address 0x43c00000
    #30 axi_write(32'h43c00000, 32'hFFFFFFFF);
    // Wait for 3 clock cycle and call axi_read task to
    // read from address 0x43c00000
    #30 axi_read(32'h43c00000);
end

// Verilog task: axi_write
task axi_write;
    // Two parameters that this task takes:
    // addr: 32-bit address (first parameter)
    // data: 32-bit data (second parameter)
    input [31:0] addr;
    input [31:0] data;
    begin // task begin
        // At next rising edge of s_axi_aclk,
        // 'data' is presented on s_axi_wdata bus,
        // s_axi_wvalid is dirven high to indicate that the value
        // presented on s_axi_wdata bus is valid.
        @ (posedge s_axi_aclk);
        #1 s_axi_wdata = data;
        s_axi_wvalid = 1'b1;
        // At next rising edge of s_axi_aclk,
        // 'addr' is presented on s_axi_awaddr bus,
        // s_axi_awvalid is driven high to indicate that the value
        // presented on s_axi_awaddr is valid.
        @ (posedge s_axi_aclk);
        #1 s_axi_awaddr = addr;
        s_axi_awvalid = 1'b1;
        // According to AXI4-Lite specification (handshake process),
        // wvalid and awvalid signal will be driven low after the value
        // on both bus are taken by peripheral (when both READY and VALID
        // are high). The end of the write transaction can be checked by
        // monitoring both AWVALID and WVALID signals. If both of them are
        // LOW again, wait for Write Response.
        while(s_axi_wvalid == 1'b1 || s_axi_awvalid == 1'b1)
        begin
            // During the write transaction, as host has prepared the data
            // on both Write Data Channel and Write Address Channel, it waits
            // on READY signal from the peripheral (it needs to be checked at
            // the rising edge of s_axi_aclk). If the peripheral is ready,
            // drive VALID low at next rising edge of s_axi_aclk.
            @ (posedge s_axi_aclk);
            if (s_axi_wready == 1'b1 && s_axi_awready == 1'b1)
            begin
                #1 s_axi_wvalid = 1'b0;
                s_axi_awvalid = 1'b0;
            end
            else if (s_axi_wready == 1'b1)
            begin
                #1 s_axi_wvalid = 1'b0;
            end
            else if (s_axi_awready == 1'b1)
            begin
                #1 s_axi_awvalid = 1'b0;
            end
        end
        // Wait for write response by checking BVALID signal.
        // If BVALID signal is low, keep waiting. If BVALID signal is high,
        // the write transaction ends.
        while(s_axi_bvalid == 1'b0);
    end
endtask

// Verilog task: axi_read
task axi_read;
    // 'addr': 32-bit address (first parameter)
    input [31:0] addr;
    begin
        // Prepare address value on ARADDR bus
        // Wait until read addressis accepted by the peripheral
        // Wait until peripheral replies with data on Read Data Channel
        @ (posedge s_axi_aclk)
        #1 s_axi_rdata = data;
        s_axi_rvalid = 1'b1;
        
        @ (posedge s_axi_aclk)
        #1 s_axi_araddr = addr;
        s_axi_arvalid = 1'b1;
        
        while(s_axi_rvalid == 1'b1 || s_axi_araddr == 1'b1)
        begin
            @ (posedge s_axiaclk);
            if (s_axi_rready == 1'b1 && s_axi_arready == 1'b1)
            begin
                #1 s_axi_rvalid = 1'b0;
                s_axi_arvalid = 1'b0;
            end
            else if (s_axi_rready == 1'b1)
            begin
                #1 s_axi_rvalid = 1'b1;
            end
            else if (s_axi_arready == 1'b1)
            begin
                #1 s_axi_arvalid = 1'b0;
            end
        end
        
        while (s_axi_bvalid == 1'b0);
    end
endtask

endmodule