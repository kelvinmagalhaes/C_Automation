CC = gcc
CFLAGS = -g -Wall
TARGET = challenge
SRC = challenge.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)