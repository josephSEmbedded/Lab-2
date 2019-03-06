#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Tue Mar 05 19:38:16 EST 2019
# SW Build 2258646 on Thu Jun 14 20:02:38 MDT 2018
#
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep xelab -wto 698889f8be724a1cab6e7ffd89f77f3b --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot ripple_adder_behav xil_defaultlib.ripple_adder -log elaborate.log
