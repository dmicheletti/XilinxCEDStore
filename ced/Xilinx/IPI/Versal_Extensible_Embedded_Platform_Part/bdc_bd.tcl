# ########################################################################
# Copyright (C) 2023, Advanced Micro Devices Inc - All rights reserved

# Licensed under the Apache License, Version 2.0 (the "License"). You may
# not use this file except in compliance with the License. A copy of the
# License is located at

 # http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
# ########################################################################

create_bd_design "ext_bdc"

  # Create interface ports
  set M00_INI_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:inimm_rtl:1.0 M00_INI_0 ]
  set_property -dict [ list \
   CONFIG.COMPUTED_STRATEGY {load} \
   CONFIG.INI_STRATEGY {load} \
   ] $M00_INI_0

if { $use_lpddr } {
  set M00_INI_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:inimm_rtl:1.0 M00_INI_1 ]
  set_property -dict [ list \
   CONFIG.COMPUTED_STRATEGY {load} \
   CONFIG.INI_STRATEGY {load} \
   ] $M00_INI_1
	}

  set S00_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {44} \
   CONFIG.ARUSER_WIDTH {16} \
   CONFIG.AWUSER_WIDTH {16} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {16} \
   CONFIG.MAX_BURST_LENGTH {256} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $S00_AXI
set_property APERTURES {0xA400_0000  448M} [get_bd_intf_ports /S00_AXI]

  # Create ports
  set clk_in1 [ create_bd_port -dir I -type clk clk_in1 ]
  set_property CONFIG.FREQ_TOLERANCE_HZ 1 [get_bd_ports /clk_in1]
  #set_property -dict [ list CONFIG.CLK_DOMAIN {bd_5156_pspmc_0_0_pl0_ref_clk} ] $clk_in1
  set irq [ create_bd_port -dir O -type intr irq ]
  set resetn [ create_bd_port -dir I -type rst resetn ]

