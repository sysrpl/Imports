# Define the compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -O2

# Define the MinGW compiler for Windows
MINGW64_CC = x86_64-w64-mingw32-gcc

# Define the target names
LIB_NAME = libimage-linux.a
DLL_NAME = libimage.dll

# Define the source files
SRC = image.c

# Default target to build for Linux
all: $(LIB_NAME)

# Target to build the static library for Linux
$(LIB_NAME): $(SRC)
	$(CC) $(CFLAGS) -c $(SRC) -o image-linux.o
	ar rcs $(LIB_NAME) image-linux.o

# Target to build the DLL for Windows
dll: $(SRC)
	$(MINGW64_CC) -shared -o $(DLL_NAME) $(SRC)

# Clean up the build artifacts
clean:
	rm -f *.o $(LIB_NAME) $(DLL_NAME)
