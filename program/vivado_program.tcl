# Vivado Hardware Programming Script
# Usage: vivado -mode batch -source vivado_program.tcl

puts "Opening hardware manager..."
open_hw_manager

puts "Connecting to hardware server..."
connect_hw_server

puts "Getting available targets..."
set targets [get_hw_targets]
if {[llength $targets] == 0} {
    puts "ERROR: No hardware targets found!"
    exit 1
}

puts "Available targets: $targets"
puts "Opening first target..."
open_hw_target [lindex $targets 0]

puts "Getting hardware devices..."
set devices [get_hw_devices]
if {[llength $devices] == 0} {
    puts "ERROR: No hardware devices found!"
    exit 1
}

puts "Found devices: $devices"
set device [lindex $devices 0]
puts "Using device: $device"

puts "Setting bitstream file..."
set bitstream_file "../outputs/arty.bit"
if {![file exists $bitstream_file]} {
    puts "ERROR: Bitstream file not found: $bitstream_file"
    exit 1
}

set_property PROGRAM.FILE $bitstream_file $device

puts "Programming device..."
program_hw_devices $device

puts "Programming completed successfully!"
close_hw_manager
exit