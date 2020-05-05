#!/bin/bash

#takes filename as parameter
generate_csv () {
	filename=$1
	basename="${filename#./tlb_results/}"
	
	grep -E '  cycles|  instructions|  L1-|  LLC-|  dTLB-|  iTLB-' $filename | \
sed "s/#.*\[/ /" | sed "s/\[//" | sed "s/\]//" | sed "s/,//g" | \
awk '{ print $2","$1","$3 }' > "./csv_results/${basename%.txt}.csv"

}


# #test
# year='2017'
# benchmarks='mcf omnetpp'

# for benchmark in $benchmarks
# do
# 	dir="./csv_results/${benchmark}_${year}"
# 	mkdir "${dir}"

# 	for filename in ./tlb_results/${benchmark}_${year}/*.txt
# 	do
# 		generate_csv $filename

# 	done
# done


year='2017'
benchmarks='perlbench gcc mcf omnetpp xalancbmk deepsjeng leela exchange2 fp'

for benchmark in $benchmarks
do
	dir="./csv_results/${benchmark}_${year}"
	mkdir "${dir}"

	for filename in ./tlb_results/${benchmark}_${year}/*.txt
	do
		generate_csv $filename

	done
done


year='2006'
benchmarks='perlbench bzip2 gcc gobmk hmmer sjeng h264ref astar omnetpp libquantum mcf'

for benchmark in $benchmarks
do
	dir="./csv_results/${benchmark}_${year}"
	mkdir "${dir}"

	for filename in ./tlb_results/${benchmark}_${year}/*.txt
	do
		generate_csv $filename

	done
done
