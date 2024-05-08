set SynModuleInfo {
  {SRCNAME cache_access_Pipeline_VITIS_LOOP_24_1 MODELNAME cache_access_Pipeline_VITIS_LOOP_24_1 RTLNAME cache_access_cache_access_Pipeline_VITIS_LOOP_24_1
    SUBMODULES {
      {MODELNAME cache_access_flow_control_loop_pipe_sequential_init RTLNAME cache_access_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME cache_access_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME cache_access_Pipeline_VITIS_LOOP_24_11 MODELNAME cache_access_Pipeline_VITIS_LOOP_24_11 RTLNAME cache_access_cache_access_Pipeline_VITIS_LOOP_24_11}
  {SRCNAME cache_access MODELNAME cache_access RTLNAME cache_access IS_TOP 1
    SUBMODULES {
      {MODELNAME cache_access_cache_tag_RAM_AUTO_1R1W RTLNAME cache_access_cache_tag_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cache_access_cache_valid_RAM_AUTO_1R1W RTLNAME cache_access_cache_valid_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cache_access_cache_RAM_AUTO_1R1W RTLNAME cache_access_cache_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
