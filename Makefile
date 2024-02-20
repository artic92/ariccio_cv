# Makefile for LaTeX compilation

# Directories
SRC_DIR = .
BUILD_DIR = build

# LaTeX compiler
LATEX_COMPILER = xelatex

# LaTeX source files
TEX_FILES = $(wildcard $(SRC_DIR)/*.tex)
CLS_FILES = $(wildcard $(SRC_DIR)/*.cls)

# Output PDF file
OUTPUT_PDF = $(BUILD_DIR)/main.pdf

# Default target
all: $(OUTPUT_PDF)

# Compile LaTeX source files
$(BUILD_DIR)/%.pdf: $(SRC_DIR)/%.tex $(CLS_FILES) | $(BUILD_DIR)
	$(LATEX_COMPILER) -output-directory=$(BUILD_DIR) -input-directory=$(SRC_DIR) $<

# Create build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean target to remove intermediate results
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
