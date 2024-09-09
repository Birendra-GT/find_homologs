#!/bin/bash

# Assign input arguments to variables
query_file=$1
subject_file=$2
output_file=$3

# Run BLAST with the blastn-short task and filter perfect matches
blastn -task blastn-short -query "$query_file" -subject "$subject_file" -outfmt "6 qseqid sseqid pident length qlen slen" | \
awk '$3 == 100 && $4 == $5 {print}' > "$output_file"

# Count the number of perfect matches
num_matches=$(wc -l < "$output_file")

# Print the number of perfect matches
echo "Number of perfect matches: $num_matches"
