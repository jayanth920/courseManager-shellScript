#!/bin/bash

# Ensure the data directory exists
mkdir -p data

# Main loop for the menu
while true; do
        echo "Enter one of the following actions or press CTRL-D to exit."
            echo "C - create a new course record"
                echo "R - read an existing course record"
                    echo "U - update an existing course record"
                        echo "D - delete an existing course record"
                            echo "E - update enrolled student count of existing course"
                                echo "T - show total course count"
                                    echo -n "> "
                                        
                                            # Read user input
                                                if read -r action; then
                                                            # Convert input to uppercase
                                                                    action=${action^^}
                                                                            
                                                                                    case "$action" in
                                                                                                C) ./create.bash ;;  # Call create script
                                                                                                            R) ./read.bash ;;  # Call read script
                                                                                                                        U) ./update.bash ;;  # Call update script
                                                                                                                                    D) ./delete.bash ;;  # Call delete script
                                                                                                                                                E) ./enroll.bash ;;  # Call enroll script
                                                                                                                                                            T) ./total.bash ;;  # Call total script
                                                                                                                                                                        "") continue ;;  # Handle empty input
                                                                                                                                                                                    *) echo "ERROR: invalid option" ;;
                                                                                                                                                                                            esac
                                                                                                                                                                                                else
                                                                                                                                                                                                            break  # Exit loop when no more input is available (end of file)
                                                                                                                                                                                                                fi
                                                                                                                                                                                                                done

