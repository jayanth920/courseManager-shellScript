#!/bin/bash

# Count the number of .crs files in the data directory
course_count=$(find data -maxdepth 1 -type f -name "*.crs" | wc -l)

# Display the total course count
echo "Total course records: $course_count"

