# Makefile

CC = clang
CFLAGS = -Wall -Wextra -Iinclude
INPUT_DIR = test/input
BUILD_DIR = build
SOURCES = $(wildcard $(INPUT_DIR)/*.c)
OBJECTS = $(patsubst $(INPUT_DIR)/%.c,$(BUILD_DIR)/%.o,$(SOURCES))
EXECUTABLE = $(BUILD_DIR)/test.exe

.PHONY: all clean tidy json

all: $(EXECUTABLE)

$(BUILD_DIR)/%.o: $(INPUT_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(EXECUTABLE)

tidy:
	clang-tidy $(SOURCES) -- -Iinclude

json:
	@mkdir -p $(BUILD_DIR)
	cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
