#!/bin/bash

# add column names
echo -n "benchmark,year,size,memory," > interval_results.csv
awk -F "," '{ print $1"," }' < ./csv_results/mcf_2017/2017_mcf_test.csv | tr -d '\n' >> interval_results.csv
echo "" >> interval_results.csv


year='2017'
benchmarks='perlbench gcc mcf omnetpp xalancbmk deepsjeng leela exchange2 fp'

for benchmark in $benchmarks
do
	for filename in ./csv_interval_results/${benchmark}_${year}/*.csv
	do
		basename="${filename#./csv_interval_results/${benchmark}_${year}/}"
		basename="${basename%.csv}"
		size="${basename#${year}_${benchmark}_}"

		memory=$(awk 'BEGIN{a=   0}{if ($6>a) a=$6 fi} END{printf "%d", a}' "./mem_results/${benchmark}_${year}/${basename}.txt" | tr -d '\n')

		cat $filename | awk -F "," '{ print $2"," }' | tr -d '\n' | sed 's/,/\n/20; P; D' | awk -F "," "{ print \"${benchmark},${year},${size},${memory},\"\$0 }" >> interval_results.csv

	done
done


year='2006'
benchmarks='perlbench bzip2 gcc gobmk hmmer sjeng h264ref astar omnetpp libquantum mcf'

for benchmark in $benchmarks
do
	for filename in ./csv_interval_results/${benchmark}_${year}/*.csv
	do
		basename="${filename#./csv_interval_results/${benchmark}_${year}/}"
		basename="${basename%.csv}"
		size="${basename#${year}_${benchmark}_}"

		memory=$(awk 'BEGIN{a=   0}{if ($6>a) a=$6 fi} END{printf "%d", a}' "./mem_results/${benchmark}_${year}/${basename}.txt" | tr -d '\n')

		cat $filename | awk -F "," '{ print $2"," }' | tr -d '\n' | sed 's/,/\n/20; P; D' | awk -F "," "{ print \"${benchmark},${year},${size},${memory},\"\$0 }" >> interval_results.csv

	done
done

# remove last comma on each line
sed -i 's/.$//' interval_results.csv

# change unknown values to NA
sed -i 's/<not/NA/g' interval_results.csv