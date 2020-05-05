#!/bin/bash

#takes year, size, benchmark, and dir as parameters
#grab "RES" data from top
generate_results () {
	watch  -n1 "top -b -n1 | grep -i ${3} | head -1 | awk '{print $6}' >> ${4}/${1}_${3}_${2}.txt" &
	WATCHPID=$!

	./main.pl -input=${2} -clean speccpu_${1}:${3}

	kill $WATCHPID

	echo "completed benchmark: created file ${4}/${1}_${3}_${2}.txt"
}

# test
# year='2017'
# sizes='test train'
# benchmarks='mcf omnetpp'

# for benchmark in $benchmarks
# do

# 	dir="./mem_results/${benchmark}_${year}"
# 	mkdir "${dir}"

# 	echo "created folder: ${dir}"

# 	for size in $sizes
# 	do
# 		generate_results ${year} ${size} ${benchmark} ${dir}
# 	done
# done

year='2017'
sizes='test train ref'
benchmarks='leela fp'

for benchmark in $benchmarks
do

	dir="./mem_results/${benchmark}_${year}"
	mkdir "${dir}"

	echo "created folder: ${dir}"

	for size in $sizes
	do
		generate_results ${year} ${size} ${benchmark} ${dir}
	done
done

echo "completed 2017 benchmarks"


# year='2006'
# sizes='test train ref'
# benchmarks='perlbench bzip2 gcc gobmk hmmer sjeng h264ref astar omnetpp libquantum mcf'

# for benchmark in $benchmarks
# do

# 	dir="./mem_results/${benchmark}_${year}"
# 	mkdir "${dir}"

# 	echo "created folder: ${dir}"

# 	for size in $sizes
# 	do
# 		generate_results ${year} ${size} ${benchmark} ${dir}
# 	done
# done

# echo "completed 2006 part 1 benchmarks"


# year='2006'
# sizes='test train ref huge'
# benchmarks='omnetpp libquantum mcf'

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

# echo "completed 2006 part 2 benchmarks"

echo "DONE"