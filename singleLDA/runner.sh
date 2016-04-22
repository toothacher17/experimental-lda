#!/bin/bash

DATASETS="nips"
METHODS="FTreeLDA"
NUM_ITER="20"
NUM_TOPICS="50"

for DATASET in $DATASETS
do
for METHOD in $METHODS
do
	#Create the directory structure
	time_stamp=`date "+%b_%d_%Y_%H.%M.%S"`
	DIR_NAME='res'/$DATASET/$METHOD/$time_stamp/
	mkdir -p $DIR_NAME

	#save details about experiments in an about file
	echo 'Running LDA inference using' $METHOD
	echo 'For dataset' $dataset
	echo 'For number of iterations' $NUM_ITER
	echo 'For number of topics' $NUM_TOPICS
	echo 'Using single sampling thread'

	#run
	./LDA --method "$METHOD" --testing-mode set --num-topics $NUM_TOPICS --num-iterations $NUM_ITER --output-model $DIR_NAME --num-top-words 15 --training-file ../data/"$DATASET".train --testing-file "$DATASET".test | tee -a $DIR_NAME/log.txt
done
done

echo 'done'
