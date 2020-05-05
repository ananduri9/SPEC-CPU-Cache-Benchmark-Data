#!/bin/bash

# add column names
echo -n "benchmark,year,size,memory," > final_results.csv
awk -F "," '{ print $1"," }' < ./csv_results/mcf_2017/2017_mcf_test.csv | tr -d '\n' >> final_results.csv
echo "" >> final_results.csv


year='2017'
benchmarks='perlbench gcc mcf omnetpp xalancbmk deepsjeng leela exchange2 fp'

for benchmark in $benchmarks
do
	for filename in ./csv_results/${benchmark}_${year}/*.csv
	do
		basename="${filename#./csv_results/${benchmark}_${year}/}"
		basename="${basename%.csv}"
		size="${basename#${year}_${benchmark}_}"

		# add benchmark, year, and size to row
		echo -n "${benchmark},${year},${size}," >> final_results.csv

		# add memory footprint (RES) data to row - get the max
		awk 'BEGIN{a=   0}{if ($6>a) a=$6 fi} END{printf "%d", a}' "./mem_results/${benchmark}_${year}/${basename}.txt" | tr -d '\n' >> final_results.csv
		echo -n "," >> final_results.csv

		# add tlb and cache data to row
		awk -F "," '{ print $2"," }' < $filename | tr -d '\n' >> final_results.csv

		# add new line
		echo "" >> final_results.csv
	done
done


year='2006'
benchmarks='perlbench bzip2 gcc gobmk hmmer sjeng h264ref astar omnetpp libquantum mcf'

for benchmark in $benchmarks
do
	for filename in ./csv_results/${benchmark}_${year}/*.csv
	do
		basename="${filename#./csv_results/${benchmark}_${year}/}"
		basename="${basename%.csv}"
		size="${basename#${year}_${benchmark}_}"

		# add benchmark, year, and size to row
		echo -n "${benchmark},${year},${size}," >> final_results.csv

		# add memory footprint (RES) data to row
		awk 'BEGIN{a=   0}{if ($6>a) a=$6 fi} END{print a}' "./mem_results/${benchmark}_${year}/${basename}.txt" | tr -d '\n' >> final_results.csv
		echo -n "," >> final_results.csv

		# add tlb and cache data to row
		awk -F "," '{ print $2"," }' < $filename | tr -d '\n' >> final_results.csv

		# add new line
		echo "" >> final_results.csv
	done
done

# remove last comma on each line
sed -i 's/.$//' final_results.csv

# change unknown values to NA
sed -i 's/<not/NA/g' final_results.csv