
#!/bin/bash

# Prompt user for the department code and course number
echo "Enter a department code and course number (e.g., 'cs 3423'):"
read -r dept_course

# Split the input into dept_code and course_num
dept_code=$(echo "$dept_course" | cut -d' ' -f1)
course_num=$(echo "$dept_course" | cut -d' ' -f2)

# Convert department code to uppercase
dept_code=${dept_code^^}

# Construct filename
filename="data/${dept_code}${course_num}.crs"

# Check if the file exists
if [ -f "$filename" ]; then
        # If file exists, read the details and display them
            dept_name=$(head -n 1 "$filename" | cut -d' ' -f2-)
                course_name=$(head -n 2 "$filename" | tail -n 1)
                    course_sched=$(head -n 3 "$filename" | tail -n 1 | cut -d' ' -f1)
                        course_start=$(head -n 3 "$filename" | tail -n 1 | cut -d' ' -f2)
                            course_end=$(head -n 3 "$filename" | tail -n 1 | cut -d' ' -f3)
                                course_hours=$(head -n 4 "$filename" | tail -n 1)
                                    course_size=$(head -n 5 "$filename" | tail -n 1)

                                        # Display the course information
                                            echo "Course department: $dept_code $dept_name"
                                                echo "Course number: $course_num"
                                                    echo "Course name: $course_name"
                                                        echo "Scheduled days: $course_sched"
                                                            echo "Course start: $course_start"
                                                                echo "Course end: $course_end"
                                                                    echo "Credit hours: $course_hours"
                                                                        echo "Enrolled students: $course_size"
                                                                        else
                                                                                # If the course file doesn't exist, show an error
                                                                                    echo "ERROR: course not found"
                                                                                    fi

