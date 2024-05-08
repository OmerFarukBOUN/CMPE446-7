set moduleName cache_access_Pipeline_VITIS_LOOP_24_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {cache_access_Pipeline_VITIS_LOOP_24_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln26_3 int 9 regular  }
	{ cache_tag_load_2 int 3 regular  }
	{ index int 2 regular  }
	{ mymem int 32 regular {array 2048 { 0 3 } 0 1 }  }
	{ cache int 32 regular {array 512 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln26_3", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "cache_tag_load_2", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "index", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "mymem", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cache", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln26_3 sc_in sc_lv 9 signal 0 } 
	{ cache_tag_load_2 sc_in sc_lv 3 signal 1 } 
	{ index sc_in sc_lv 2 signal 2 } 
	{ mymem_address0 sc_out sc_lv 11 signal 3 } 
	{ mymem_ce0 sc_out sc_logic 1 signal 3 } 
	{ mymem_we0 sc_out sc_logic 1 signal 3 } 
	{ mymem_d0 sc_out sc_lv 32 signal 3 } 
	{ cache_address0 sc_out sc_lv 9 signal 4 } 
	{ cache_ce0 sc_out sc_logic 1 signal 4 } 
	{ cache_q0 sc_in sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln26_3", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln26_3", "role": "default" }} , 
 	{ "name": "cache_tag_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cache_tag_load_2", "role": "default" }} , 
 	{ "name": "index", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "index", "role": "default" }} , 
 	{ "name": "mymem_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "mymem", "role": "address0" }} , 
 	{ "name": "mymem_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mymem", "role": "ce0" }} , 
 	{ "name": "mymem_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mymem", "role": "we0" }} , 
 	{ "name": "mymem_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mymem", "role": "d0" }} , 
 	{ "name": "cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "cache", "role": "address0" }} , 
 	{ "name": "cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cache", "role": "ce0" }} , 
 	{ "name": "cache_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cache", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	cache_access_Pipeline_VITIS_LOOP_24_1 {
		zext_ln26_3 {Type I LastRead 0 FirstWrite -1}
		cache_tag_load_2 {Type I LastRead 0 FirstWrite -1}
		index {Type I LastRead 0 FirstWrite -1}
		mymem {Type O LastRead -1 FirstWrite 1}
		cache {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "66", "Max" : "66"}
	, {"Name" : "Interval", "Min" : "66", "Max" : "66"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln26_3 { ap_none {  { zext_ln26_3 in_data 0 9 } } }
	cache_tag_load_2 { ap_none {  { cache_tag_load_2 in_data 0 3 } } }
	index { ap_none {  { index in_data 0 2 } } }
	mymem { ap_memory {  { mymem_address0 mem_address 1 11 }  { mymem_ce0 mem_ce 1 1 }  { mymem_we0 mem_we 1 1 }  { mymem_d0 mem_din 1 32 } } }
	cache { ap_memory {  { cache_address0 mem_address 1 9 }  { cache_ce0 mem_ce 1 1 }  { cache_q0 in_data 0 32 } } }
}
