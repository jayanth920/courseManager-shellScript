#!/bin/bash

# Prompt user for department code, course number, and enrollment change amount
echo "Enter a department code and course number (e.g., 'cs 3423'):"
read -r dept_course
echo "Enter an enrollment change amount (e.g., '3' for new students, '-2' for drops):"
read -r change_amt

# Split the input into dept_code and course_num
dept_code=$(echo "$dept_course" | cut -d' ' -f1)
course_num=$(echo "$dept_course" | cut -d' ' -f2)

# Convert department code to uppercase
dept_code=${dept_code^^}

# Construct filename
filename="data/${dept_code}${course_num}.crs"

# Check if the course file exists
if [ -f "$filename" ]; then
        # Read the current enrollment (line 5 in the file)
            current_enrollment=$(sed -n '5p' "$filename")

                # Apply the enrollment change
                    new_enrollment=$((current_enrollment + change_amt))

                        # Check if the new enrollment is a valid number (non-negative)
                            if [ "$new_enrollment" -lt 0 ]; then
                                        echo "ERROR: Enrollment cannot be negative."
                                                exit 1
                                                    fi

                                                        # Update the course file with the new enrollment
                                                            # First, we create a temporary file to update the course's details
                                                                temp_file=$(mktemp)
                                                                    head -n 4 "$filename" > "$temp_file"  # Copy the first 4 lines
                                                                        echo "$new_enrollment" >> "$temp_file"  # Add the new enrollment number
                                                                            tail -n +6 "$filename" >> "$temp_file"  # Append the remaining lines (if any)

                                                                                # Move the updated file back to the original filename
                                                                                    mv "$temp_file" "$filename"

                                                                                        # Log the enrollment change
                                                                                            echo "$(date) ENROLLMENT: $dept_code $course_num $(head -n 2 "$filename" | tail -n 1) changed by $change_amt" >> data/queries.log

                                                                                                # Inform the user
                                                                                                    echo "Enrollment for course $course_num has been updated to $new_enrollment students."
                                                                                                    else
                                                                                                            # If the course file doesn't exist, show an error
                                                                                                                echo "ERROR: course not found"
                                                                                                                fi

