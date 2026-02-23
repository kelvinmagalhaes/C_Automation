# Firmware Build System - AMD DevOps Demo
# Supports: native build, cross-compile ARM, testing, Valgrind
CC=gcc
CFLAGS=-Wall -Wextra -O2 -g -std=c99 -DDEBUG
TARGET=challenge

all: $(TARGET)

$(TARGET): challenge.c
	$(CC) $(CFLAGS) -o $@ $^
	@echo "✓ Firmware build complete: $(TARGET)"

test: $(TARGET)
	@echo "Running automated tests..."
	./$(TARGET) < input.txt > output.txt
	diff output.txt test1_expected.txt && echo "✓ All tests PASSED" || echo "✗ Test FAILED"

valgrind: $(TARGET)
	@echo "Running Valgrind memory analysis..."
	valgrind --leak-check=full --track-origins=yes ./$(TARGET) < input.txt

clean:
	rm -f $(TARGET) output.txt *.o *.hex

.PHONY: all test valgrind clean