if { $use_aie } {
  set S00_INI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:inimm_rtl:1.0 S00_INI ]
  set_property -dict [ list \
   CONFIG.COMPUTED_STRATEGY {load} \
   CONFIG.INI_STRATEGY {load} \
   ] $S00_INI
   
  # Create instance: ConfigNoc, and set properties
  set ConfigNoc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc ConfigNoc ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {1} \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_NSI {1} \
    CONFIG.NUM_SI {0} \
  ] $ConfigNoc


  set_property -dict [ list \
   CONFIG.CATEGORY {aie} \
 ] [get_bd_intf_pins /ConfigNoc/M00_AXI]

  set_property -dict [ list \
   CONFIG.INI_STRATEGY {load} \
   CONFIG.CONNECTIONS {M00_AXI {read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
 ] [get_bd_intf_pins /ConfigNoc/S00_INI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M00_AXI} \
 ] [get_bd_pins /ConfigNoc/aclk0]

  # Create instance: ai_engine_0, and set properties
  set ai_engine_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ai_engine ai_engine_0 ]
  set_property -dict [list \
    CONFIG.CLK_NAMES {} \
    CONFIG.NAME_MI_AXI {} \
    CONFIG.NAME_MI_AXIS {} \
    CONFIG.NAME_SI_AXI {S00_AXI,} \
    CONFIG.NAME_SI_AXIS {} \
    CONFIG.NUM_CLKS {0} \
    CONFIG.NUM_MI_AXI {0} \
    CONFIG.NUM_MI_AXIS {0} \
    CONFIG.NUM_SI_AXI {1} \
    CONFIG.NUM_SI_AXIS {0} \
  ] $ai_engine_0


  set_property -dict [ list \
   CONFIG.CATEGORY {NOC} \
 ] [get_bd_intf_pins /ai_engine_0/S00_AXI]
 
   connect_bd_intf_net -intf_net ConfigNoc_M00_AXI [get_bd_intf_pins ConfigNoc/M00_AXI] [get_bd_intf_pins ai_engine_0/S00_AXI]
   connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins ConfigNoc/S00_INI] [get_bd_intf_ports S00_INI]
   connect_bd_net -net ai_engine_0_s00_axi_aclk [get_bd_pins ai_engine_0/s00_axi_aclk] [get_bd_pins ConfigNoc/aclk0]
 }

  # Create instance: axi_noc_0, and set properties
  set axi_noc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc axi_noc_0 ]
  set_property -dict [list \
    CONFIG.NUM_MI {0} \
    CONFIG.NUM_NMI {1} \
    CONFIG.NUM_NSI {0} \
    CONFIG.NUM_SI {1} \
  ] $axi_noc_0

  set_property -dict [ list \
   CONFIG.INI_STRATEGY {load} \
 ] [get_bd_intf_pins /axi_noc_0/M00_INI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI {read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S00_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk0]

	if { $use_lpddr } {
  # Create instance: axi_noc_1, and set properties
  set axi_noc_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc axi_noc_1 ]
  set_property -dict [list \
    CONFIG.NUM_MI {0} \
    CONFIG.NUM_NMI {1} \
    CONFIG.NUM_NSI {0} \
    CONFIG.NUM_SI {1} \
  ] $axi_noc_1

  set_property -dict [ list \
   CONFIG.INI_STRATEGY {load} \
 ] [get_bd_intf_pins /axi_noc_1/M00_INI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI {read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S00_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI} \
 ] [get_bd_pins /axi_noc_1/aclk0]

}

	set use_intc_15 [set use_intc_32 [set use_cascaded_irqs [set no_irqs ""]]]

	set use_intc_15 [ expr $irqs eq "15" ]
	set use_intc_32 [ expr $irqs eq "32" ]
	set use_cascaded_irqs [ expr $irqs eq "63" ]
	set no_irqs [ expr $irqs eq "0" ]

	if {$irqs eq "15"} {
		# Create instance: axi_intc_0, and set properties
		set axi_intc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc axi_intc_0 ]
		set_property -dict [ list CONFIG.C_ASYNC_INTR {0xFFFFFFFF} CONFIG.C_IRQ_CONNECTION {1} ] $axi_intc_0	
	}

	if {$irqs eq "32"} {

		# Create instance: axi_intc_0, and set properties
		set axi_intc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc axi_intc_0 ]
		set_property -dict [ list CONFIG.C_ASYNC_INTR {0xFFFFFFFF} CONFIG.C_IRQ_CONNECTION {1} ] $axi_intc_0
		}

	if { $irqs eq "63" } {
		# Create instance: axi_intc_cascaded_1, and set properties
		set axi_intc_cascaded_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc axi_intc_cascaded_1 ]
		#set_property -dict [ list CONFIG.C_IRQ_CONNECTION {1} CONFIG.C_ASYNC_INTR  {0xFFFFFFFF} ] $axi_intc_cascaded_1
	  
		# Create instance: axi_intc_parent, and set properties
		set axi_intc_parent [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc axi_intc_parent ]
		#set_property -dict [ list CONFIG.C_IRQ_CONNECTION {1} CONFIG.C_ASYNC_INTR  {0xFFFFFFFF} ] $axi_intc_parent
		
		# Create instance: xlconcat_0, and set properties
		create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:* xlconcat_0
		set_property -dict [list CONFIG.NUM_PORTS {32} CONFIG.IN0_WIDTH {1}] [get_bd_cells xlconcat_0]
		
		# Create instance: xlconcat_1, and set properties
		#create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:* xlconcat_1
		#set_property -dict [list CONFIG.NUM_PORTS {32} CONFIG.IN0_WIDTH {1}] [get_bd_cells xlconcat_1]
	}

	# Clocks options, and set properties
	set clk_freqs [ list 156.250000 104.166666 312.500000 100.000 100.000 100.000 100.000 ]
	set clk_used [list true false false false false false false ]
	set clk_ports [list clk_out1 clk_out2 clk_out3 clk_out4 clk_out5 clk_out6 clk_out7 ]
	set default_clk_port clk_out1
	set default_clk_num 0

	set i 0
	set clocks {}

	foreach { port freq id is_default } $clk_options {

		lset clk_ports $i $port
		lset clk_freqs $i $freq
		lset clk_used $i true
		
		if { $is_default } {
			set default_clk_port $port
			set default_clk_num $i
		}
		
		dict append clocks clk_out$i { id $id is_default $is_default proc_sys_reset "proc_sys_reset$i" status "fixed" }
		incr i
		
	}

	set num_clks $i

	# Create instance: clk_wizard_0, and set properties
	
	set clk_wizard_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wizard clk_wizard_0 ]
	set_property -dict [ list \
		CONFIG.CLKOUT_DRIVES {BUFG,BUFG,BUFG,BUFG,BUFG,BUFG,BUFG} \
		CONFIG.CLKOUT_DYN_PS {None,None,None,None,None,None,None} \
		CONFIG.CLKOUT_MATCHED_ROUTING {false,false,false,false,false,false,false} \
		CONFIG.CLKOUT_PORT [join $clk_ports ","] \
		CONFIG.CLKOUT_REQUESTED_DUTY_CYCLE {50.000,50.000,50.000,50.000,50.000,50.000,50.000} \
		CONFIG.CLKOUT_REQUESTED_OUT_FREQUENCY [join $clk_freqs ","] \
		CONFIG.CLKOUT_REQUESTED_PHASE {0.000,0.000,0.000,0.000,0.000,0.000,0.000} \
		CONFIG.CLKOUT_USED [join $clk_used "," ]\
		CONFIG.JITTER_SEL {Min_O_Jitter} \
		CONFIG.RESET_TYPE {ACTIVE_LOW} \
		CONFIG.USE_LOCKED {true} \
		CONFIG.USE_PHASE_ALIGNMENT {true} \
		CONFIG.USE_RESET {true} \
	] $clk_wizard_0
	set_property -dict [list CONFIG.PRIM_SOURCE {No_buffer}] [get_bd_cells clk_wizard_0]

	# Create instance: proc_sys_reset_N, and set properties
	for {set i 0} {$i < $num_clks} {incr i} {
		set proc_sys_reset_$i [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset proc_sys_reset_$i ]
	}

	connect_bd_net -net pl_clk0 [get_bd_ports clk_in1] [get_bd_pins clk_wizard_0/clk_in1]
	connect_bd_net -net pl_resetn1 [get_bd_ports resetn] [get_bd_pins clk_wizard_0/resetn]

	for {set i 0} {$i < $num_clks} {incr i} {
		connect_bd_net -net pl_resetn1 [get_bd_pins proc_sys_reset_$i/ext_reset_in]
	}
	   
	# Create instance: icn_ctrl, and set properties
	set icn_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect icn_ctrl ]
	
	set default_clock_net clk_wizard_0_$default_clk_port
	#connect_bd_net -net $default_clock_net [get_bd_pins cips_noc/aclk0] [get_bd_pins icn_ctrl/aclk] 
 
	if { $use_intc_15 } {
	
		# Using only 1 smartconnect to accomodate 15 AXI_Masters 
		set num_masters 1

		set_property -dict [ list CONFIG.NUM_CLKS {2} CONFIG.NUM_MI $num_masters CONFIG.NUM_SI {1} ] $icn_ctrl

	} else {
	
		# Adding multiple Smartconnects and dummy AXI_VIP to accomodate 32 or 63 AXI_Masters selected
		set num_masters [ expr "$use_cascaded_irqs ? 6 : 3" ]
		set num_kernal [ expr "$use_cascaded_irqs ? 4 : 2" ]
		set m_incr [ expr "$use_cascaded_irqs ? 2 : 1" ]

		set_property -dict [ list CONFIG.NUM_CLKS {2} CONFIG.NUM_MI $num_masters CONFIG.NUM_SI {1} ] $icn_ctrl 
	  
		for {set i 0} {$i < $num_kernal} {incr i} {
			set to_delete_kernel_ctrl_$i [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip to_delete_kernel_ctrl_$i ]
			set_property -dict [ list CONFIG.INTERFACE_MODE {SLAVE} ] [get_bd_cells to_delete_kernel_ctrl_$i]
			set icn_ctrl_$i [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect icn_ctrl_$i ]
			set_property -dict [ list CONFIG.NUM_CLKS {1} CONFIG.NUM_MI {1} CONFIG.NUM_SI {1} ] [get_bd_cells icn_ctrl_$i]
			set m [expr $i+$m_incr]
			connect_bd_intf_net [get_bd_intf_pins icn_ctrl/M0${m}_AXI] [get_bd_intf_pins icn_ctrl_$i/S00_AXI]
			connect_bd_intf_net [get_bd_intf_pins to_delete_kernel_ctrl_$i/S_AXI] [get_bd_intf_pins icn_ctrl_$i/M00_AXI]
			connect_bd_net -net proc_sys_reset_${default_clk_num}_peripheral_aresetn [get_bd_pins to_delete_kernel_ctrl_$i/aresetn]
			connect_bd_net -net proc_sys_reset_${default_clk_num}_peripheral_aresetn [get_bd_pins icn_ctrl_$i/aresetn]
			connect_bd_net -net $default_clock_net [get_bd_pins icn_ctrl_$i/aclk]
			connect_bd_net -net $default_clock_net [get_bd_pins to_delete_kernel_ctrl_$i/aclk]
		} 
	}

	# connect_bd_net -net $default_clock_net [get_bd_pins axi_noc_0/aclk0]
	# connect_bd_net -net $default_clock_net [get_bd_pins axi_noc_1/aclk0]
	connect_bd_net -net $default_clock_net [get_bd_pins icn_ctrl/aclk1]
	connect_bd_net [get_bd_ports clk_in1] [get_bd_pins axi_noc_0/aclk0]
	connect_bd_net [get_bd_ports clk_in1] [get_bd_pins icn_ctrl/aclk]
	if { $use_lpddr } {
	connect_bd_net [get_bd_ports clk_in1] [get_bd_pins axi_noc_1/aclk0] }

