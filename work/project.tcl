set projDir "D:/GitHub/50.002-ALU/work/vivado"
set projName "50.002 1D"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/GitHub/50.002-ALU/work/verilog/au_top_0.v" "D:/GitHub/50.002-ALU/work/verilog/reset_conditioner_1.v" "D:/GitHub/50.002-ALU/work/verilog/edge_detector_2.v" "D:/GitHub/50.002-ALU/work/verilog/button_conditioner_3.v" "D:/GitHub/50.002-ALU/work/verilog/autotester_4.v" "D:/GitHub/50.002-ALU/work/verilog/manualtester_5.v" "D:/GitHub/50.002-ALU/work/verilog/segtest_6.v" "D:/GitHub/50.002-ALU/work/verilog/multi_seven_seg_7.v" "D:/GitHub/50.002-ALU/work/verilog/eighteen_seven_seg_8.v" "D:/GitHub/50.002-ALU/work/verilog/game_9.v" "D:/GitHub/50.002-ALU/work/verilog/randgen_autotester_10.v" "D:/GitHub/50.002-ALU/work/verilog/pipeline_11.v" "D:/GitHub/50.002-ALU/work/verilog/alu_12.v" "D:/GitHub/50.002-ALU/work/verilog/counter_13.v" "D:/GitHub/50.002-ALU/work/verilog/edge_detector_14.v" "D:/GitHub/50.002-ALU/work/verilog/counter_15.v" "D:/GitHub/50.002-ALU/work/verilog/counter_16.v" "D:/GitHub/50.002-ALU/work/verilog/lut_17.v" "D:/GitHub/50.002-ALU/work/verilog/decoder_18.v" "D:/GitHub/50.002-ALU/work/verilog/counter_19.v" "D:/GitHub/50.002-ALU/work/verilog/decoder_20.v" "D:/GitHub/50.002-ALU/work/verilog/counter_21.v" "D:/GitHub/50.002-ALU/work/verilog/controlunit_22.v" "D:/GitHub/50.002-ALU/work/verilog/rand_gen_23.v" "D:/GitHub/50.002-ALU/work/verilog/add_sub16bit_24.v" "D:/GitHub/50.002-ALU/work/verilog/boolean_25.v" "D:/GitHub/50.002-ALU/work/verilog/shifter_26.v" "D:/GitHub/50.002-ALU/work/verilog/comparator_27.v" "D:/GitHub/50.002-ALU/work/verilog/regfile_28.v" "D:/GitHub/50.002-ALU/work/verilog/pn_gen_29.v" "D:/GitHub/50.002-ALU/work/verilog/counter_30.v" "D:/GitHub/50.002-ALU/work/verilog/adder1b_31.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/GitHub/50.002-ALU/constraint/override.xdc" "D:/GitHub/50.002-ALU/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
