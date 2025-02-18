#!/bin/bash

# Prompt user for each field one at a time
echo "Enter department code (2-3 characters):"
read -r dept_code

echo "Enter department name (string possibly containing whitespace):"
read -r dept_name

echo "Enter course number (4-digit integer):"
read -r course_num

echo "Enter course name (string possibly containing whitespace):"
read -r course_name

echo "Enter course meeting days (MWF or TH):"
read -r course_sched

echo "Enter course start date (MM/DD/YY):"
read -r course_start

echo "Enter course end date (MM/DD/YY):"
read -r course_end

echo "Enter course credit hours (unsigned integer):"
read -r course_hours

echo "Enter course enrollment (unsigned integer):"
read -r course_size

# Convert department code to uppercase (compatible with older bash versions)
dept_code=$(echo "$dept_code" | tr 'a-z' 'A-Z')

# Construct filename for the course
filename="data/${dept_code}${course_num}.crs"

# Check if the file exists after collecting all inputs
if [ -f "$filename" ]; then
    # Read the existing course information from the file
    existing_dept_name=$(head -n 1 "$filename" | cut -d' ' -f2-)
    existing_course_name=$(head -n 2 "$filename" | tail -n 1)
    existing_course_sched=$(head -n 3 "$filename" | tail -n 1 | cut -d' ' -f1)
    existing_course_start=$(head -n 3 "$filename" | tail -n 1 | cut -d' ' -f2)
    existing_course_end=$(head -n 3 "$filename" | tail -n 1 | cut -d' ' -f3)
    existing_course_hours=$(head -n 4 "$filename" | tail -n 1)
    existing_course_size=$(head -n 5 "$filename" | tail -n 1)

    # Prompt user for new values, keep original if blank
    dept_name=${dept_name:-$existing_dept_name}
    course_name=${course_name:-$existing_course_name}
    course_sched=${course_sched:-$existing_course_sched}
    course_start=${course_start:-$existing_course_start}
    course_end=${course_end:-$existing_course_end}
    course_hours=${course_hours:-$existing_course_hours}
    course_size=${course_size:-$existing_course_size}

    # Overwrite the course file with the updated information
    echo "$dept_code $dept_name" > "$filename"
    echo "$course_name" >> "$filename"
    echo "$course_sched $course_start $course_end" >> "$filename"
    echo "$course_hours" >> "$filename"
    echo "$course_size" >> "$filename"

    # Log the update action with the date and course info
    echo "$(date +"%Y-%m-%d %H:%M:%S") UPDATED: $dept_code $course_num $course_name" >> data/queries.log

    echo "Course updated successfully!"
else
    # If the course file doesn't exist, show an error
    echo "ERROR: course not found"
fi