for {set i 0} {$i < $num_clks} {incr i} {
		set port [lindex $clk_ports $i]
		connect_bd_net -net clk_wizard_0_$port [get_bd_pins clk_wizard_0/$port] [get_bd_pins proc_sys_reset_$i/slowest_sync_clk]
	}

	connect_bd_net -net clk_wizard_0_locked [get_bd_pins clk_wizard_0/locked]

	for {set i 0} {$i < $num_clks} {incr i} {
		connect_bd_net -net clk_wizard_0_locked [get_bd_pins proc_sys_reset_$i/dcm_locked] 
	}

	connect_bd_net -net proc_sys_reset_${default_clk_num}_peripheral_aresetn [get_bd_pins proc_sys_reset_${default_clk_num}/peripheral_aresetn] [get_bd_pins icn_ctrl/aresetn] 
	  
	  
	if { $irqs eq "15" } {
	set_property -dict [list CONFIG.NUM_MI {1}] [get_bd_cells icn_ctrl]
	connect_bd_intf_net -intf_net icn_ctrl_M00_AXI [get_bd_intf_pins axi_intc_0/s_axi] [get_bd_intf_pins icn_ctrl/M00_AXI]
	#connect_bd_net -net axi_intc_0_irq [get_bd_pins CIPS_0/pl_ps_irq0] [get_bd_pins axi_intc_0/irq]
	connect_bd_net [get_bd_ports irq] [get_bd_pins axi_intc_0/irq]
	connect_bd_net -net $default_clock_net [get_bd_pins axi_intc_0/s_axi_aclk]
	connect_bd_net -net proc_sys_reset_${default_clk_num}_peripheral_aresetn [get_bd_pins axi_intc_0/s_axi_aresetn]
	}
	  
	  
	if { $irqs eq "32" } {
		set_property -dict [list CONFIG.NUM_MI {3}] [get_bd_cells icn_ctrl]
		connect_bd_intf_net -intf_net icn_ctrl_M00_AXI [get_bd_intf_pins axi_intc_0/s_axi] [get_bd_intf_pins icn_ctrl/M00_AXI]
		#connect_bd_net -net axi_intc_0_irq [get_bd_pins CIPS_0/pl_ps_irq0] [get_bd_pins axi_intc_0/irq]
		connect_bd_net [get_bd_ports irq] [get_bd_pins axi_intc_0/irq]
		connect_bd_net -net $default_clock_net [get_bd_pins axi_intc_0/s_axi_aclk]
		connect_bd_net -net proc_sys_reset_${default_clk_num}_peripheral_aresetn [get_bd_pins axi_intc_0/s_axi_aresetn]
	}
	  
	if { $irqs eq "63" } {
		connect_bd_intf_net -intf_net icn_ctrl_M00_AXI [get_bd_intf_pins axi_intc_cascaded_1/s_axi] [get_bd_intf_pins icn_ctrl/M00_AXI]
		connect_bd_intf_net -intf_net icn_ctrl_M01_AXI [get_bd_intf_pins axi_intc_parent/s_axi] [get_bd_intf_pins icn_ctrl/M01_AXI]
		connect_bd_net [get_bd_pins axi_intc_cascaded_1/irq] [get_bd_pins xlconcat_0/In31]
		connect_bd_net [get_bd_pins axi_intc_parent/intr] [get_bd_pins xlconcat_0/dout]
		#connect_bd_net [get_bd_pins axi_intc_cascaded_1/intr] [get_bd_pins xlconcat_1/dout]
		#connect_bd_net -net axi_intc_0_irq [get_bd_pins CIPS_0/pl_ps_irq0] [get_bd_pins axi_intc_parent/irq]
		connect_bd_net [get_bd_ports irq] [get_bd_pins axi_intc_parent/irq]
		connect_bd_net -net $default_clock_net [get_bd_pins axi_intc_cascaded_1/s_axi_aclk]
		connect_bd_net -net $default_clock_net [get_bd_pins axi_intc_parent/s_axi_aclk]
		connect_bd_net -net proc_sys_reset_${default_clk_num}_peripheral_aresetn [get_bd_pins axi_intc_cascaded_1/s_axi_aresetn]
		connect_bd_net -net proc_sys_reset_${default_clk_num}_peripheral_aresetn [get_bd_pins axi_intc_parent/s_axi_aresetn]
	}

  # Create interface connections
  connect_bd_intf_net [get_bd_intf_ports M00_INI_0] [get_bd_intf_pins axi_noc_0/M00_INI]
  connect_bd_intf_net [get_bd_intf_ports S00_AXI] [get_bd_intf_pins icn_ctrl/S00_AXI]
  
  if { $use_lpddr } {
  connect_bd_intf_net [get_bd_intf_ports M00_INI_1] [get_bd_intf_pins axi_noc_1/M00_INI] }

  
  	if { ! $use_intc_15 } {
		group_bd_cells axi_smc_vip_hier [get_bd_cells to_delete_kernel_ctrl_*] [get_bd_cells icn_ctrl] [get_bd_cells icn_ctrl_*]  
	}


  # Create address segments
  assign_bd_address
  # assign_bd_address -offset 0xA4040000 -range 0x00010000 -target_address_space [get_bd_addr_spaces S00_AXI] [get_bd_addr_segs axi_intc_cascaded_1/S_AXI/Reg] -force
  # assign_bd_address -offset 0xA4050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces S00_AXI] [get_bd_addr_segs axi_intc_parent/S_AXI/Reg] -force
  # assign_bd_address -offset 0xA4000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces S00_AXI] [get_bd_addr_segs to_delete_kernel_ctrl_0/S_AXI/Reg] -force
  # assign_bd_address -offset 0xA4010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces S00_AXI] [get_bd_addr_segs to_delete_kernel_ctrl_1/S_AXI/Reg] -force
  # assign_bd_address -offset 0xA4020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces S00_AXI] [get_bd_addr_segs to_delete_kernel_ctrl_2/S_AXI/Reg] -force
  # assign_bd_address -offset 0xA4030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces S00_AXI] [get_bd_addr_segs to_delete_kernel_ctrl_3/S_AXI/Reg] -force
  # if { $use_aie } {
  # assign_bd_address -offset 0x020000000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces S00_INI] [get_bd_addr_segs ai_engine_0/S00_AXI/AIE_ARRAY_0] -force }

