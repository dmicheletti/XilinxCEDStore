//-----------------------------------------------------------------------------
//
// (c) Copyright 1986-2022 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

    module csi_uport_axil_reg #
    (
    parameter TCQ                = 0,
    parameter C_S_AXI_ADDR_WIDTH = 32,
    parameter C_S_AXI_DATA_WIDTH = 32
    )
    (
        //R/W regsiter
    output logic           soft_rst_o,
    output logic           counter_rst_o,
    output logic [7:0]     npr_dest_id_o,
    output logic [7:0]     cmpl_dest_id_o,
    output logic [7:0]     pr_dest_id_o,
    output logic [12:0]    init_local_crdts_npr_o,
    output logic [12:0]    init_local_crdts_cmpl_o,
    output logic [12:0]    init_local_crdts_pr_o,
    output logic [31:0]    init_value_pr_from_mb_0_o,
    output logic [31:0]    init_value_pr_from_mb_1_o,
    output logic           mb_initialize_pr_done_o,
    output logic [31:0]    init_value_cmpl_from_mb_0_o,
    output logic [31:0]    init_value_cmpl_from_mb_1_o,
    output logic           mb_initialize_cmpl_done_o,
    output logic           invalid_axilm_addr_o,
    output logic           initiate_pr_req_o,
    output logic           initiate_npr_req_o,
    output logic           initiate_cmpl_req_o,
    output logic           ld_init_local_pr_credits_o,
    output logic           ld_init_local_npr_credits_o,
    output logic           ld_init_local_cmpl_credits_o,
    input  logic           pr_txn_in_process_i,
    input  logic           npr_txn_in_process_i,
    input  logic           cmpl_txn_in_process_i,
    input  logic [31:0]    npr_err_count_i,
    input  logic [31:0]    npr_pass_count_i,
    input  logic [31:0]    cmpl_err_count_i,
    input  logic [31:0]    cmpl_pass_count_i,
    input  logic [31:0]    pr_err_count_i,
    input  logic [31:0]    pr_pass_count_i,

    input  logic [31:0]    npr_sop_received_count_i ,
    input  logic [31:0]    npr_at_sop_received_cnt_i,
    input  logic [31:0]    pr_msg_sop_received_cnt_i,
    input  logic [11:0]    pr_msg_sspl_sop_received_cnt_i,
    input  logic [11:0]    pr_msg_vdm_sop_received_cnt_i,
    input  logic [31:0]    cmpl_sop_received_count_i,
    input  logic [31:0]    pr_sop_received_count_i  ,
    input  logic [31:0]    npr_eop_received_count_i ,
    input  logic [31:0]    cmpl_eop_received_count_i,
    input  logic [31:0]    pr_eop_received_count_i  ,
    input  logic [31:0]    npr_ibctl_rxd_cnt_i      ,
    input  logic [31:0]    npr_obctl_rxd_cnt_i      ,
    input  logic [31:0]    cmpl_ibctl_rxd_cnt_i     ,
    input  logic [31:0]    cmpl_obctl_rxd_cnt_i     ,
    input  logic [31:0]    npr_sop_sent_cnt_i       ,
    input  logic [31:0]   npr_at_sop_sent_cnt_i       ,
    input logic [15:0]   pr_msg_ats_invreq_sop_received_cnt_i,
    input logic [15:0]   pr_msg_ats_invcmpl_sop_received_cnt_i,
    input logic [15:0]   pr_msg_ats_pagereq_received_cnt_i,
    input logic [15:0]   pr_msg_ats_prg_resp_received_cnt_i,

    input  logic [7:0] npr_sop_transrq_received_cnt_i,
    input  logic [7:0] npr_sop_trans_received_cnt_i,
    input  logic [7:0] pr_sop_transrq_received_cnt_i,
    input  logic [7:0] pr_sop_trans_received_cnt_i,

    input  logic [31:0]    npr_eop_sent_cnt_i       ,
    input  logic [31:0]    cmpl_sop_sent_cnt_i      ,
    input  logic [31:0]    cmpl_eop_sent_cnt_i      ,
    input  logic [31:0]    pr_sop_sent_cnt_i        ,
    input  logic [31:0]    pr_eop_sent_cnt_i        ,
    input  logic [31:0]    pr_data_ram_read_count_i,
    input  logic [31:0]    npr_data_ram_read_count_i,
    input  logic [31:0]    cmpl_data_ram_read_count_i,
    input  logic [31:0]    pr_cmd_ram_read_count_i,
    input  logic [31:0]    npr_cmd_ram_read_count_i,
    input  logic [31:0]    cmpl_cmd_ram_read_count_i,
    input  logic [31:0]    cmpl_seed_ram_count_i,
    input  logic [31:0]    pr_seed_ram_count_i,

    input  logic [31:0]    perf_cnt_0_i,
    input  logic [31:0]    perf_cnt_1_i,
    input  logic [31:0]    perf_cnt_2_i,
    input  logic [31:0]    perf_cnt_3_i,

    input  logic [31:0]    dest_crdts_released_npr_i,
    input  logic [31:0]    dest_crdts_released_cmpl_i,
    input  logic [31:0]    dest_crdts_released_pr_i,
    
    input  logic [31:0]    s_aximm00_arvalid_cnt_i,
    input  logic [31:0]    s_aximm00_awvalid_cnt_i,
    input  logic [31:0]    s_aximm00_rvalid_cnt_i,
    input  logic [31:0]    s_aximm00_wvalid_cnt_i,
    input  logic [31:0]    s_aximm00_rlast_cnt_i,
    input  logic [31:0]    s_aximm00_wlast_cnt_i,

    input  logic [31:0]    m_aximm00_arvalid_cnt_i,
    input  logic [31:0]    m_aximm00_awvalid_cnt_i,
    input  logic [31:0]    m_aximm00_rvalid_cnt_i,
    input  logic [31:0]    m_aximm00_wvalid_cnt_i,
    input  logic [31:0]    m_aximm00_rlast_cnt_i,
    input  logic [31:0]    m_aximm00_wlast_cnt_i,
    input  logic [31:0]    m_aximm00_arready_cnt_i,
    input  logic [31:0]    m_aximm00_awready_cnt_i,
    input  logic [7:0] msgtype_sts_i,
    
    

        //axi4lite interface//// 
  input  logic                             axi_aclk,
  input  logic                             axi_aresetn,
         
  input  logic  [C_S_AXI_ADDR_WIDTH-1:0]   axi_awaddr,
  output logic                             axi_awready,
  input  logic                             axi_awvalid,
         
  input  logic  [C_S_AXI_ADDR_WIDTH-1:0]   axi_araddr,
  output logic                             axi_arready,
  input  logic                             axi_arvalid,
         
  input  logic  [C_S_AXI_DATA_WIDTH-1:0]   axi_wdata,
  input  logic  [(C_S_AXI_DATA_WIDTH/8)-1 : 0]            axi_wstrb,
  output logic                             axi_wready,
  input  logic                             axi_wvalid,
         
  output logic  [C_S_AXI_DATA_WIDTH-1:0]   axi_rdata,
  output logic  [1:0]                      axi_rresp,
  input  logic                             axi_rready,
  output logic                             axi_rvalid,
         
  output logic  [1:0]                      axi_bresp,
  input  logic                             axi_bready,
  output logic                             axi_bvalid
        
    );

  reg   [8:0]   wr_addr;
  reg   [8:0]   rd_addr;
  reg           wr_req;
  reg           rd_req;

  reg           reset_released;
  reg           reset_released_r;

 
  reg mb_pr_value_init_dn, mb_pr_value_init_dn_s1;
  reg mb_cmpl_value_init_dn, mb_cmpl_value_init_dn_s1;
  
  logic initiate_npr_req_s1, initiate_npr_req;
  logic initiate_pr_req_s1, initiate_pr_req;
  logic initiate_cmpl_req_s1, initiate_cmpl_req;
  logic ld_init_local_pr_credits, ld_init_local_npr_credits, ld_init_local_cmpl_credits;
  logic ld_init_local_pr_credits_s1, ld_init_local_npr_credits_s1, ld_init_local_cmpl_credits_s1;
   
