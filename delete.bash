#!/bin/bash

# Prompt user for department code and course number
echo "Enter a department code and course number (e.g., 'cs 3423'):"
read -r dept_course

# Split the input into dept_code and course_num
dept_code=$(echo "$dept_course" | cut -d' ' -f1)
course_num=$(echo "$dept_course" | cut -d' ' -f2)

# Convert department code to uppercase
dept_code=${dept_code^^}

# Construct filename
filename="data/${dept_code}${course_num}.crs"

# Check if the course file exists
if [ -f "$filename" ]; then
        # Delete the course file
            rm "$filename"

                # Log the deletion
                    echo "$(date) DELETED: $dept_code $course_num $(head -n 2 "$filename" | tail -n 1)" >> data/queries.log

                        # Inform the user
                            echo "Course $course_num was successfully deleted."
                            else
                                    # If the course file doesn't exist, show an error
                                        echo "ERROR: course not found"
                                        fi

