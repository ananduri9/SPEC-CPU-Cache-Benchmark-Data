#!/bin/bash

#takes year, size, benchmark, and dir as parameters
generate_results () {

	echo "taskset -c 1 /usr/bin/perf stat -e cycles,instructions,cache-references,cache-misses,\
L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-dcache-store-misses,L1-dcache-prefetch-misses,\
L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses,LLC-prefetches,LLC-prefetch-misses,\
dTLB-loads,dTLB-load-misses,dTLB-stores,dTLB-store-misses,iTLB-loads,iTLB-load-misses" | \
./main.pl -input=${2} -clean speccpu_${1}:${3} > "${4}/${1}_${3}_${2}.txt"

	echo "completed benchmark: created file ${4}/${1}_${3}_${2}.txt"
}


# #test
# year='2017'
# sizes='test train'
# benchmarks='mcf omnetpp'

# for benchmark in $benchmarks
# do

# 	dir="./tlb_results/${benchmark}_${year}"
# 	mkdir "${dir}"

# 	echo "created folder: ${dir}"

# 	for size in $sizes
# 	do
# 		generate_results ${year} ${size} ${benchmark} ${dir}
# 	done
# done


year='2017'
sizes='test train ref'
benchmarks='perlbench gcc mcf omnetpp xalancbmk deepsjeng leela exchange2 fp'

for benchmark in $benchmarks
do

	dir="./tlb_results/${benchmark}_${year}"
	mkdir "${dir}"

	echo "created folder: ${dir}"

	for size in $sizes
	do
		generate_results ${year} ${size} ${benchmark} ${dir}
	done
done

echo "completed 2017 benchmarks"


year='2006'
sizes='test train ref'
benchmarks='perlbench bzip2 gcc gobmk hmmer sjeng h264ref astar'

for benchmark in $benchmarks
do

	dir="./tlb_results/${benchmark}_${year}"
	mkdir "${dir}"

	echo "created folder: ${dir}"

	for size in $sizes
	do
		generate_results ${year} ${size} ${benchmark} ${dir}
	done
done

echo "completed 2006 part 1 benchmarks"


year='2006'
sizes='test train ref huge'
benchmarks='omnetpp libquantum mcf'

for benchmark in $benchmarks
do

	dir="./tlb_results/${benchmark}_${year}"
	mkdir "${dir}"

	echo "created folder: ${dir}"

	for size in $sizes
	do
		generate_results ${year} ${size} ${benchmark} ${dir}
	done
done

echo "completed 2006 part 2 benchmarks"

echo "DONE"




# year='2006'
# sizes='huge'
# benchmarks='omnetpp libquantum mcf'

# for benchmark in $benchmarks
# do

# 	dir="./tlb_results/${benchmark}_${year}"
# 	# mkdir "${dir}"

# 	# echo "created folder: ${dir}"

# 	for size in $sizes
# 	do
# 		generate_results ${year} ${size} ${benchmark} ${dir}
#		echo ""
# 	done
# done