logic npr_txn_in_process, pr_txn_in_process, cmpl_txn_in_process; 
//******************************************************************************
  //A write address phase is accepted only when there is no pending read or
  //write transactions. when both read and write transactions occur on the
  //same clock read transaction will get the highest priority and processed
  //first. write transaction will not be accepted until the read transaction
  //is completed. 
  //******************************************************************************
  assign axi_awready = ((~wr_req) && (!(rd_req || axi_arvalid))) && reset_released_r;
  assign axi_bresp = 2'b00;
  assign axi_rresp = 2'b00;
  assign axi_wready = wr_req && ~axi_bvalid;
  assign axi_arready = ~rd_req && ~wr_req && reset_released_r;


  //******************************************************************************
  //According to xilinx guide lines after reset the AWREADY and ARREADY siganls
  //should be low atleast for one clock cycle. To achieve this a signal 
  //reset_released is taken and anded with axi_awready and axi_arready signals,
  //so that the output will show a logic '0' when in reset
  //******************************************************************************
  always @(posedge axi_aclk or negedge axi_aresetn)
  begin
      if(~axi_aresetn) begin
          reset_released   <= 1'b0;
          reset_released_r <= 1'b0;
      end else begin
          reset_released   <= 1'b1;
          reset_released_r <= reset_released;
      end 
  end

  //******************************************************************************
  //AXI Lite trasaction decoding and address latching logic. 
  //when axi_a*valid signal is asserted by the master the address is latched 
  //and wr_req or rd_req signal is asserted until data phase is completed 
  //******************************************************************************


  always @(posedge axi_aclk or negedge axi_aresetn)
  begin
      if(~axi_aresetn)begin
          wr_req <= 1'b0;
          rd_req <= 1'b0;
          wr_addr <= 9'h00;
          rd_addr <= 9'h00;
      end else begin
          if(axi_awvalid && axi_awready) begin
              wr_req <= 1'b1;
              wr_addr <= axi_awaddr;
          end else if (axi_bvalid && axi_bready) begin
              wr_req <= 1'b0;
              wr_addr <= 8'h00;
          end else begin
              wr_req <= wr_req;
              wr_addr <= wr_addr;
          end

          if(axi_arvalid && axi_arready) begin
              rd_req <= 1'b1;
              rd_addr <= axi_araddr;
          end else if (axi_rvalid && axi_rready) begin
              rd_req <= 1'b0;
              rd_addr <= rd_addr;
          end else begin
              rd_req <= rd_req;
              rd_addr <= rd_addr;
          end
      end
  end
  
 
 
