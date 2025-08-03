#!/bin/bash

# Script to aggregate all color modal partials into one file for review
# Usage: ./aggregate_color_modal_partials.sh

OUTPUT_FILE="color_modal_all_partials_aggregated.txt"
PARTIALS_DIR="layouts/partials"

# Clear or create output file
> "$OUTPUT_FILE"

echo "========================================" >> "$OUTPUT_FILE"
echo "COLOR MODAL PARTIALS AGGREGATE REPORT" >> "$OUTPUT_FILE"
echo "Generated on: $(date)" >> "$OUTPUT_FILE"
echo "========================================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Function to add a partial to the output
add_partial() {
    local filename=$1
    local filepath="$PARTIALS_DIR/$filename"
    
    echo "" >> "$OUTPUT_FILE"
    echo "========================================" >> "$OUTPUT_FILE"
    echo "FILE: $filename" >> "$OUTPUT_FILE"
    echo "PATH: $filepath" >> "$OUTPUT_FILE"
    echo "========================================" >> "$OUTPUT_FILE"
    
    if [ -f "$filepath" ]; then
        echo "SIZE: $(wc -c < "$filepath") bytes" >> "$OUTPUT_FILE"
        echo "LINES: $(wc -l < "$filepath") lines" >> "$OUTPUT_FILE"
        echo "----------------------------------------" >> "$OUTPUT_FILE"
        echo "CONTENT:" >> "$OUTPUT_FILE"
        echo "----------------------------------------" >> "$OUTPUT_FILE"
        cat "$filepath" >> "$OUTPUT_FILE"
    else
        echo "ERROR: FILE NOT FOUND!" >> "$OUTPUT_FILE"
    fi
    
    echo "" >> "$OUTPUT_FILE"
    echo "======================================== END OF $filename" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
}

# List of color modal related partials
echo "Searching for color modal partials..." >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Main modal files
add_partial "color-modal.html"
add_partial "color-modal-styles.html"
add_partial "color-modal-scripts.html"
add_partial "color-modal-trigger.html"

# Component files
add_partial "color-modal-sidebar.html"
add_partial "color-modal-finishes.html"
add_partial "color-modal-water-tints.html"
add_partial "color-modal-ral.html"
add_partial "color-modal-guide.html"

# Check for any other color-modal files
echo "" >> "$OUTPUT_FILE"
echo "========================================" >> "$OUTPUT_FILE"
echo "OTHER COLOR-MODAL FILES FOUND:" >> "$OUTPUT_FILE"
echo "========================================" >> "$OUTPUT_FILE"

for file in "$PARTIALS_DIR"/color-modal-*.html; do
    if [ -f "$file" ]; then
        basename_file=$(basename "$file")
        # Skip if already processed
        if [[ ! " color-modal.html color-modal-styles.html color-modal-scripts.html color-modal-trigger.html color-modal-sidebar.html color-modal-finishes.html color-modal-water-tints.html color-modal-ral.html color-modal-guide.html " =~ " $basename_file " ]]; then
            echo "Found additional file: $basename_file" >> "$OUTPUT_FILE"
            add_partial "$basename_file"
        fi
    fi
done

# Summary
echo "" >> "$OUTPUT_FILE"
echo "========================================" >> "$OUTPUT_FILE"
echo "SUMMARY" >> "$OUTPUT_FILE"
echo "========================================" >> "$OUTPUT_FILE"
echo "Total color-modal files found: $(ls -1 "$PARTIALS_DIR"/color-modal-*.html 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "Output saved to: $OUTPUT_FILE" >> "$OUTPUT_FILE"

# Display completion message
echo "✅ Aggregation complete!"
echo "📄 Results saved to: $OUTPUT_FILE"
echo ""
echo "Quick stats:"
ls -la "$PARTIALS_DIR"/color-modal-*.html 2>/dev/null | wc -l | xargs echo "Total files:"
echo "Output file size: $(wc -c < "$OUTPUT_FILE") bytes"
echo ""
echo "To view the results, run:"
echo "cat $OUTPUT_FILE | less"