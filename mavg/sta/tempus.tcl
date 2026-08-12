read_lib /opt/skywater/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__ss_100C_1v60.lib

read_verilog ../syn/outputs/mavg_netlist.v
set_top_module mavg

read_sdc ../syn/outputs/mavg_constraints.sdc
read_sdf ../syn/outputs/mavg_delays.sdf

report_timing -late -max_paths 100 -max_slack 0 > late.rpt
report_timing -early -max_paths 100 -max_slack 0 > early.rpt

report_timing  -from [all_inputs] -to [all_outputs] -max_paths 12 -path_type summary  > allpaths.rpt
report_timing  -from [all_inputs] -to [all_registers] -max_paths 12 -path_type summary  >> allpaths.rpt
report_timing  -from [all_registers] -to [all_registers] -max_paths 12 -path_type summary >> allpaths.rpt
report_timing  -from [all_registers] -to [all_outputs] -max_paths 12 -path_type summary >> allpaths.rpt
exit
