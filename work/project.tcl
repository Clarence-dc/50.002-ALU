set projDir "D:/GitHub/50.002-ALU/work/vivado"
set projName "50.002 1D"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/GitHub/50.002-ALU/work/verilog/au_top_0.v" "D:/GitHub/50.002-ALU/work/verilog/reset_conditioner_1.v" "D:/GitHub/50.002-ALU/work/verilog/edge_detector_2.v" "D:/GitHub/50.002-ALU/work/verilog/button_conditioner_3.v" "D:/GitHub/50.002-ALU/work/verilog/multi_seven_seg_4.v" "D:/GitHub/50.002-ALU/work/verilog/add_sub16bit_5.v" "D:/GitHub/50.002-ALU/work/verilog/boolean_6.v" "D:/GitHub/50.002-ALU/work/verilog/shifter_7.v" "D:/GitHub/50.002-ALU/work/verilog/comparator_8.v" "D:/GitHub/50.002-ALU/work/verilog/pipeline_9.v" "D:/GitHub/50.002-ALU/work/verilog/counter_10.v" "D:/GitHub/50.002-ALU/work/verilog/lut_11.v" "D:/GitHub/50.002-ALU/work/verilog/decoder_12.v" "D:/GitHub/50.002-ALU/work/verilog/adder1b_13.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/GitHub/50.002-ALU/work/constraint/alchitry.xdc" "D:/GitHub/50.002-ALU/work/constraint/io.xdc" "D:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
