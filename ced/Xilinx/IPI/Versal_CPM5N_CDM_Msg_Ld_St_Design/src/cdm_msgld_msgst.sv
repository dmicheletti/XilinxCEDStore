`timescale 1ps / 1ps



module cdm_msgld_msgst
//import cpm5n_v1_0_7_pkg::*;
(
	input fabric_clk,	
	input fabric_rst_n,	
	
	input [31:0]	S_AXI_CDM_araddr,	
	input [2:0]		S_AXI_CDM_arprot,	
	output 			S_AXI_CDM_arready,	
	input 			S_AXI_CDM_arvalid,	
	input [31:0]	S_AXI_CDM_awaddr,	
	input [2:0]		S_AXI_CDM_awprot,	
	output 			S_AXI_CDM_awready,	
	input 			S_AXI_CDM_awvalid,	
	input 			S_AXI_CDM_bready,	
	output [1:0]	S_AXI_CDM_bresp,	
	output 			S_AXI_CDM_bvalid,	
	output [31:0]	S_AXI_CDM_rdata,	
	input 			S_AXI_CDM_rready,	
	output [1:0]	S_AXI_CDM_rresp,	
	output 			S_AXI_CDM_rvalid,	
	input [31:0]	S_AXI_CDM_wdata,	
	output 			S_AXI_CDM_wready,	
	input [3:0]		S_AXI_CDM_wstrb,	
	input 			S_AXI_CDM_wvalid,
	
	input [31:0]	S_AXIL_CDMRAM_araddr,
    input [2:0]		S_AXIL_CDMRAM_arprot,
    output 			S_AXIL_CDMRAM_arready,
    input 			S_AXIL_CDMRAM_arvalid,
    input [31:0]	S_AXIL_CDMRAM_awaddr,
    input [2:0]		S_AXIL_CDMRAM_awprot,
    output 			S_AXIL_CDMRAM_awready,
    input 			S_AXIL_CDMRAM_awvalid,
    input 			S_AXIL_CDMRAM_bready,
    output [1:0]	S_AXIL_CDMRAM_bresp,
    output 			S_AXIL_CDMRAM_bvalid,
    output [31:0]	S_AXIL_CDMRAM_rdata,
    input 			S_AXIL_CDMRAM_rready,
    output [1:0]	S_AXIL_CDMRAM_rresp,
    output 			S_AXIL_CDMRAM_rvalid,
    input [31:0]	S_AXIL_CDMRAM_wdata,
    output 			S_AXIL_CDMRAM_wready,
    input [3:0]		S_AXIL_CDMRAM_wstrb,
    input 			S_AXIL_CDMRAM_wvalid,
	
	output [31:0]	msgstld_perf_reg_araddr,
	input 			msgstld_perf_reg_arready,
	output 			msgstld_perf_reg_arvalid,
	output [31:0]	msgstld_perf_reg_awaddr,
	input 			msgstld_perf_reg_awready,
	output 			msgstld_perf_reg_awvalid,
	output 			msgstld_perf_reg_bready,
    input [1:0]		msgstld_perf_reg_bresp,
	input 			msgstld_perf_reg_bvalid,
	input [31:0]	msgstld_perf_reg_rdata,
	output 			msgstld_perf_reg_rready,
	input [1:0]		msgstld_perf_reg_rresp,
	input 			msgstld_perf_reg_rvalid,
	output [31:0]	msgstld_perf_reg_wdata,
	input 			msgstld_perf_reg_wready,
	output [3:0]	msgstld_perf_reg_wstrb,
	output 			msgstld_perf_reg_wvalid,


	cdx5n_cmpt_msgst_if.m                         fab0_cmpt_msgst_fab_int,             
	cdx5n_mm_byp_out_rsp_if.s                     fab0_byp_out_msgld_dat_fab_int,            
	cdx5n_dsc_crd_in_msgld_req_if.m               fab0_dsc_crd_msgld_req_fab_int,

    //cdx5n_h2c_st_byp_in_m2st_req_if.m             fab0_h2c_st_byp_in_m2st_req_int, 	
    //cdx5n_h2c_st_m2st_dat_if.s                    fab0_h2c_st_m2st_dat_int,        	
    //cdx5n_c2h_st_byp_in_st2m_req_if.m             fab0_c2h_st_byp_in_st2m_req_int, 	
    //cdx5n_c2h_st2m_dat_if.m                       fab0_c2h_st_st2m_dat_int,        
    //cdx5n_rru_dst_crd_if.m                        fab0_rru_dst_crd_int   
	
	output logic [6:0]		msgst_num_of_CMD,
	output logic [6:0]		msgld_num_of_CMD,
	output logic           msgst_cmd_fill_bram,
	output logic           msgld_cmd_fill_bram,
	
	input logic           msgst_pld_cmd_req_vio,
    input logic [14:0]    msgst_num_of_req_vio,
    input logic [31:0]    msgst_pcie0_host_addr_vio,
    
    input logic           msgld_pld_cmd_rd_start_vio,
    input logic [14:0]    msgld_num_of_req_vio,
    input logic [31:0]    msgld_pcie0_host_addr_vio,
    
    input logic [2:0]     back_pres_vio,
    input logic [2:0]     halt_vio,
    input logic           enforce_order_vio
);



  wire [31:0]MSGLD_CMD_RAM_addrb;

  wire [31:0]MSGLD_CMD_RAM_doutb;

  wire MSGLD_CMD_RAM_enb;

  wire [31:0]MSGLD_Payload_RAM_addrb;

  wire [255:0]MSGLD_Payload_RAM_dinb;

  wire [31:0]MSGLD_Payload_RAM_web;

  wire [31:0]MSGST_CMD_RAM_addrb;

  wire [31:0]MSGST_CMD_RAM_doutb;

  wire MSGST_CMD_RAM_enb;

  wire [31:0]MSGST_Payload_RAM_addrb;

  wire [255:0]MSGST_Payload_RAM_dinb;

  wire [31:0]MSGST_Payload_RAM_web;

  wire [31:0]MSG_Response_RAM_addrb;

  wire [31:0]MSG_Response_RAM_dinb;

  wire [3:0]MSG_Response_RAM_web;

  wire [31:0]M_CDM_ADAPT_CTRL_REGS_araddr;

  wire [2:0]M_CDM_ADAPT_CTRL_REGS_arprot;

  wire M_CDM_ADAPT_CTRL_REGS_arready;

  wire M_CDM_ADAPT_CTRL_REGS_arvalid;

  wire [31:0]M_CDM_ADAPT_CTRL_REGS_awaddr;

  wire [2:0]M_CDM_ADAPT_CTRL_REGS_awprot;

  wire M_CDM_ADAPT_CTRL_REGS_awready;

  wire M_CDM_ADAPT_CTRL_REGS_awvalid;

  wire M_CDM_ADAPT_CTRL_REGS_bready;

  wire [1:0]M_CDM_ADAPT_CTRL_REGS_bresp;

  wire M_CDM_ADAPT_CTRL_REGS_bvalid;

  wire [31:0]M_CDM_ADAPT_CTRL_REGS_rdata;

  wire M_CDM_ADAPT_CTRL_REGS_rready;

  wire [1:0]M_CDM_ADAPT_CTRL_REGS_rresp;

  wire M_CDM_ADAPT_CTRL_REGS_rvalid;

  wire [31:0]M_CDM_ADAPT_CTRL_REGS_wdata;

  wire M_CDM_ADAPT_CTRL_REGS_wready;

  wire [3:0]M_CDM_ADAPT_CTRL_REGS_wstrb;

  wire M_CDM_ADAPT_CTRL_REGS_wvalid;

  // ST2M interface related signals

  wire [255:0] cmd_ram_din;	 			// cmd ram data bus is 256 bit width

  wire 		   cmd_ram_ren;     		// RAM enable

  wire [31:0]  cmd_ram_addr;	 		// 32 bit address bus

  wire [31:0]  cmd_ram_web;     		// Byte strobes

  wire [31:0]  st2m_ctrl_reg; 	 		// bit 0 - Start bit ; bit 31:1 number of back to back ST2M messages number 

  wire [31:0]  st2m_ctrl_reg_1; 		// bit 0 - Start bit ; bit 31:1 number of back to back ST2M messages number 

  wire [31:0]  st2m_rsp_status; 		// bit 0 - req_done; bit 1- all data sent 

  // M2ST interface related signals  

  wire [255:0] M2ST_CMD_RAM_dinb;			// cmd ram data bus is 256 bit width

  wire   	   M2ST_CMD_RAM_enb;       	// RAM enable

  wire [31:0]  M2ST_CMD_RAM_addrb;		// 32 bit address bus

  wire [31:0]  M2ST_CMD_RAM_web;       	// Byte strobes    

  // Response Ram interface  

  wire [31:0]  M2ST_RESP_RAM_dinb;		// response ram data bus is 256 bit width

  wire         M2ST_RESP_RAM_enb;      	// RAM enable

  wire [31:0]  M2ST_RESP_RAM_addrb;		// 32 bit address bus

  wire [31:0]  M2ST_RESP_RAM_web;      	// Byte strobes	

  // Control and status registers

  wire [31:0]  m2st_ctrl_reg;	

  wire [31:0]  m2st_rsp_status; 

  wire [31:0]  m2st_pass_cnt;

  wire [31:0]  m2st_fail_cnt;	

  wire [31:0]  soft_rst_n;
  
  wire         order_error;
  
	logic msgst_infinite_pkt_run_start;
    logic msgld_infinite_pkt_run_start;
    
  cdx5n_cmpt_msgst_if                         fab0_cmpt_msgst_fab_int_ac()       , fab0_cmpt_msgst_fab_int_bp()       , fab0_cmpt_msgst_fab_int_oe();
  cdx5n_mm_byp_out_rsp_if                     fab0_byp_out_msgld_dat_fab_int_ac(), fab0_byp_out_msgld_dat_fab_int_bp(), fab0_byp_out_msgld_dat_fab_int_oe();
  cdx5n_dsc_crd_in_msgld_req_if               fab0_dsc_crd_msgld_req_fab_int_ac(), fab0_dsc_crd_msgld_req_fab_int_bp(), fab0_dsc_crd_msgld_req_fab_int_oe();


  cdm_usr_ram_wrapper i_cdm_msg_st_ld_adapter_bd_logic_wrapper

       (

	    // M2ST interface

	    //.M2ST_CMD_RAM_addrb(M2ST_CMD_RAM_addrb),
		//
		//.M2ST_CMD_RAM_dinb(M2ST_CMD_RAM_dinb),
		//
		//.M2ST_CMD_RAM_enb(M2ST_CMD_RAM_enb),
		//
		//.M2ST_CMD_RAM_web(M2ST_RESP_RAM_web),
		//
		//.M2ST_RESP_RAM_addrb(M2ST_RESP_RAM_addrb),
		//
		//.M2ST_RESP_RAM_dinb(M2ST_RESP_RAM_dinb),
		//
		//.M2ST_RESP_RAM_enb(M2ST_RESP_RAM_enb),
		//
		//.M2ST_RESP_RAM_web(M2ST_RESP_RAM_web),

	    .MSGLD_CMD_RAM_addrb(MSGLD_CMD_RAM_addrb[12:0]),

        .MSGLD_CMD_RAM_doutb(MSGLD_CMD_RAM_doutb),

        .MSGLD_CMD_RAM_enb(MSGLD_CMD_RAM_enb),

        .MSGLD_Payload_RAM_addrb(MSGLD_Payload_RAM_addrb[12:0]),

        .MSGLD_Payload_RAM_dinb(MSGLD_Payload_RAM_dinb),

        .MSGLD_Payload_RAM_web(MSGLD_Payload_RAM_web),

        .MSGST_CMD_RAM_addrb(MSGST_CMD_RAM_addrb[12:0]),

        .MSGST_CMD_RAM_doutb(MSGST_CMD_RAM_doutb),

        .MSGST_CMD_RAM_enb(MSGST_CMD_RAM_enb),

        .MSGST_Payload_RAM_addrb(MSGST_Payload_RAM_addrb[12:0]),

        .MSGST_Payload_RAM_dinb(MSGST_Payload_RAM_dinb),

        .MSGST_Payload_RAM_web(MSGST_Payload_RAM_web),

        .MSG_Response_RAM_addrb(MSG_Response_RAM_addrb[12:0]),

        .MSG_Response_RAM_dinb(MSG_Response_RAM_dinb),

        .MSG_Response_RAM_web(MSG_Response_RAM_web),

        .M_CDM_ADAPT_CTRL_REGS_araddr(M_CDM_ADAPT_CTRL_REGS_araddr),

        .M_CDM_ADAPT_CTRL_REGS_arprot(),

        .M_CDM_ADAPT_CTRL_REGS_arready(M_CDM_ADAPT_CTRL_REGS_arready),

        .M_CDM_ADAPT_CTRL_REGS_arvalid(M_CDM_ADAPT_CTRL_REGS_arvalid),

        .M_CDM_ADAPT_CTRL_REGS_awaddr(M_CDM_ADAPT_CTRL_REGS_awaddr),

        .M_CDM_ADAPT_CTRL_REGS_awprot(),

        .M_CDM_ADAPT_CTRL_REGS_awready(M_CDM_ADAPT_CTRL_REGS_awready),

        .M_CDM_ADAPT_CTRL_REGS_awvalid(M_CDM_ADAPT_CTRL_REGS_awvalid),

        .M_CDM_ADAPT_CTRL_REGS_bready(M_CDM_ADAPT_CTRL_REGS_bready),

        .M_CDM_ADAPT_CTRL_REGS_bresp(M_CDM_ADAPT_CTRL_REGS_bresp),

        .M_CDM_ADAPT_CTRL_REGS_bvalid(M_CDM_ADAPT_CTRL_REGS_bvalid),

        .M_CDM_ADAPT_CTRL_REGS_rdata(M_CDM_ADAPT_CTRL_REGS_rdata),

        .M_CDM_ADAPT_CTRL_REGS_rready(M_CDM_ADAPT_CTRL_REGS_rready),

        .M_CDM_ADAPT_CTRL_REGS_rresp(M_CDM_ADAPT_CTRL_REGS_rresp),

        .M_CDM_ADAPT_CTRL_REGS_rvalid(M_CDM_ADAPT_CTRL_REGS_rvalid),

        .M_CDM_ADAPT_CTRL_REGS_wdata(M_CDM_ADAPT_CTRL_REGS_wdata),

        .M_CDM_ADAPT_CTRL_REGS_wready(M_CDM_ADAPT_CTRL_REGS_wready),

        .M_CDM_ADAPT_CTRL_REGS_wstrb(M_CDM_ADAPT_CTRL_REGS_wstrb),

        .M_CDM_ADAPT_CTRL_REGS_wvalid(M_CDM_ADAPT_CTRL_REGS_wvalid),

		// ST2M Interface

		//.ST2M_CMD_RAM_addrb(cmd_ram_addr),
		//
		//.ST2M_CMD_RAM_dinb(cmd_ram_din),
		//
		//.ST2M_CMD_RAM_enb(cmd_ram_ren),
		//
		//.ST2M_CMD_RAM_web(cmd_ram_web),

        .S_AXI_CDM_araddr(S_AXI_CDM_araddr),

        .S_AXI_CDM_arprot(S_AXI_CDM_arprot),

        .S_AXI_CDM_arready(S_AXI_CDM_arready),

        .S_AXI_CDM_arvalid(S_AXI_CDM_arvalid),

        .S_AXI_CDM_awaddr(S_AXI_CDM_awaddr),

        .S_AXI_CDM_awprot(S_AXI_CDM_awprot),

        .S_AXI_CDM_awready(S_AXI_CDM_awready),

        .S_AXI_CDM_awvalid(S_AXI_CDM_awvalid),

        .S_AXI_CDM_bready(S_AXI_CDM_bready),

        .S_AXI_CDM_bresp(S_AXI_CDM_bresp),

        .S_AXI_CDM_bvalid(S_AXI_CDM_bvalid),

        .S_AXI_CDM_rdata(S_AXI_CDM_rdata),

        .S_AXI_CDM_rready(S_AXI_CDM_rready),

        .S_AXI_CDM_rresp(S_AXI_CDM_rresp),

        .S_AXI_CDM_rvalid(S_AXI_CDM_rvalid),

        .S_AXI_CDM_wdata(S_AXI_CDM_wdata),

        .S_AXI_CDM_wready(S_AXI_CDM_wready),

        .S_AXI_CDM_wstrb(S_AXI_CDM_wstrb),

        .S_AXI_CDM_wvalid(S_AXI_CDM_wvalid),
		
		.S_AXIL_CDMRAM_araddr(S_AXIL_CDMRAM_araddr),
		
        .S_AXIL_CDMRAM_arprot(S_AXIL_CDMRAM_arprot),
		
        .S_AXIL_CDMRAM_arready(S_AXIL_CDMRAM_arready),
		
        .S_AXIL_CDMRAM_arvalid(S_AXIL_CDMRAM_arvalid),
		
        .S_AXIL_CDMRAM_awaddr(S_AXIL_CDMRAM_awaddr),
		
        .S_AXIL_CDMRAM_awprot(S_AXIL_CDMRAM_awprot),
		
        .S_AXIL_CDMRAM_awready(S_AXIL_CDMRAM_awready),
		
        .S_AXIL_CDMRAM_awvalid(S_AXIL_CDMRAM_awvalid),
		
        .S_AXIL_CDMRAM_bready(S_AXIL_CDMRAM_bready),
		
        .S_AXIL_CDMRAM_bresp(S_AXIL_CDMRAM_bresp),
		
        .S_AXIL_CDMRAM_bvalid(S_AXIL_CDMRAM_bvalid),
		
        .S_AXIL_CDMRAM_rdata(S_AXIL_CDMRAM_rdata),
		
        .S_AXIL_CDMRAM_rready(S_AXIL_CDMRAM_rready),
		
        .S_AXIL_CDMRAM_rresp(S_AXIL_CDMRAM_rresp),
		
        .S_AXIL_CDMRAM_rvalid(S_AXIL_CDMRAM_rvalid),
		
        .S_AXIL_CDMRAM_wdata(S_AXIL_CDMRAM_wdata),
		
        .S_AXIL_CDMRAM_wready(S_AXIL_CDMRAM_wready),
		
        .S_AXIL_CDMRAM_wstrb(S_AXIL_CDMRAM_wstrb),
		
        .S_AXIL_CDMRAM_wvalid(S_AXIL_CDMRAM_wvalid),
		
		.msgstld_perf_reg_araddr(msgstld_perf_reg_araddr),
		
        .msgstld_perf_reg_arprot(),
		
        .msgstld_perf_reg_arready(msgstld_perf_reg_arready),
		
        .msgstld_perf_reg_arvalid(msgstld_perf_reg_arvalid),
		
        .msgstld_perf_reg_awaddr(msgstld_perf_reg_awaddr),
		
        .msgstld_perf_reg_awprot(),
		
        .msgstld_perf_reg_awready(msgstld_perf_reg_awready),
		
        .msgstld_perf_reg_awvalid(msgstld_perf_reg_awvalid),
		
        .msgstld_perf_reg_bready(msgstld_perf_reg_bready),
		
        .msgstld_perf_reg_bresp(msgstld_perf_reg_bresp),
		
        .msgstld_perf_reg_bvalid(msgstld_perf_reg_bvalid),
		
        .msgstld_perf_reg_rdata(msgstld_perf_reg_rdata),
		
        .msgstld_perf_reg_rready(msgstld_perf_reg_rready),
		
        .msgstld_perf_reg_rresp(msgstld_perf_reg_rresp),
		
        .msgstld_perf_reg_rvalid(msgstld_perf_reg_rvalid),
		
        .msgstld_perf_reg_wdata(msgstld_perf_reg_wdata),
		
        .msgstld_perf_reg_wready(msgstld_perf_reg_wready),
		
        .msgstld_perf_reg_wstrb(msgstld_perf_reg_wstrb),
		
        .msgstld_perf_reg_wvalid(msgstld_perf_reg_wvalid),

        .clk_in(fabric_clk),

        .rst_n(fabric_rst_n));

		

  

  //wire [31:0]host_ctrl_reg;

  wire [31:0]psx_host_ctrl_reg;  

  wire [31:0]pci0_host_ctrl_reg;

  //wire [31:0]host_reqid;

  wire [31:0]psx_host_reqid;  

  wire [31:0]pci0_host_reqid;



  wire [31:0]msgld_rsp_status;



  wire [31:0]msg_ctrl_reg_0;

  

  wire [31:0]msg_ctrl_reg_1;



  wire [31:0]msgst_rsp_status;

  

  wire [31:0] msgld_pass_counter_stats;

  

  wire [31:0] msgld_fail_counter_stats;

  

  //wire [31:0] host_addr_0, host_addr_1;

  wire [31:0] psx_msgst_host_addr_0, psx_msgst_host_addr_1; 

  wire [31:0] psx_msgst_host_addr_mask_1,psx_msgst_host_addr_mask_0;  

  wire [31:0] psx_msgld_host_addr_0, psx_msgld_host_addr_1;  
  
  wire [31:0] psx_msgld_host_addr_mask_0, psx_msgld_host_addr_mask_1;  

  wire [31:0] pci0_msgst_host_addr_0, pci0_msgst_host_addr_1;  
  
  wire [31:0] pci_msgst_host_addr_mask_0, pci_msgst_host_addr_mask_1;

  wire [31:0] pci0_msgld_host_addr_0, pci0_msgld_host_addr_1;
  
  wire [31:0] pci_msgld_host_addr_mask_0, pci_msgld_host_addr_mask_1;

  logic [14:0] msgst_num_of_req;
  logic [14:0] msgld_num_of_req;
  
  logic [1:0] num_of_NoC_cfg;
  logic [6:0] Noc_port_switch_req_cnt;

cdm_adapt_ctrl_regs i_cdm_adapt_ctrl_regs (

  

        .msg_ctrl_reg_0(msg_ctrl_reg_0),

        .msg_ctrl_reg_1(msg_ctrl_reg_1),

		.psx_msgst_host_addr_0(psx_msgst_host_addr_0),

		.psx_msgst_host_addr_1(psx_msgst_host_addr_1),
		
		.psx_msgst_host_addr_mask_0(psx_msgst_host_addr_mask_0),

		.psx_msgst_host_addr_mask_1(psx_msgst_host_addr_mask_1),

        .psx_host_reqid(psx_host_reqid),

        .psx_host_ctrl_reg(psx_host_ctrl_reg),

		.psx_msgld_host_addr_0(psx_msgld_host_addr_0),

		.psx_msgld_host_addr_1(psx_msgld_host_addr_1),
		
		.psx_msgld_host_addr_mask_0(psx_msgld_host_addr_mask_0),

		.psx_msgld_host_addr_mask_1(psx_msgld_host_addr_mask_1),

		.pci0_msgst_host_addr_0(pci0_msgst_host_addr_0),

		.pci0_msgst_host_addr_1(pci0_msgst_host_addr_1),
		
		.pci_msgst_host_addr_mask_0(pci_msgst_host_addr_mask_0),

		.pci_msgst_host_addr_mask_1(pci_msgst_host_addr_mask_1),

        .pci0_host_reqid(pci0_host_reqid),

        .pci0_host_ctrl_reg(pci0_host_ctrl_reg),

		.pci0_msgld_host_addr_0(pci0_msgld_host_addr_0),

		.pci0_msgld_host_addr_1(pci0_msgld_host_addr_1),
		
		.pci_msgld_host_addr_mask_0(pci_msgld_host_addr_mask_0),

		.pci_msgld_host_addr_mask_1(pci_msgld_host_addr_mask_1),

        .msgst_rsp_status({31'd0, msgst_rsp_status[0]}),

        .msgld_rsp_status({30'd0, order_error, msgld_rsp_status[0]}),

        .msgld_pass_counter_stats({22'h0,msgld_pass_counter_stats[9:0]}),

		.msgld_fail_counter_stats({22'h0,msgld_fail_counter_stats[9:0]}),

		// ST2M interface

		.st2m_ctrl_reg(st2m_ctrl_reg),

		.st2m_ctrl_reg_1(st2m_ctrl_reg_1),

		//.st2m_rsp_status(st2m_rsp_status),
		.st2m_rsp_status(32'h0),

		// M2ST interface

		.m2st_ctrl_reg(m2st_ctrl_reg),

		//.m2st_rsp_status(m2st_rsp_status),
		.m2st_rsp_status(32'h0),

		//.m2st_rsp_pass_cnt(m2st_pass_cnt),

		//.m2st_rsp_fail_cnt(m2st_fail_cnt),

		.soft_rst_n(soft_rst_n),

		// AXI interface

		.axi_aclk(fabric_clk),		

		.axi_aresetn(fabric_rst_n),		

		.axi_awaddr(M_CDM_ADAPT_CTRL_REGS_awaddr),		

		.axi_awready(M_CDM_ADAPT_CTRL_REGS_awready),		

		.axi_awvalid(M_CDM_ADAPT_CTRL_REGS_awvalid),		

		.axi_araddr(M_CDM_ADAPT_CTRL_REGS_araddr),		

		.axi_arready(M_CDM_ADAPT_CTRL_REGS_arready),		

		.axi_arvalid(M_CDM_ADAPT_CTRL_REGS_arvalid),		

		.axi_wdata(M_CDM_ADAPT_CTRL_REGS_wdata),		

		.axi_wstrb(M_CDM_ADAPT_CTRL_REGS_wstrb),		

		.axi_wready(M_CDM_ADAPT_CTRL_REGS_wready),		

		.axi_wvalid(M_CDM_ADAPT_CTRL_REGS_wvalid),		

		.axi_rdata(M_CDM_ADAPT_CTRL_REGS_rdata),		

		.axi_rresp(M_CDM_ADAPT_CTRL_REGS_rresp),		

		.axi_rready(M_CDM_ADAPT_CTRL_REGS_rready),		

		.axi_rvalid(M_CDM_ADAPT_CTRL_REGS_rvalid),		

		.axi_bresp(M_CDM_ADAPT_CTRL_REGS_bresp),		

		.axi_bready(M_CDM_ADAPT_CTRL_REGS_bready),		

		.axi_bvalid(M_CDM_ADAPT_CTRL_REGS_bvalid),
		
		.msgst_dbg0(32'h0),
		.msgst_dbg1(32'h0),
		.msgld_dbg0(32'h0),
		.msgld_dbg1(32'h0),
		.msgld_dbg2(32'h0),
		.m2st_dbg0(32'h0),
		.m2st_dbg1(32'h0),
		.m2st_dbg2(32'h0),
		.st2m_dbg0(32'h0),
		.st2m_dbg1(32'h0),
		.st2m_dbg2(32'h0),
		.st2m_dbg3(32'h0),
		.m2st_psx_pass_cnt(32'h0),
		.m2st_pci_pass_cnt(32'h0),
		.m2st_psx_fail_cnt(32'h0),
		.m2st_pci_fail_cnt(32'h0)

	);

	assign msgst_num_of_req = (msg_ctrl_reg_0[15:1]) | msgst_num_of_req_vio;
    assign msgld_num_of_req = (msg_ctrl_reg_0[31:17]) | msgld_num_of_req_vio ;
	assign msgst_num_of_CMD 	= msg_ctrl_reg_1[7:1];
	assign msgst_cmd_fill_bram 	= msg_ctrl_reg_1[8];
	assign msgld_num_of_CMD 	= msg_ctrl_reg_1[15:9];
	assign msgld_cmd_fill_bram 	= msg_ctrl_reg_1[16];
	assign msgst_infinite_pkt_run_start	= msg_ctrl_reg_1[31];
	assign msgld_infinite_pkt_run_start	= msg_ctrl_reg_1[30];
	assign msgst_use_same_cmd	= msg_ctrl_reg_1[29];
	assign msgld_use_same_cmd	= msg_ctrl_reg_1[28];
	assign num_of_NoC_cfg	=	psx_host_ctrl_reg[3:2];
	assign Noc_port_switch_req_cnt	=	psx_host_ctrl_reg[10:4];
	

msgst_engine CDM_adapter_msgst (

    .clk(fabric_clk),

//    .rst_n(fabric_rst_n & soft_rst_n[0]),
    .rst_n(fabric_rst_n),

    .pld_ram_din(MSGST_Payload_RAM_dinb),

    .pld_ram_wen(MSGST_Payload_RAM_web),

    .pld_ram_addr(MSGST_Payload_RAM_addrb),

    .cmd_ram_din(MSGST_CMD_RAM_doutb),

    .cmd_ram_ren(MSGST_CMD_RAM_enb),

    .cmd_ram_addr(MSGST_CMD_RAM_addrb),

    .pci_host_addr({pci0_msgst_host_addr_1,pci0_msgst_host_addr_0}),
	
	.pci_host_addr_mask({pci_msgst_host_addr_mask_1,pci_msgst_host_addr_mask_0}),

    .pci_pasid('d0),

    .pci_requester_id(pci0_host_reqid[15:0]),

    .psx_host_addr(({psx_msgst_host_addr_1,psx_msgst_host_addr_0}) | msgst_pcie0_host_addr_vio),
    
	.psx_host_addr_mask({psx_msgst_host_addr_mask_1,psx_msgst_host_addr_mask_0}),

    .psx_pasid('d0),

    .psx_requester_id(psx_host_reqid[15:0]),



    .num_of_reqs(msgst_num_of_req),

	.msgst_infinite_pkt_run_start(msgst_infinite_pkt_run_start),
	
	.msgst_use_same_cmd(msgst_use_same_cmd),

    .req_done(msgst_rsp_status[0]),



    .pld_cmd_req((msg_ctrl_reg_0[0] & psx_host_ctrl_reg[0]) || (msg_ctrl_reg_0[0] & pci0_host_ctrl_reg[0]) || msgst_pld_cmd_req_vio),



    //.fab0_cmpt_msgst(fab0_cmpt_msgst_fab_int)
    .fab0_cmpt_msgst(fab0_cmpt_msgst_fab_int_ac),
	.num_of_NoC_cfg (num_of_NoC_cfg),
	.Noc_port_switch_req_cnt(Noc_port_switch_req_cnt)

    );



msgld_engine CDM_adapter_msgld (

    .clk(fabric_clk),	

//    .rst_n(fabric_rst_n & soft_rst_n[0]),	
    .rst_n(fabric_rst_n),	

	.pld_ram_dout(MSGLD_Payload_RAM_dinb),	

    .pld_ram_wen(MSGLD_Payload_RAM_web),	

	.pld_ram_addr(MSGLD_Payload_RAM_addrb),	

    .rsp_ram_dout(MSG_Response_RAM_dinb),	

    .rsp_ram_wen(MSG_Response_RAM_web),	

    .rsp_ram_addr(MSG_Response_RAM_addrb),	

    .cmd_ram_din(MSGLD_CMD_RAM_doutb),	

    .cmd_ram_ren(MSGLD_CMD_RAM_enb),	

    .cmd_ram_addr(MSGLD_CMD_RAM_addrb),

    .pci_host_addr({pci0_msgld_host_addr_1,pci0_msgld_host_addr_0}),
	
    .pci_host_addr_mask({pci_msgld_host_addr_mask_1,pci_msgld_host_addr_mask_0}),

    .pci_pasid('d0),

    .pci_requester_id(pci0_host_reqid[15:0]),

    .psx_host_addr(({psx_msgld_host_addr_1,psx_msgld_host_addr_0}) | msgld_pcie0_host_addr_vio),
	
	.psx_host_addr_mask({psx_msgld_host_addr_mask_1,psx_msgld_host_addr_mask_0}),

    .psx_pasid('d0),

    .psx_requester_id(psx_host_reqid[15:0]),

    .num_of_reqs(msgld_num_of_req),
	
	.msgld_infinite_pkt_run_start(msgld_infinite_pkt_run_start),
	
	.msgld_use_same_cmd(msgld_use_same_cmd),

    .req_done(msgld_rsp_status[0]),	

	

    .cmd_rd_start((msg_ctrl_reg_0[16] & psx_host_ctrl_reg[0]) || (msg_ctrl_reg_0[16] & pci0_host_ctrl_reg[0]) || msgld_pld_cmd_rd_start_vio),

	

	.start_pkt_count(msg_ctrl_reg_1[0]),

	

	.pkt_pass_count(msgld_pass_counter_stats),

	

	.pkt_fail_count(msgld_fail_counter_stats),

	

	//.fab0_byp_out_msgld_dat(fab0_byp_out_msgld_dat_fab_int),	
	.fab0_byp_out_msgld_dat(fab0_byp_out_msgld_dat_fab_int_ac),	

	//.fab0_dsc_crd_msgld_req(fab0_dsc_crd_msgld_req_fab_int)
	.fab0_dsc_crd_msgld_req(fab0_dsc_crd_msgld_req_fab_int_ac),
	.num_of_NoC_cfg (num_of_NoC_cfg),
	.Noc_port_switch_req_cnt(Noc_port_switch_req_cnt)

); 

/*
// ST2M interface instantiation

st2m_engine CDM_adapter_st2m(

    .clk(fabric_clk),

    .rst_n(fabric_rst_n & soft_rst_n[0]),

    // Command Ram interface  

    .cmd_ram_din(cmd_ram_din),		 	// cmd ram data bus is 256 bit width

    .cmd_ram_ren(cmd_ram_ren),       	// RAM enable

    .cmd_ram_addr(cmd_ram_addr),	 	// 32 bit address bus

	.cmd_ram_web(cmd_ram_web),       	// Byte strobes

    // Control and status registers

	.st2m_ctrl_reg(st2m_ctrl_reg), 	 	// bit 0 - Start bit ; bit 31:1 number of back to back ST2M messages number 

	.st2m_ctrl_reg_1(st2m_ctrl_reg_1), 	 	// bit 0 - Start bit ; bit 31:1 number of back to back ST2M messages number 

    .st2m_rsp_status(st2m_rsp_status), 	// bit 0 - req_done; bit 1- all data sent    

    // ST2M CDM interface signals

    .fab0_c2h_st_byp_in_st2m_req(fab0_c2h_st_byp_in_st2m_req_int),  	// ST2M request interface

	.fab0_c2h_st_st2m_dat(fab0_c2h_st_st2m_dat_int)			// ST2M data interface

);

// M2ST interace instantiation



	 m2st_req_engine CDM_adapter_m2st(

    .clk(fabric_clk),

    .rst_n(fabric_rst_n & soft_rst_n[0]),

    .rsp_ram_dout(M2ST_RESP_RAM_dinb),

    .rsp_ram_wen(M2ST_RESP_RAM_enb),

	.rsp_ram_addr(M2ST_RESP_RAM_addrb),

    .M2ST_RESP_RAM_web(M2ST_RESP_RAM_web),

    .cmd_ram_din(M2ST_CMD_RAM_dinb),

    .cmd_ram_ren(M2ST_CMD_RAM_enb),

    .cmd_ram_addr(M2ST_CMD_RAM_addrb),

	.M2ST_CTRL_REG(m2st_ctrl_reg),

	.M2ST_CMD_ROLL_OVER(32'd32),

	.M2ST_RSP_STAT(m2st_rsp_status),

	.M2ST_RSP_PASS_CNT(m2st_pass_cnt),

	.M2ST_RSP_FAIL_CNT(m2st_fail_cnt),

    .fab0_h2c_st_byp_in_m2st_req(fab0_h2c_st_byp_in_m2st_req_int),

    .fab0_h2c_st_m2st_dat(fab0_h2c_st_m2st_dat_int),

    .fab0_rru_dst_crd(fab0_rru_dst_crd_int)	

	);*/

CDM_accumulator #(
  .TCQ         ( 1 )
) CDM_accumulator_inst (
  // Global
  .user_clk                          ( fabric_clk   ),
  .user_reset_n                      ( fabric_rst_n ),
  
  // Traffic Generator Side
  .fab0_cmpt_msgst_fab_int_tg        ( fab0_cmpt_msgst_fab_int_ac        ),
  .fab0_byp_out_msgld_dat_fab_int_tg ( fab0_byp_out_msgld_dat_fab_int_ac ),
  .fab0_dsc_crd_msgld_req_fab_int_tg ( fab0_dsc_crd_msgld_req_fab_int_ac ),
  
  // CPM5N Side
  .fab0_cmpt_msgst_fab_int           ( fab0_cmpt_msgst_fab_int_bp        ),
  .fab0_byp_out_msgld_dat_fab_int    ( fab0_byp_out_msgld_dat_fab_int_bp ),
  .fab0_dsc_crd_msgld_req_fab_int    ( fab0_dsc_crd_msgld_req_fab_int_bp )
);

CDM_throttle #(
  .SEED        ( 32'hb105f00d ),
  .TCQ         ( 1            )
) CDM_throttle_inst (
  // Global
  .user_clk                          ( fabric_clk    ),
  .user_reset_n                      ( fabric_rst_n  ),
  
  // Control
  .back_pres                         ( back_pres_vio ),
  .halt                              ( halt_vio      ),
  
  // Traffic Generator Side
  .fab0_cmpt_msgst_fab_int_tg        ( fab0_cmpt_msgst_fab_int_bp        ),
  .fab0_byp_out_msgld_dat_fab_int_tg ( fab0_byp_out_msgld_dat_fab_int_bp ),
  .fab0_dsc_crd_msgld_req_fab_int_tg ( fab0_dsc_crd_msgld_req_fab_int_bp ),
  
  // CPM5N Side
  .fab0_cmpt_msgst_fab_int           ( fab0_cmpt_msgst_fab_int_oe        ),
  .fab0_byp_out_msgld_dat_fab_int    ( fab0_byp_out_msgld_dat_fab_int_oe ),
  .fab0_dsc_crd_msgld_req_fab_int    ( fab0_dsc_crd_msgld_req_fab_int_oe )
);

CDM_order_enforcer #(
  .ADDR_WIDTH  ( 12 ), // Limit to 12 bits for timing easement and to match traffic gen settings
  .TCQ         ( 1  )
) CDM_order_enforcer_inst (
  // Global
  .user_clk                          ( fabric_clk   ),
  .user_reset_n                      ( fabric_rst_n ),
  
  // Control
  .en                                ( enforce_order_vio | pci0_host_ctrl_reg[1] ),
  .start                             ( enforce_order_vio | pci0_host_ctrl_reg[1] ),
  
  .pci0_msgst_host_addr_0            ( pci0_msgst_host_addr_0 ),
  .pci0_msgst_host_addr_1            ( pci0_msgst_host_addr_1 ),
  .pci0_msgld_host_addr_0            ( pci0_msgld_host_addr_0 ),
  .pci0_msgld_host_addr_1            ( pci0_msgld_host_addr_1 ),
  
  // Status
  .error                             ( order_error ),
  
  // Traffic Generator Side
  .fab0_cmpt_msgst_fab_int_tg        ( fab0_cmpt_msgst_fab_int_oe        ),
  .fab0_byp_out_msgld_dat_fab_int_tg ( fab0_byp_out_msgld_dat_fab_int_oe ),
  .fab0_dsc_crd_msgld_req_fab_int_tg ( fab0_dsc_crd_msgld_req_fab_int_oe ),
  
  // CPM5N Side
  .fab0_cmpt_msgst_fab_int           ( fab0_cmpt_msgst_fab_int           ),
  .fab0_byp_out_msgld_dat_fab_int    ( fab0_byp_out_msgld_dat_fab_int    ),
  .fab0_dsc_crd_msgld_req_fab_int    ( fab0_dsc_crd_msgld_req_fab_int    )
);
                         
endmodule



