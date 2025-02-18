#!/bin/bash

# Prompt user for department code and course number
echo "Enter a course department code and number (e.g., 'cs 3423'):"
read -r dept_course

# Split the input into dept_code and course_num
dept_code=$(echo "$dept_course" | cut -d' ' -f1)
course_num=$(echo "$dept_course" | cut -d' ' -f2)

# Convert department code to uppercase (compatible with Bash 3)
dept_code=$(echo "$dept_code" | tr 'a-z' 'A-Z')

# Construct filename for the course
filename="data/${dept_code}${course_num}.crs"

# Check if the course file exists
if [ -f "$filename" ]; then
    # Retrieve the course name from the file (assuming it's the second line)
    course_name=$(head -n 2 "$filename" | tail -n 1)

    # Delete the course file
    rm "$filename"

    # Log the deletion after removing the file
    echo "$(date) DELETED: $dept_code $course_num $course_name" >> data/queries.log

    # Inform the user
    echo "Course $course_num was successfully deleted."
else
    # If the course file doesn't exist, show an error
    echo "ERROR: course not found"
fi
