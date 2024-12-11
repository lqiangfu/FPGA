`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 23:24:04
// Design Name: 
// Module Name: trans
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


module trans#(
parameter  M_ROW = 'd64,
parameter  M_COW = 'd64
)(
input clk,
input rst_n

    );
reg[8:0]addr;
reg [63:0]data;
reg [63:0]en;
reg write_down;

reg [8:0]waddr;

always@(posedge clk)begin
if(rst_n)
    addr <= 0;
else if(addr == M_COW - 1)
    addr <= 0;
else  
   addr <= addr + 1;
 end

always@(posedge clk)begin
if(rst_n)
    en <= {{63{1'b0}},1'b1};
else if(addr == M_COW - 1)
    en <= (en << 1);
else  
    en <= en;
 end

always@(posedge clk)begin
if(rst_n)
    data <= 0;
else if(data == M_ROW * M_COW - 1)begin
    data <= 0;
    end
else if(!write_down && !rst_n)
    data <= data + 1;
 end

always@(posedge clk)begin
if(rst_n)
    write_down <= 0;
else if(data == M_ROW * M_COW - 1)begin
    write_down <= 1;
    end
else  
    write_down <= write_down;
 end
 
 reg [8:0]addrb;reg [63:0]enb;
 wire [63:0]doutb[63:0];
 reg [4:0]write_down1;
always@(posedge clk)begin
if(rst_n)begin
    write_down1 <= 0;
    end
else begin
    write_down1 <= {write_down1[3:0],write_down};
end
end


 genvar i;
 for(i = 0;i < 8;i = i+1)begin
  blk_mem_gen_0 blk_mem_gen_inst1 (
      .clka(clk),    // input wire clka
      .ena(en[i*8]),      // input wire ena
      .wea(en[i*8]),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [8 : 0] addra
      .dina(data),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb[i*8]),      // input wire enb
      .addrb(addrb),  // input wire [8 : 0] addrb
      .doutb(doutb[i*8])  // output wire [63 : 0] doutb
);  
  blk_mem_gen_0 blk_mem_gen_inst2 (
      .clka(clk),    // input wire clka
      .ena(en[i*8+1]),      // input wire ena
      .wea(en[i*8+1]),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [8 : 0] addra
      .dina(data),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb[i*8+1]),      // input wire enb
      .addrb(addrb),  // input wire [8 : 0] addrb
      .doutb(doutb[i*8+1])  // output wire [63 : 0] doutb
);  
  blk_mem_gen_0 blk_mem_gen_inst3 (
      .clka(clk),    // input wire clka
      .ena(en[i*8+2]),      // input wire ena
      .wea(en[i*8+2]),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [8 : 0] addra
      .dina(data),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb[i*8+2]),      // input wire enb
      .addrb(addrb),  // input wire [8 : 0] addrb
      .doutb(doutb[i*8+2])  // output wire [63 : 0] doutb
); 
  blk_mem_gen_0 blk_mem_gen_inst4 (
      .clka(clk),    // input wire clka
      .ena(en[i*8+3]),      // input wire ena
      .wea(en[i*8+3]),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [8 : 0] addra
      .dina(data),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb[i*8+3]),      // input wire enb
      .addrb(addrb),  // input wire [8 : 0] addrb
      .doutb(doutb[i*8+3])  // output wire [63 : 0] doutb
);  
  blk_mem_gen_0 blk_mem_gen_inst5 (
      .clka(clk),    // input wire clka
      .ena(en[i*8+4]),      // input wire ena
      .wea(en[i*8+4]),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [8 : 0] addra
      .dina(data),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb[i*8+4]),      // input wire enb
      .addrb(addrb),  // input wire [8 : 0] addrb
      .doutb(doutb[i*8+4])  // output wire [63 : 0] doutb
);  
  blk_mem_gen_0 blk_mem_gen_inst6 (
      .clka(clk),    // input wire clka
      .ena(en[i*8+5]),      // input wire ena
      .wea(en[i*8+5]),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [8 : 0] addra
      .dina(data),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb[i*8+5]),      // input wire enb
      .addrb(addrb),  // input wire [8 : 0] addrb
      .doutb(doutb[i*8+5])  // output wire [63 : 0] doutb
);   
  blk_mem_gen_0 blk_mem_gen_inst7 (
      .clka(clk),    // input wire clka
      .ena(en[i*8+6]),      // input wire ena
      .wea(en[i*8+6]),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [8 : 0] addra
      .dina(data),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb[i*8+6]),      // input wire enb
      .addrb(addrb),  // input wire [8 : 0] addrb
      .doutb(doutb[i*8+6])  // output wire [63 : 0] doutb
);  
  blk_mem_gen_0 blk_mem_gen_inst8 (
      .clka(clk),    // input wire clka
      .ena(en[i*8+7]),      // input wire ena
      .wea(en[i*8+7]),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [8 : 0] addra
      .dina(data),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb[i*8+7]),      // input wire enb
      .addrb(addrb),  // input wire [8 : 0] addrb
      .doutb(doutb[i*8+7])  // output wire [63 : 0] doutb
);
end

reg [2:0]cnt_lin;reg w_en;reg [511:0]data_in;






reg read_down;reg rd_en;reg [8:0]raddr; reg [3:0] cnt;
reg [6:0]cnt_row;reg [6:0]cnt_cow;
reg [4:0]state;
wire  [511:0]dout;
localparam IDLE              =  4'b0001;
localparam WRITE_IN          =  4'b0010;
localparam WRITE_IN_lINEDOWN =  4'b0100;
localparam WRITE_END         =  4'b0100;
 always@(posedge clk)begin
if(rst_n)begin
    rd_en <= 0;
    raddr <= 0;
    w_en  <= 0;
    enb   <= 64'b0;
    waddr <= 0;
    addrb <= 8'b0;
    cnt   <= 0;
    data_in <= 0;
    cnt_row <= 0;
    cnt_cow <= 0;
    state <= IDLE;
    end
else begin
    case(state)
        IDLE: begin
                rd_en <= 0;
                raddr <= 0;
                w_en  <= 0;
                enb   <= 64'b0;
                addrb <= 8'b0;
                waddr <= 0;
                cnt   <= 0;
                data_in <= 0;
                cnt_row <= 0;
                cnt_cow <= 0;
                state <= IDLE;
               if(write_down)begin
                   state <= WRITE_IN;
                   enb <= {{56{1'b0}},8'hff};
               end
               else  state <= IDLE; 
         end  
        WRITE_IN:  //开始 做转置写入 
        begin
               addrb <= addrb + 1;
               cnt  <= cnt + 1;
               if(cnt > 1 && cnt <= 'd9 )begin
                   state <= WRITE_IN;
                   w_en  <= 1; 
                   data_in <= {doutb[cnt_row+7],doutb[cnt_row+6],doutb[cnt_row+5],doutb[cnt_row+4],doutb[cnt_row+3],doutb[cnt_row+2],doutb[cnt_row+1],doutb[cnt_row]};
                   waddr <= waddr + 1;
               end
               else  if(cnt > 'd9)
               begin
                   w_en  <= 0;
                   cnt_row <= cnt_row + 'd8;
                   state <= WRITE_IN_lINEDOWN;
                   end
        end         
        WRITE_IN_lINEDOWN:  //更新值为下一次转置写做准备
        begin
                cnt  <= 0;
                enb  <= (enb << 8);
         
               if(cnt_row == M_ROW && cnt_cow != (M_COW - 'd8))begin
                   cnt_row <= 0;
                   cnt_cow <= cnt_cow + 8;
                   addrb   <= cnt_cow + 8;
                   enb <= {{56{1'b0}},8'hff};
                   state   <= WRITE_IN;
               end
                else if(cnt_row == M_ROW && cnt_cow == (M_COW - 'd8))begin
                       state <= WRITE_END;
                   end
               else begin
                   addrb <= cnt_cow;
                   state <= WRITE_IN; 
                   end
               end             
        WRITE_END: begin
              raddr <= raddr + 1;
              rd_en <= 1;
               if(raddr == 64)begin
                   enb <= {{56{1'b0}},8'hff};
               end
               state <= IDLE;
              end 
        default:;      
    endcase
    
end
end

 genvar j;
 for(j = 0;j < 8;j = j+1)begin
  blk_mem_gen_trans_xpm blk_mem_gen_trans_xpm_inst (
      .wclk(clk),    // input wire clka
      .we(w_en ),      // input wire ena
      .w_en(w_en ),      // input wire [0 : 0] wea
      .waddr(waddr),      // input wire [8 : 0] addra
      .dina(data_in),    // input wire [63 : 0] dina
      .rclk(clk),    // input wire clkb
      .r_en(rd_en ),      // input wire enb
      .raddr(raddr ),  // input wire [8 : 0] addrb
      .dout(dout )  // output wire [63 : 0] doutb
); 
end
endmodule
