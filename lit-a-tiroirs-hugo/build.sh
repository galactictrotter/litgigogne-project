#!/bin/bash

# Lit à Tiroirs Hugo Production Build
echo "🛏️  Building Lit à Tiroirs for production..."
echo "🎨 Enhanced with purple theme and shared content integration"
echo ""

# Clean previous build
echo "🧹 Cleaning previous build..."
rm -rf public/

# Build static site with optimizations
echo "🔨 Building static site..."
hugo --minify --gc --environment production

# Build summary
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build successful!"
    echo "📊 Site statistics:"
    hugo list all | wc -l | xargs echo "   - Total pages:"
    echo "   - Enhanced features: Purple color scheme, gradients, animations"
    echo "   - New content: 3 canapé tiroirs products, À Propos integration"
    echo "   - Navigation: 4 main categories with 3-pane layout"
    echo ""
    echo "🚀 Ready for AWS S3 deployment"
    echo "📁 Output directory: ./public/"
else
    echo "❌ Build failed!"
    exit 1
fi