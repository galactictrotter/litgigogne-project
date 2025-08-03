#!/bin/bash

# Le Lit Gigogne - Hugo Build Script
# Optimized build process for the enhanced content structure

set -e  # Exit on any error

echo "🏗️  Starting Le Lit Gigogne build process..."

# Clean previous build
echo "🧹 Cleaning previous build..."
rm -rf public/*

# Verify Hugo version
echo "📋 Checking Hugo version..."
hugo version

# Check for critical directories
echo "📁 Verifying content structure..."
required_dirs=("content/lits-gigogne" "content/canapes" "content/matelas" "content/futons-tatamis" "content/lits-japonais" "content/lits-tiroirs" "content/accessoires")
for dir in "${required_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "❌ Missing required directory: $dir"
        exit 1
    fi
done
echo "✅ All required directories present"

# Validate critical data files
echo "📊 Validating data files..."
data_files=("data/product_families.yml" "data/fabric_ranges.json" "data/teintes_finitions.json")
for file in "${data_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "⚠️  Warning: Missing data file: $file"
    fi
done

# Check for enhanced templates
echo "🎨 Checking enhanced templates..."
critical_templates=("layouts/_default/single.html" "layouts/_default/list.html" "layouts/partials/product-specs-enhanced.html" "layouts/partials/price-format.html")
for template in "${critical_templates[@]}"; do
    if [ ! -f "$template" ]; then
        echo "❌ Missing critical template: $template"
        exit 1
    fi
done
echo "✅ All critical templates present"

# Build with optimizations
echo "🚀 Building site with optimizations..."
hugo --minify --gc --cleanDestinationDir

# Verify build success
if [ $? -eq 0 ]; then
    echo "✅ Hugo build completed successfully"
else
    echo "❌ Hugo build failed"
    exit 1
fi

# Generate build stats
echo "📈 Generating build statistics..."
echo "Build completed at: $(date)" > public/build-info.txt
echo "Content statistics:" >> public/build-info.txt
echo "- Total pages: $(find public -name "*.html" | wc -l)" >> public/build-info.txt
echo "- Product pages: $(find public -path "*/lits-*/*.html" -o -path "*/canapes/*.html" -o -path "*/matelas/*.html" -o -path "*/futons-tatamis/*.html" -o -path "*/accessoires/*.html" | wc -l)" >> public/build-info.txt
echo "- JSON files: $(find public -name "*.json" | wc -l)" >> public/build-info.txt

# Verify critical pages exist
echo "🔍 Verifying critical pages..."
critical_pages=("public/index.html" "public/lits-gigogne/index.html" "public/canapes/index.html" "public/matelas/index.html" "public/futons-tatamis/index.html" "public/contact/index.html")
for page in "${critical_pages[@]}"; do
    if [ ! -f "$page" ]; then
        echo "❌ Missing critical page: $page"
        exit 1
    fi
done
echo "✅ All critical pages generated"

# Check for broken internal links in JSON outputs
echo "🔗 Validating JSON outputs..."
if [ -f "public/index.json" ]; then
    echo "✅ Main JSON index generated"
    # Basic JSON validation
    if jq empty public/index.json 2>/dev/null; then
        echo "✅ Main JSON is valid"
    else
        echo "⚠️  Warning: Main JSON may have formatting issues"
    fi
else
    echo "❌ Missing main JSON index"
fi

# Performance optimization check
echo "⚡ Checking performance optimizations..."
echo "- CSS files: $(find public -name "*.css" | wc -l)"
echo "- JS files: $(find public -name "*.js" | wc -l)"
echo "- Image files: $(find public -name "*.jpg" -o -name "*.png" -o -name "*.webp" | wc -l)"

# Final validation
echo "✅ Build process completed successfully!"
echo "📊 Build summary written to public/build-info.txt"
echo "🌐 Site ready for deployment at: public/"

# Optional: Display build size
echo "📦 Build size: $(du -sh public | cut -f1)"