always @(posedge axi_aclk or negedge axi_aresetn)
  begin
      if(~axi_aresetn) begin
        pr_txn_in_process <= 'b0;
        npr_txn_in_process <= 'b0;
        cmpl_txn_in_process <= 'b0;
        end
      else begin
        pr_txn_in_process  <= pr_txn_in_process_i;
        npr_txn_in_process <= npr_txn_in_process_i; 
        cmpl_txn_in_process <= cmpl_txn_in_process_i;  
      end
 end 
  
  
   //******************************************************************************
  //AXI Lite read trasaction processing logic. 
  //when a read transaction is received, depending on address bits [5:2] the
  //data is recovered and sent on to axi_rdata signal along with axi_rvalid.  
  //The address bits [1:0] are not considred and it is expected that the
  //address is word aligned and reads complete word information. 
  //******************************************************************************
  always @(posedge axi_aclk or negedge axi_aresetn)
  begin
      if(~axi_aresetn)begin
          axi_rvalid <= 1'b0;
          axi_rdata <= 32'd0;
      end else begin
          if(rd_req) begin
              if(axi_rvalid && axi_rready) begin
                  axi_rvalid <= 1'b0;
              end else begin
                  axi_rvalid <= 1'b1;
              end
              if(~axi_rvalid) begin
                 case (rd_addr[8:0]) 
                     9'h00: axi_rdata <= {24'd0,npr_dest_id_o};
                     9'h04: axi_rdata <= {24'd0,cmpl_dest_id_o};
                     9'h08: axi_rdata <= {24'd0,pr_dest_id_o};
                     9'h0C: axi_rdata <= {19'd0,init_local_crdts_npr_o};
                     9'h10: axi_rdata <= {19'd0,init_local_crdts_cmpl_o};
                     9'h14: axi_rdata <= {19'd0,init_local_crdts_pr_o};
                     9'h18: axi_rdata <= init_value_pr_from_mb_0_o;
                     9'h1C: axi_rdata <= init_value_pr_from_mb_1_o;
                     9'h20: axi_rdata <= {16'hC05F,8'h10,8'h10};
                     9'h24: axi_rdata <= {29'd0,pr_txn_in_process,cmpl_txn_in_process,npr_txn_in_process};
                     9'h28: axi_rdata <= {22'd0,counter_rst_o,soft_rst_o,2'b0,ld_init_local_pr_credits,ld_init_local_cmpl_credits,ld_init_local_npr_credits,initiate_pr_req,initiate_cmpl_req,initiate_npr_req};
                     9'h2C: axi_rdata <= init_value_cmpl_from_mb_0_o;
                     9'h30: axi_rdata <= init_value_cmpl_from_mb_1_o;
                     9'h34: axi_rdata <= npr_err_count_i;
                     9'h38: axi_rdata <= npr_pass_count_i;
                     9'h3C: axi_rdata <= cmpl_err_count_i;
                     9'h40: axi_rdata <= cmpl_pass_count_i;
                     9'h44: axi_rdata <= pr_err_count_i;
                     9'h48: axi_rdata <= pr_pass_count_i;
                     9'h4c: axi_rdata <= s_aximm00_arvalid_cnt_i;
                     9'h50: axi_rdata <= s_aximm00_awvalid_cnt_i;
                     9'h54: axi_rdata <= s_aximm00_rvalid_cnt_i;
                     9'h58: axi_rdata <= s_aximm00_wvalid_cnt_i;
                     9'h5c: axi_rdata <= s_aximm00_rlast_cnt_i;
                     9'h60: axi_rdata <= s_aximm00_wlast_cnt_i;
                     9'h64: axi_rdata <= m_aximm00_arvalid_cnt_i;
                     9'h68: axi_rdata <= m_aximm00_awvalid_cnt_i;
                     9'h6c: axi_rdata <= m_aximm00_rvalid_cnt_i;
                     9'h70: axi_rdata <= m_aximm00_wvalid_cnt_i;
                     9'h74: axi_rdata <= m_aximm00_rlast_cnt_i;
                     9'h78: axi_rdata <= m_aximm00_wlast_cnt_i;
                     9'h7c: axi_rdata <= m_aximm00_awready_cnt_i;
                     9'h80: axi_rdata <= m_aximm00_arready_cnt_i;
                     9'h84: axi_rdata <= dest_crdts_released_npr_i;
                     9'h88: axi_rdata <= dest_crdts_released_cmpl_i;
                     9'h8c: axi_rdata <= dest_crdts_released_pr_i;

                     9'h90: axi_rdata <= npr_sop_received_count_i     ;
                     9'h98: axi_rdata <= cmpl_sop_received_count_i    ;
                     9'ha0: axi_rdata <= pr_sop_received_count_i      ;
                     9'h94: axi_rdata <= npr_eop_received_count_i     ;
                     9'h9c: axi_rdata <= cmpl_eop_received_count_i    ;
                     9'ha4: axi_rdata <= pr_eop_received_count_i      ;
                     9'ha8: axi_rdata <= npr_ibctl_rxd_cnt_i          ;
                     9'hac: axi_rdata <= npr_obctl_rxd_cnt_i          ;
                     9'hb0: axi_rdata <= cmpl_ibctl_rxd_cnt_i         ;
                     9'hb4: axi_rdata <= cmpl_obctl_rxd_cnt_i         ;
                     9'hb8: axi_rdata <= npr_sop_sent_cnt_i         ;
                     9'hbc: axi_rdata <= npr_eop_sent_cnt_i         ;
                     9'hc0: axi_rdata <= cmpl_sop_sent_cnt_i            ;
                     9'hc4: axi_rdata <= cmpl_eop_sent_cnt_i            ;
                     9'hc8: axi_rdata <= pr_sop_sent_cnt_i          ;
                     9'hcc: axi_rdata <= pr_eop_sent_cnt_i          ;
                     9'hd0: axi_rdata <= npr_cmd_ram_read_count_i;
                     9'hd4: axi_rdata <= cmpl_cmd_ram_read_count_i;
                     9'hd8: axi_rdata <= pr_cmd_ram_read_count_i;
                     9'hdc: axi_rdata <= npr_data_ram_read_count_i;
                     9'he0: axi_rdata <= cmpl_data_ram_read_count_i;
                     9'he4: axi_rdata <= pr_data_ram_read_count_i;
                     9'he8: axi_rdata <= cmpl_seed_ram_count_i;
                     9'hec: axi_rdata <= pr_seed_ram_count_i;
                     9'hf0: axi_rdata <= {npr_at_sop_received_cnt_i[15:0],npr_at_sop_sent_cnt_i[15:0]};
                     9'hf4: axi_rdata <= {pr_sop_trans_received_cnt_i[3:0],pr_sop_transrq_received_cnt_i[3:0],npr_sop_trans_received_cnt_i[3:0],npr_sop_transrq_received_cnt_i[3:0],pr_msg_sop_received_cnt_i[15:0]};                   
                     9'hf8: axi_rdata <= {pr_msg_ats_prg_resp_received_cnt_i[7:0],pr_msg_ats_pagereq_received_cnt_i[7:0],pr_msg_ats_invcmpl_sop_received_cnt_i[7:0],pr_msg_ats_invreq_sop_received_cnt_i[7:0]};
                     9'hfc: axi_rdata <= {pr_msg_sspl_sop_received_cnt_i,pr_msg_vdm_sop_received_cnt_i,msgtype_sts_i};
                     9'h100: axi_rdata <= perf_cnt_0_i; 
                     9'h104: axi_rdata <= perf_cnt_1_i; 
                     9'h108: axi_rdata <= perf_cnt_2_i; 
                     9'h10c: axi_rdata <= perf_cnt_3_i; 
                     default: axi_rdata <= 32'd0;
                 endcase
              end
          end else begin
              axi_rvalid <= 1'b0;
              axi_rdata <= 32'd0;
          end
      end 
  end




 //******************************************************************************
  //AXI Lite write trasaction processing logic. 
  //when a write transaction is received, depending on address bits [5:2] the
  //data is written in to the corresponding register.  
  //The address bits [1:0] are not considred and it is expected that the
  //address is word aligned and writes into entire register.  
  //******************************************************************************
  always @(posedge axi_aclk or negedge axi_aresetn)
  begin
      if(~axi_aresetn)begin
          soft_rst_o <= 'b0;
          counter_rst_o <= 'b0;
          npr_dest_id_o <= 'h0;
          cmpl_dest_id_o <= 'h0;
          pr_dest_id_o <= 'h0;
          init_local_crdts_npr_o <= 'h0;
          init_local_crdts_cmpl_o <= 'h0;
          init_local_crdts_pr_o <= 'h0;
          init_value_pr_from_mb_0_o <= 'h0;
          init_value_pr_from_mb_1_o <= 'h0;
          init_value_cmpl_from_mb_0_o <= 'h0;
          init_value_cmpl_from_mb_1_o <= 'h0;
          mb_pr_value_init_dn <= 'b0;
          mb_cmpl_value_init_dn <='b0;
          initiate_cmpl_req <= 'b0;
          initiate_npr_req <= 'b0;
          initiate_pr_req <= 'b0;
          ld_init_local_pr_credits <= 1'b0;
          ld_init_local_npr_credits <= 1'b0;
          ld_init_local_cmpl_credits <= 1'b0;
      end else begin
          if(wr_req && axi_wvalid && ~axi_bvalid) begin
              case (wr_addr[8:0]) 
                  9'h00 : npr_dest_id_o    <= {24'b0, axi_wdata[7:0]};
                  9'h04 : cmpl_dest_id_o   <= {24'b0, axi_wdata[7:0]};
                  9'h08 : pr_dest_id_o     <= {24'b0, axi_wdata[7:0]};
                  9'h0C : init_local_crdts_npr_o     <= {19'b0, axi_wdata[12:0]};
                  9'h10 : init_local_crdts_cmpl_o    <= {19'b0, axi_wdata[12:0]};
                  9'h14 : init_local_crdts_pr_o      <= {19'b0, axi_wdata[12:0]};
                  9'h18 : init_value_pr_from_mb_0_o  <= axi_wdata;
                  9'h1C : begin
                            init_value_pr_from_mb_1_o  <= axi_wdata;
                            mb_pr_value_init_dn        <= 'b1;  
                          end
                  9'h28 : begin
                             soft_rst_o    <= axi_wdata[8];
                             counter_rst_o <= axi_wdata[9];
                             initiate_npr_req <= axi_wdata[0];
                             initiate_pr_req <= axi_wdata[2];
                             initiate_cmpl_req <= axi_wdata[1];
                             ld_init_local_pr_credits <= axi_wdata[5];
                             ld_init_local_npr_credits <= axi_wdata[3];
                             ld_init_local_cmpl_credits <= axi_wdata[4];
                         end
                  9'h2C : init_value_cmpl_from_mb_0_o  <= axi_wdata;
                  9'h30 : begin
                            init_value_cmpl_from_mb_1_o  <= axi_wdata;
                            mb_cmpl_value_init_dn        <= 'b1;    
                          end
              endcase
          end else begin
              mb_pr_value_init_dn  <= 'b0;
              soft_rst_o <= 'b0;
              counter_rst_o <= 'b0;
          end
      end 
  end




  //********************************************************************************
  //write response channel logic. 
  //This logic will generate BVALID signal for the write transaction. 
  //********************************************************************************
  always @(posedge axi_aclk or negedge axi_aresetn)
  begin
      if(~axi_aresetn) begin
          axi_bvalid <= 1'b0;
      end else begin
          if(wr_req && axi_wvalid && ~axi_bvalid) begin
              axi_bvalid <= 1'b1;
          end else if(axi_bready) begin
              axi_bvalid <= 1'b0;
          end else begin
              axi_bvalid <= axi_bvalid;
          end
      end
  end


