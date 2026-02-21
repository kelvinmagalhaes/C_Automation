#!/bin/bash

# -------------------------------
# Project configuration
# -------------------------------
PROGRAM="challenge"
SOURCE="challenge.c"
LOG_ROOT="logs"

# Timestamp for this round
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create folder for this round
ROUND_DIR="${LOG_ROOT}/${TIMESTAMP}"
mkdir -p ${ROUND_DIR}

# Log files inside the round folder
BUILD_LOG="${ROUND_DIR}/build.txt"
OUTPUT_LOG="${ROUND_DIR}/output.txt"
VALGRIND_LOG="${ROUND_DIR}/valgrind.txt"
COMBINED_LOG="${ROUND_DIR}/combined.txt"

# -------------------------------
# Compile the program
# -------------------------------
echo "=== Compiling ${SOURCE} ==="
# Redirect stdout and stderr to build log
gcc -g -Wall -Wextra -o ${PROGRAM} ${SOURCE} > ${BUILD_LOG} 2>&1
if [ $? -ne 0 ]; then
    echo "Compilation failed! Check ${BUILD_LOG}"
    exit 1
fi
echo "Compilation done. Build log: ${BUILD_LOG}"

# -------------------------------
# Run the program
# -------------------------------
echo "=== Running program ==="
# Show output in terminal and save to OUTPUT_LOG
./${PROGRAM} 2>&1 | tee ${OUTPUT_LOG}
echo "Program run complete. Output log: ${OUTPUT_LOG}"

# -------------------------------
# Run Valgrind for memory check
# -------------------------------
echo "=== Running Valgrind ==="
# Show Valgrind output in terminal and save to VALGRIND_LOG
valgrind --leak-check=full --track-origins=yes ./${PROGRAM} 2>&1 | tee ${VALGRIND_LOG}
echo "Valgrind check complete. Log: ${VALGRIND_LOG}"

# -------------------------------
# Create combined log (program + Valgrind)
# -------------------------------
echo "=== Creating combined log ==="
cat ${OUTPUT_LOG} ${VALGRIND_LOG} > ${COMBINED_LOG}
echo "Combined log created: ${COMBINED_LOG}"

# -------------------------------
# Summary
# -------------------------------
echo "All logs for this round are in '${ROUND_DIR}/'"