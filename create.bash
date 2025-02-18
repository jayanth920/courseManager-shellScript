#!/bin/bash

# Prompt user for each field one at a time
echo "Enter department code (2-3 letters):"
read -r dept_code

echo "Enter department name (string possibly containing whitespace):"
read -r dept_name

echo "Enter course number (4-digit integer):"
read -r course_num

echo "Enter course name (string possibly containing whitespace):"
read -r course_name

echo "Enter course schedule (MWF or TH):"
read -r course_sched

echo "Enter course start date (MM/DD/YY):"
read -r course_start

echo "Enter course end date (MM/DD/YY):"
read -r course_end

echo "Enter course credit hours (unsigned integer):"
read -r course_hours

echo "Enter initial course enrollment (unsigned integer):"
read -r course_size

# Convert department code to uppercase
dept_code=${dept_code^^}

# Construct filename for the course
filename="data/${dept_code}${course_num}.crs"

# Check if the course file already exists after collecting all inputs
if [ -f "$filename" ]; then
        echo "ERROR: course already exists"
            exit 1
            fi

# Create the new course file and write the details to it
echo "$dept_code $dept_name" > "$filename"
echo "$course_name" >> "$filename"
echo "$course_sched $course_start $course_end" >> "$filename"
echo "$course_hours" >> "$filename"
echo "$course_size" >> "$filename"

# Log the course creation action
echo "$(date +"%Y-%m-%d %H:%M:%S") CREATED: $dept_code $course_num $course_name" >> data/queries.log

echo "Course created successfully!"

