# Le Lit Gigogne Hugo Implementation - Technical Guide

## Hugo Project Structure

This Hugo site implements a sophisticated color customization modal system for Le Lit Gigogne, a premium French furniture maker. **Fully restored from August 1, 2025 backup** with enhanced drawer storage content integration. The site follows Hugo best practices while maintaining the brand's sophisticated "depuis 1984" voice.

**GitHub Repository**: https://github.com/galactictrotter/litgigogne-project  
**Current Status**: ✅ OPERATIONAL - 985 pages generated  
**Local Access**: http://localhost:1313/  
**Enhanced Content**: 12 MASSAKO series products with prestashop integration

### Directory Structure
```
litgigogne-hugo/
├── config.yaml                 # Main Hugo configuration
├── layouts/
│   ├── _default/
│   │   ├── baseof.html         # Base template
│   │   └── single.html         # Single page template
│   └── partials/
│       ├── color-modal.html           # Modal container (Alberta pattern)
│       ├── color-modal-sidebar.html   # Sidebar navigation & brand messaging
│       ├── color-modal-finishes.html  # Tab 1: 3 finish options
│       ├── color-modal-water-tints.html # Tab 2: 7 water-based stains
│       ├── color-modal-ral.html       # Tab 3: 200+ RAL colors with filtering
│       ├── color-modal-guide.html     # Tab 4: Color selection guidance
│       ├── color-modal-styles.html    # Modal CSS (Alberta pattern)
│       ├── color-modal-scripts.html   # Modal JavaScript functionality
│       └── contact-modal.html         # Contact form modal
├── data/
│   └── colors/
│       ├── finishes.json       # 3 finish types with Le Lit Gigogne imagery
│       ├── water-tints.json    # 7 authentic wood essence reproductions
│       └── ral-colors.json     # 200+ professional RAL colors
└── static/
    └── (static assets)
```

## Color Modal System - Technical Implementation

### Alberta Modal Pattern Structure

The color modal follows the proven Alberta modal pattern with two main sections:

```html
<!-- color-modal.html -->
<div id="colorModalOverlay">
  <div class="color-modal">
    <div class="modal-content-section">
      <!-- Tab content displays here -->
    </div>
    <div class="modal-sidebar-section">
      <!-- Navigation, brand messaging, contact -->
    </div>
  </div>
</div>
```

### Critical CSS Architecture

**Key Classes** (color-modal-styles.html):
```css
/* Modal overlay with opacity/visibility transitions */
#colorModalOverlay {
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s ease, visibility 0.3s ease;
}

#colorModalOverlay.active {
  opacity: 1;
  visibility: visible;
}

/* Alberta modal layout structure */
.modal-content-section {
  flex: 1 1 45% !important;  /* Flexible content area */
}

.modal-sidebar-section {
  flex: 0 0 360px !important; /* Fixed 360px sidebar */
}
```

**CRITICAL**: Never use `display: none/block` transitions - always use opacity/visibility for smooth animations.

### JavaScript Integration

**Global Functions** (color-modal-scripts.html):
- `openColorModal()` - Opens modal with active class
- `closeColorModal()` - Removes active class
- Tab switching with proper ID consistency

**Tab System**: Each tab has consistent naming:
- `finishesTab` - Finitions Classiques
- `waterTintsTab` - Teintes à l'Eau  
- `ralTab` - Nuancier RAL
- `guideTab` - Guide des Couleurs

## Hugo Data Binding Patterns

### JSON Data Structure

All color data follows this consistent pattern:
```json
{
  "code": "FIN-01",
  "name": "Vernis Incolore",
  "image": "http://www.lelitgigogne.fr/img/cms/verni%20incolore.jpg",
  "category": "protection",
  "description": "Protection du bois avec plusieurs couches d'acrylique..."
}
```

### Hugo Template Integration

**Accessing Data in Partials**:
```go
{{ range site.Data.colors.finishes }}
  <div class="color-option">
    <img src="{{ .image }}" alt="{{ .name }}">
    <h4>{{ .name }}</h4>
    <p>{{ .description }}</p>
  </div>
{{ end }}
```

**Site Configuration Access**:
```go
{{ site.Params.brand.name }}     <!-- Le Lit Gigogne -->
{{ site.Params.brand.since }}    <!-- 1984 -->
{{ site.Params.brand.tagline }}  <!-- Mieux vivre, Mieux dormir, Mieux respirer -->
```

## Partial File Dependencies

### Modal System Flow
1. **color-modal.html** - Main container, includes all other partials
2. **color-modal-styles.html** - Must be loaded before modal content
3. **color-modal-sidebar.html** - Sidebar content and navigation
4. **color-modal-[section].html** - Individual tab content
5. **color-modal-scripts.html** - Must be loaded after modal content

### Include Order (Critical)
```go
{{ partial "color-modal-styles.html" . }}
{{ partial "color-modal.html" . }}
{{ partial "color-modal-scripts.html" . }}
```

## Content Standards & Brand Voice

### Hugo Template Variables for Brand Consistency

**Heritage Messaging**:
```go
{{ $heritage := "depuis 1984" }}
{{ $craftsmanship := "savoir-faire artisanal" }}
{{ $masters := "maîtres ébénistes" }}
```

**Content Length Guidelines**:
- Sidebar intro: 40-60 words
- Tab introductions: 60-100 words
- Individual descriptions: 30-50 words

