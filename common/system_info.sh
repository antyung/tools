#!/bin/sh

SYSTEM_ARCH=$(uname -m)
SYSTEM_KERNEL=$(uname -r)
SYSTEM_OS=$(uname -s)
SYSTEM_CPU_CORES=$(grep -c ^core /proc/cpuinfo)
SYSTEM_CPU_PROC=$(nproc)
SYSTEM_CPU_THREADS=$(grep -c ^processor /proc/cpuinfo)
SYSTEM_CPU_MODEL=$(grep 'model name' /proc/cpuinfo | uniq | awk -F: '{print $2}')
SYSTEM_MEMORY_TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}')
SYSTEM_MEMORY_FREE=$(grep MemFree /proc/meminfo | awk '{print $2}')
SYSTEM_MEMORY_BUFFERS=$(grep Buffers /proc/meminfo | awk '{print $2}')
SYSTEM_SWAP_TOTAL=$(grep SwapTotal /proc/meminfo | awk '{print $2}')
SYSTEM_SWAP_FREE=$(grep SwapFree /proc/meminfo | awk '{print $2}')
SYSTEM_DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
SYSTEM_DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
SYSTEM_DISK_USED=$(df -h / | awk 'NR==2 {print $3}')

export SYSTEM_ARCH
export SYSTEM_KERNEL
export SYSTEM_OS
export SYSTEM_CPU_CORES
export SYSTEM_CPU_PROC
export SYSTEM_CPU_THREADS
export SYSTEM_CPU_MODEL
export SYSTEM_MEMORY_TOTAL
export SYSTEM_MEMORY_FREE
export SYSTEM_MEMORY_BUFFERS
export SYSTEM_SWAP_TOTAL
export SYSTEM_SWAP_FREE
export SYSTEM_DISK_FREE
export SYSTEM_DISK_TOTAL
export SYSTEM_DISK_USED

echo "System Architecture: ${SYSTEM_ARCH}"
echo "Kernel Version: ${SYSTEM_KERNEL}"
echo "Operating System: ${SYSTEM_OS}"
echo "Number of CPU Cores: ${SYSTEM_CPU_CORES}"
echo "Total CPU Processors (Logical Cores): ${SYSTEM_CPU_PROC}"
echo "Number of CPU Threads: ${SYSTEM_CPU_THREADS}"
echo "CPU Model: ${SYSTEM_CPU_MODEL}"
echo "Total Memory: ${SYSTEM_MEMORY_TOTAL} KB"
echo "Free Memory: ${SYSTEM_MEMORY_FREE} KB"
echo "Memory Buffers: ${SYSTEM_MEMORY_BUFFERS} KB"
echo "Total Swap: ${SYSTEM_SWAP_TOTAL} KB"
echo "Free Swap: ${SYSTEM_SWAP_FREE} KB"
echo "Free Disk Space: ${SYSTEM_DISK_FREE}"
echo "Total Disk Space: ${SYSTEM_DISK_TOTAL}"
echo "Used Disk Space: ${SYSTEM_DISK_USED}"
