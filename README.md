# SPEC-CPU-Cache-Benchmark-Data

## Columns
*  benchmark: name of SPEC CPU benchmark
*  size: size describing input. One of 'test', 'train', or 'ref'
*  year: from 2006 or 2017
*  memory: the maximum RES memory value in kilobytes (kb) from "top" at any point during the benchmark
*  cycles: this and the following columns are the result of perf stat for different events involving caches
*  instructions
*  cache-references
*  cache-misses
*  L1-dcache-loads
*  L1-dcache-load-misses
*  L1-dcache-stores
*  L1-dcache-store-misses
*  L1-dcache-prefetch-misses
*  L1-icache-load-misses
*  LLC-loads
*  LLC-load-misses
*  LLC-stores
*  LLC-store-misses
*  LLC-prefetches
*  LLC-prefetch-misses
*  dTLB-loads
*  dTLB-load-misses
*  dTLB-stores
*  dTLB-store-misses
*  iTLB-loads
*  iTLB-load-misses

## interval_results
*  Cumulative results for each benchmark on various perf stat events every 100ms of execution.

## final_results
*  Final results for each benchmark on various perf stat events.

## Machine Configuration
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                24
On-line CPU(s) list:   0-23
Thread(s) per core:    1
Core(s) per socket:    12
Socket(s):             2
NUMA node(s):          2
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Stepping:              2
CPU MHz:               1200.000
BogoMIPS:              5002.97
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              30720K
NUMA node0 CPU(s):     0-11
NUMA node1 CPU(s):     12-23

Distributor ID:	Ubuntu
Description:	Ubuntu 14.04.3 LTS
Release:	14.04
Codename:	trusty
