#!/bin/bash

# Le Lit Gigogne - Development Server Script
# Enhanced development workflow for content creators

set -e  # Exit on any error

echo "🛠️  Starting Le Lit Gigogne development server..."

# Default configuration
PORT=1313
BIND="127.0.0.1"
DRAFTS=false
FUTURE=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--port)
            PORT="$2"
            shift 2
            ;;
        --bind)
            BIND="$2"
            shift 2
            ;;
        --drafts)
            DRAFTS=true
            shift
            ;;
        --future)
            FUTURE=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  -p, --port PORT     Server port (default: 1313)"
            echo "  --bind ADDRESS      Bind address (default: 127.0.0.1)"
            echo "  --drafts           Include draft content"
            echo "  --future           Include future dated content"
            echo "  -h, --help         Show this help"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Check Hugo availability
if ! command -v hugo &> /dev/null; then
    echo "❌ Hugo is not installed or not in PATH"
    exit 1
fi

echo "📋 Hugo version: $(hugo version)"

# Quick content structure check
echo "📁 Checking content structure..."
if [ ! -d "content" ]; then
    echo "❌ No content directory found"
    exit 1
fi

content_count=$(find content -name "*.md" | wc -l)
echo "📄 Found $content_count markdown files"

# Check for critical templates
if [ ! -f "layouts/_default/single.html" ] || [ ! -f "layouts/_default/list.html" ]; then
    echo "⚠️  Warning: Missing critical templates - some pages may not render correctly"
fi

# Check for enhanced features
if [ -f "layouts/partials/product-specs-enhanced.html" ]; then
    echo "✅ Enhanced product specifications available"
fi

if [ -f "layouts/partials/price-format.html" ]; then
    echo "✅ French price formatting available"
fi

# Build server command
CMD="hugo server --port $PORT --bind $BIND --disableFastRender"

if [ "$DRAFTS" = true ]; then
    CMD="$CMD --buildDrafts"
    echo "📝 Including draft content"
fi

if [ "$FUTURE" = true ]; then
    CMD="$CMD --buildFuture"
    echo "🔮 Including future dated content"
fi

# Display server info
echo ""
echo "🚀 Starting development server..."
echo "   URL: http://$BIND:$PORT"
echo "   Press Ctrl+C to stop"
echo ""

# Development tips
echo "💡 Development tips:"
echo "   - Main collections: http://$BIND:$PORT/collections/"
echo "   - Product JSON: http://$BIND:$PORT/index.json"
echo "   - Futons et Tatamis: http://$BIND:$PORT/futons-tatamis/"
echo "   - Live reload is enabled - changes auto-refresh browser"
echo ""

# Start the server
exec $CMD