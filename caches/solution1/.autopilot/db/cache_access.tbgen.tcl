set moduleName cache_access
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {cache_access}
set C_modelType { int 32 }
set C_modelArgList {
	{ address int 11 regular  }
	{ value_r int 32 regular  }
	{ action uint 1 regular  }
	{ mymem int 32 regular {array 2048 { 2 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "address", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "value_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "action", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "mymem", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ address sc_in sc_lv 11 signal 0 } 
	{ value_r sc_in sc_lv 32 signal 1 } 
	{ action sc_in sc_lv 1 signal 2 } 
	{ mymem_address0 sc_out sc_lv 11 signal 3 } 
	{ mymem_ce0 sc_out sc_logic 1 signal 3 } 
	{ mymem_we0 sc_out sc_logic 1 signal 3 } 
	{ mymem_d0 sc_out sc_lv 32 signal 3 } 
	{ mymem_q0 sc_in sc_lv 32 signal 3 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "address", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "address", "role": "default" }} , 
 	{ "name": "value_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "default" }} , 
 	{ "name": "action", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "action", "role": "default" }} , 
 	{ "name": "mymem_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "mymem", "role": "address0" }} , 
 	{ "name": "mymem_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mymem", "role": "ce0" }} , 
 	{ "name": "mymem_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mymem", "role": "we0" }} , 
 	{ "name": "mymem_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mymem", "role": "d0" }} , 
 	{ "name": "mymem_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mymem", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "7"],
		"CDFG" : "cache_access",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "142",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "address", "Type" : "None", "Direction" : "I"},
			{"Name" : "value_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "action", "Type" : "None", "Direction" : "I"},
			{"Name" : "mymem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_cache_access_Pipeline_VITIS_LOOP_24_11_fu_238", "Port" : "mymem", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "5", "SubInstance" : "grp_cache_access_Pipeline_VITIS_LOOP_24_1_fu_226", "Port" : "mymem", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "cache_tag", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "set_old_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "set_old_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "set_old_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "set_old_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cache_valid", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cache_dirty", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cache", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_cache_access_Pipeline_VITIS_LOOP_24_11_fu_238", "Port" : "cache", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "5", "SubInstance" : "grp_cache_access_Pipeline_VITIS_LOOP_24_1_fu_226", "Port" : "cache", "Inst_start_state" : "6", "Inst_end_state" : "7"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cache_tag_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cache_valid_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cache_dirty_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cache_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_cache_access_Pipeline_VITIS_LOOP_24_1_fu_226", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "cache_access_Pipeline_VITIS_LOOP_24_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln26_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "cache_tag_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "index", "Type" : "None", "Direction" : "I"},
			{"Name" : "mymem", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "cache", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_24_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cache_access_Pipeline_VITIS_LOOP_24_1_fu_226.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_cache_access_Pipeline_VITIS_LOOP_24_11_fu_238", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "cache_access_Pipeline_VITIS_LOOP_24_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln26_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "address_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "mymem", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cache", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_24_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cache_access_Pipeline_VITIS_LOOP_24_11_fu_238.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"}]}


set ArgLastReadFirstWriteLatency {
	cache_access {
		address {Type I LastRead 0 FirstWrite -1}
		value_r {Type I LastRead 1 FirstWrite -1}
		action {Type I LastRead 1 FirstWrite -1}
		mymem {Type IO LastRead 0 FirstWrite -1}
		cache_tag {Type IO LastRead -1 FirstWrite -1}
		set_old_3 {Type IO LastRead -1 FirstWrite -1}
		set_old_0 {Type IO LastRead -1 FirstWrite -1}
		set_old_1 {Type IO LastRead -1 FirstWrite -1}
		set_old_2 {Type IO LastRead -1 FirstWrite -1}
		cache_valid {Type IO LastRead -1 FirstWrite -1}
		cache_dirty {Type IO LastRead -1 FirstWrite -1}
		cache {Type IO LastRead -1 FirstWrite -1}}
	cache_access_Pipeline_VITIS_LOOP_24_1 {
		zext_ln26_3 {Type I LastRead 0 FirstWrite -1}
		cache_tag_load_2 {Type I LastRead 0 FirstWrite -1}
		index {Type I LastRead 0 FirstWrite -1}
		mymem {Type O LastRead -1 FirstWrite 1}
		cache {Type I LastRead 0 FirstWrite -1}}
	cache_access_Pipeline_VITIS_LOOP_24_11 {
		zext_ln26_3 {Type I LastRead 0 FirstWrite -1}
		address_1 {Type I LastRead 0 FirstWrite -1}
		mymem {Type I LastRead 0 FirstWrite -1}
		cache {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "142"}
	, {"Name" : "Interval", "Min" : "7", "Max" : "143"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	address { ap_none {  { address in_data 0 11 } } }
	value_r { ap_none {  { value_r in_data 0 32 } } }
	action { ap_none {  { action in_data 0 1 } } }
	mymem { ap_memory {  { mymem_address0 mem_address 1 11 }  { mymem_ce0 mem_ce 1 1 }  { mymem_we0 mem_we 1 1 }  { mymem_d0 mem_din 1 32 }  { mymem_q0 mem_dout 0 32 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
