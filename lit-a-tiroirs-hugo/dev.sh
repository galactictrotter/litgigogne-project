#!/bin/bash

# Lit à Tiroirs Hugo Development Server
echo "🛏️  Starting Lit à Tiroirs development server..."
echo "🎨 Enhanced with purple color scheme and 3-pane layout"
echo ""

# Start Hugo development server
hugo server --port 1314 --bind 0.0.0.0 --disableFastRender --navigateToChanged --buildDrafts --watch

echo ""
echo "✨ Lit à Tiroirs site available at http://localhost:1314"