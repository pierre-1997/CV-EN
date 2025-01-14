# Variables
TEX = pdflatex
BIBER = biber
OUTPUT_DIR = build
TEX_FILE = sample.tex
BASE_NAME = sample

# Default target
all: $(OUTPUT_DIR)/$(BASE_NAME).pdf clean

# Create the output directory if it doesn't exist
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Rule for generating the PDF
$(OUTPUT_DIR)/$(BASE_NAME).pdf: $(OUTPUT_DIR) $(TEX_FILE)
	$(TEX) -output-directory=$(OUTPUT_DIR) $(TEX_FILE)
	$(BIBER) --input-directory=$(OUTPUT_DIR) --output-directory=$(OUTPUT_DIR) $(BASE_NAME)
	$(TEX) -output-directory=$(OUTPUT_DIR) $(TEX_FILE)
	$(TEX) -output-directory=$(OUTPUT_DIR) $(TEX_FILE)

# Clean up intermediate files
clean:
	rm -rf $(OUTPUT_DIR)/*.aux $(OUTPUT_DIR)/*.log $(OUTPUT_DIR)/*.bbl $(OUTPUT_DIR)/*.bcf $(OUTPUT_DIR)/*.blg $(OUTPUT_DIR)/*.toc $(OUTPUT_DIR)/*.out $(OUTPUT_DIR)/*.xml $(OUTPUT_DIR)/*.xmpi

.PHONY: all clean
