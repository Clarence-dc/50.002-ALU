set projDir "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/vivado"
set projName "50.002 1D"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/au_top_0.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/reset_conditioner_1.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/edge_detector_2.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/button_conditioner_3.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/multi_seven_seg_4.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/add_sub16bit_5.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/boolean_6.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/shifter_7.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/comparator_8.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/pipeline_9.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/counter_10.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/lut_11.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/decoder_12.v" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/verilog/adder1b_13.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/constraint/alchitry.xdc" "D:/SUTD/Term\ 4/50.002\ Computation\ Structures/1D/50.002\ 1D/work/constraint/io.xdc" "D:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
