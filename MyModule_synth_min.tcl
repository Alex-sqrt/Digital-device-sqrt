## Setup technology files
include ../Source/X-FAB_min.tcl
##include X-FAB_min.tcl
## Setup variables
set DESIGN Sqrt2
set PARAMS {}
## Read in Verilog HDL files
# Top module
read_hdl -v2001 ../Source/Sqrt2.v
## Compile our code (create a technology-independent schematic)
elaborate -parameters $PARAMS $DESIGN
## Setup design constraints
read_sdc ../Source/Sqrt2.sdc
## Synthesize our schematic (create a technology-dependent schematic)
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental

## Write out area and timing reports
report area > ../Reports/Sqrt2_synth_area_report_min
report timing > ../Reports/Sqrt2_synth_timing_report_min
## Write out synthesized Verilog netlist
##write_hdl -mapped > ../Source/Synthesis/Sqrt2_synth_min.v
## Write out the SDC file we will take into the place n route tool
##write_sdc > ../Source/Synthesis/Sqrt2_out_min.sdc
gui_show