if { $irqs eq "15" } {
#assign_bd_address
set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_axi_intc_0_Reg}]
}

if { $irqs eq "32" } {
#set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_to_delete_kernel_ctrl_1_Reg}]
#set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_to_delete_kernel_ctrl_0_Reg}]
set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_axi_intc_0_Reg}]
catch {
exclude_bd_addr_seg [get_bd_addr_segs to_delete_kernel/S_AXI/Reg] -target_address_space [get_bd_addr_spaces S00_AXI]
exclude_bd_addr_seg [get_bd_addr_segs to_delete_kernel_ctrl_0/S_AXI/Reg] -target_address_space [get_bd_addr_spaces S00_AXI]
exclude_bd_addr_seg [get_bd_addr_segs to_delete_kernel_ctrl_1/S_AXI/Reg] -target_address_space [get_bd_addr_spaces S00_AXI]
} }
	
if { $irqs eq "63" } {
set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_axi_intc_cascaded_1_Reg}]
set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_axi_intc_parent_Reg}]
#set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_to_delete_kernel_ctrl_0_Reg}]
#set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_to_delete_kernel_ctrl_1_Reg}]
#set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_to_delete_kernel_ctrl_2_Reg}]
#set_property locktype global [get_bd_addr_segs {S00_AXI/SEG_to_delete_kernel_ctrl_3_Reg}]
catch {
exclude_bd_addr_seg [get_bd_addr_segs to_delete_kernel_ctrl_0/S_AXI/Reg] -target_address_space [get_bd_addr_spaces S00_AXI]
exclude_bd_addr_seg [get_bd_addr_segs to_delete_kernel_ctrl_1/S_AXI/Reg] -target_address_space [get_bd_addr_spaces S00_AXI]
exclude_bd_addr_seg [get_bd_addr_segs to_delete_kernel_ctrl_2/S_AXI/Reg] -target_address_space [get_bd_addr_spaces S00_AXI]
exclude_bd_addr_seg [get_bd_addr_segs to_delete_kernel_ctrl_3/S_AXI/Reg] -target_address_space [get_bd_addr_spaces S00_AXI]
} }

if { $use_aie } {
set_property locktype global [get_bd_addr_segs {S00_INI/SEG_ai_engine_0_AIE_ARRAY_0}] }

 validate_bd_design
 save_bd_design


