set projDir "D:/Users/arissa/Desktop/50.002/MHP\ FPGA\ V3/work/vivado"
set projName "MHP FPGA V3"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Users/arissa/Desktop/50.002/MHP\ FPGA\ V3/work/verilog/au_top_0.v" "D:/Users/arissa/Desktop/50.002/MHP\ FPGA\ V3/work/verilog/reset_conditioner_1.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Users/arissa/Desktop/50.002/MHP\ FPGA\ V3/work/constraint/custom.xdc" "D:/Users/arissa/Desktop/50.002/MHP\ FPGA\ V3/constraint/alchitry_custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