//Generate a pulse after the mb initialises initial data value for PR
//This is used to initialize data checker
`XSRREG_AXIMM(axi_aclk, axi_aresetn, mb_pr_value_init_dn_s1, mb_pr_value_init_dn, 1'b0)
`XSRREG_AXIMM(axi_aclk, axi_aresetn, mb_cmpl_value_init_dn_s1, mb_cmpl_value_init_dn, 1'b0)

`XSRREG_AXIMM(axi_aclk, axi_aresetn, initiate_pr_req_s1, initiate_pr_req, 1'b0)
`XSRREG_AXIMM(axi_aclk, axi_aresetn, initiate_npr_req_s1, initiate_npr_req, 1'b0)
`XSRREG_AXIMM(axi_aclk, axi_aresetn, initiate_cmpl_req_s1, initiate_cmpl_req, 1'b0)


`XSRREG_AXIMM(axi_aclk, axi_aresetn, ld_init_local_pr_credits_s1, ld_init_local_pr_credits, 1'b0)
`XSRREG_AXIMM(axi_aclk, axi_aresetn, ld_init_local_npr_credits_s1, ld_init_local_npr_credits, 1'b0)
`XSRREG_AXIMM(axi_aclk, axi_aresetn, ld_init_local_cmpl_credits_s1, ld_init_local_cmpl_credits, 1'b0)
 
 always_comb begin
    mb_initialize_pr_done_o = mb_pr_value_init_dn & ~mb_pr_value_init_dn_s1; 
    mb_initialize_cmpl_done_o = mb_cmpl_value_init_dn & ~mb_cmpl_value_init_dn_s1;  

    initiate_pr_req_o   = initiate_pr_req & ~ initiate_pr_req_s1;
    initiate_npr_req_o  = initiate_npr_req & ~ initiate_npr_req_s1;
    initiate_cmpl_req_o = initiate_cmpl_req & ~ initiate_cmpl_req_s1;
    //initiate_cmpl_req_o = initiate_cmpl_req ;
    
    ld_init_local_pr_credits_o = ld_init_local_pr_credits & ~ld_init_local_pr_credits_s1;
    ld_init_local_npr_credits_o = ld_init_local_npr_credits & ~ld_init_local_npr_credits_s1;
    ld_init_local_cmpl_credits_o = ld_init_local_cmpl_credits & ~ld_init_local_cmpl_credits_s1;
 end
 
 
 endmodule
