#!/bin/bash
#
# File: run_dds_phase_acc_tb.sh
# Date: 2016-03-25
# Author: Andreas Mueller
#
# Description: Run simulation of the dds_phase_acc module testbench using iverilog.
#

SIMULATOR="iverilog"
PROJECT_DIR=../../..

RTL_DIR="${PROJECT_DIR}/rtl"
SIM_DIR="${PROJECT_DIR}/sim/${SIMULATOR}"
SIM_OUT_DIR="${SIM_DIR}/out"
SIM_RUN_DIR="${SIM_DIR}/run"
SIM_TMP_DIR="${SIM_DIR}/tmp"
TEST_DIR="${PROJECT_DIR}/test"
TEST_BENCH_DIR="${TEST_DIR}/bench"
TEST_SRC_DIR="${TEST_DIR}/src"

TOP_MODULE_NAME="dds_phase_acc"
TOP_MODULE_FILE="${RTL_DIR}/${TOP_MODULE_NAME}.v"
TEST_BENCH_NAME="dds_phase_acc_tb"
TEST_BENCH_FILE="${TEST_BENCH_DIR}/${TEST_BENCH_NAME}.v"

RTL_FILES="${TOP_MODULE_FILE}" #`find "${RTL_DIR}" -name *.[vV] -o -name *.[vV][hH]`
TEST_SRC_FILES=`find "${TEST_SRC_DIR}" -name *.[vV] -o -name *.[vV][hH]`

# Uncomment the following lines for debugging.
#set -o verbose
#echo "${RTL_FILES}"
#echo "${TEST_FILES}"

iverilog \
  -g2005 \
  -o "${SIM_OUT_DIR}/${TEST_BENCH_NAME}.o" \
  "${RTL_FILES}" "${TEST_SRC_FILES}" "${TEST_BENCH_FILE}"

vvp "${SIM_OUT_DIR}/${TEST_BENCH_NAME}.o"

mv "${SIM_RUN_DIR}/${TEST_BENCH_NAME}.vcd" "${SIM_OUT_DIR}/"

gtkwave "${SIM_OUT_DIR}/${TEST_BENCH_NAME}.vcd" "${SIM_RUN_DIR}/gtkwave/${TEST_BENCH_NAME}.gtkw" &