### Alberta Modal Template Pattern

**Info Item Structure** (use consistently):
```html
<div class="info-item">
  <h4>{{ .title }}</h4>
  <p>{{ .description }}</p>
</div>
```

## Responsive Design Implementation

### Mobile Breakpoints

**Critical Constraint**: 360px sidebar maximum width
```css
@media (max-width: 768px) {
  .modal-sidebar-section {
    flex: 0 0 100% !important;
    order: 2;
  }
  
  .modal-content-section {
    flex: 1 1 100% !important;
    order: 1;
  }
}
```

### Touch Interactions
- Tab buttons sized for touch (minimum 44px)
- Modal close areas properly sized
- Swipe gestures for tab switching (if implemented)

## Data Management Best Practices

### JSON File Organization

**finishes.json** - 3 traditional finishes:
- Vernis Incolore (colorless varnish)
- Bois Brut (raw wood) 
- Huile de Lin (linseed oil)

**water-tints.json** - 7 wood essences:
- Acajou Clair/Foncé, Chêne Moyen, Hêtre, Merisier, Wengé Clair/Foncé

**ral-colors.json** - 200+ professional colors:
- Organized by families (1000-9000 series)
- Includes category, family, and hex values

### Image URL Management

**Current Approach**: Direct URLs to Le Lit Gigogne website
```json
"image": "http://www.lelitgigogne.fr/img/cms/verni%20incolore.jpg"
```

**Future Optimization**: Consider local image optimization with Hugo's image processing

## Hugo Development Workflow

### Local Development
```bash
# Start development server
hugo server -D

# Watch for changes
hugo server -D --watch

# Build for production
hugo --minify
```

### Content Updates
1. **JSON Data**: Update data files directly
2. **Partial Templates**: Modify HTML structure
3. **Styling**: Update color-modal-styles.html
4. **Functionality**: Modify color-modal-scripts.html

### Testing Checklist
- [ ] Modal opens/closes properly
- [ ] All 4 tabs switch correctly
- [ ] Data binding displays all items
- [ ] Mobile responsive layout works
- [ ] Contact modal integration functions
- [ ] Brand voice consistency maintained

## Troubleshooting Common Issues

### Modal Not Opening
- Check JavaScript console for errors
- Verify `openColorModal()` function exists
- Confirm CSS classes are applied correctly
- Ensure modal overlay has proper z-index

### Tab Switching Problems
- Verify tab IDs match between sidebar and content
- Check JavaScript event listeners
- Confirm CSS display states for tabs

### Data Not Displaying
- Validate JSON syntax in data files
- Check Hugo template syntax in partials
- Verify data file paths are correct
- Test with `hugo server -D` for detailed errors

### Mobile Layout Issues
- Test sidebar 360px constraint
- Verify flexbox behavior on small screens
- Check touch target sizes
- Test modal close functionality on mobile

## Performance Optimization

### Hugo Build Optimization
```yaml
# config.yaml
build:
  useResourceCacheWhen: "fallback"
  writeStats: true

# Minification settings
minify:
  disableCSS: false
  disableHTML: false
  disableJS: false
```

### Image Optimization
- Consider Hugo's image processing for better performance
- Implement lazy loading for modal content
- Optimize image formats (WebP where supported)

### CSS/JS Optimization
- Minify modal styles in production
- Consider critical CSS inlining
- Implement proper cache headers

## Integration Points

### Contact Modal Connection
- Color modal CTA buttons connect to contact modal
- Shared styling patterns between modals
- Consistent brand messaging across both systems

### Site-wide Integration
- Modal trigger buttons in product pages
- Breadcrumb integration where applicable
- SEO considerations for modal content

## Brand Consistency Checklist

### Content Standards
- [ ] Uses "depuis 1984" heritage messaging
- [ ] Includes "savoir-faire artisanal" language
- [ ] References "maîtres ébénistes" appropriately
- [ ] Maintains sophisticated French tone
- [ ] Focuses on trust-building and lead generation

### Technical Standards
- [ ] Follows Alberta modal structure exactly
- [ ] Maintains 360px sidebar width constraint
- [ ] Uses opacity/visibility transitions only
- [ ] Implements proper responsive breakpoints
- [ ] Preserves Hugo data binding patterns

## Future Enhancement Considerations

### Planned Improvements
- Enhanced tab switching animations
- Color selection state management
- Advanced filtering for RAL colors
- Integration with e-commerce functionality
- A/B testing for conversion optimization

### Content Expansion
- Video integration for craftsmanship demonstration
- Interactive color picker functionality
- Room visualization tools
- Customer project showcases
- Seasonal color recommendations

---

## Quick Reference Commands

### Hugo Development
```bash
hugo server -D                 # Development server
hugo --minify                  # Production build
hugo version                   # Check Hugo version
```

### File Watching
```bash
# Watch specific directories
hugo server -D --watch --navigateToChanged
```

### Debugging
```bash
# Verbose output
hugo server -D --verbose

# Debug template issues
hugo server -D --debug
```

---

**Important**: Always maintain the sophisticated Le Lit Gigogne brand voice and Alberta modal technical patterns. This Hugo implementation serves the business objective of building trust and generating leads through an exceptional color customization experience.

*For overall project context, see the main CLAUDE.md in the project root directory.*