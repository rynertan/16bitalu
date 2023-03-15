set projDir "C:/Users/ryner/onedrivefuck/Documents/myGame/work/vivado"
set projName "myGame"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/au_top_0.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/button_conditioner_1.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/edge_detector_2.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/alufsm_3.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/auto_test_4.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/reset_conditioner_5.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/pipeline_6.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/alu_7.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/adder_8.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/boolean_9.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/shifter_10.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/compare_11.v" "C:/Users/ryner/onedrivefuck/Documents/myGame/work/verilog/multiply_12.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/ryner/onedrivefuck/Documents/myGame/work/constraint/custom.xdc" "C:/Users/ryner/onedrivefuck/Documents/myGame/constraint/custom_au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
