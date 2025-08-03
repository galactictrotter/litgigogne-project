# Le Lit Gigogne Hugo Website - Claude AI Memory

## Project Overview

This is the Hugo static site project for **Le Lit Gigogne**, a premium French artisanal furniture maker established in 1984. The company specializes in handcrafted wooden furniture including lits gigogne (trundle beds), canapés, futons, and custom furniture pieces made from solid wood.

**Website**: https://d32pb2gafsfl8j.cloudfront.net  
**Hugo Framework**: Static site generator with French localization  
**Primary Language**: French (fr-FR)  
**Brand Heritage**: "Depuis 1984" - 40+ years of French craftsmanship expertise

## Brand Voice & Identity

### Core Brand Values
- **Artisanal Excellence**: "savoir-faire artisanal", "maîtres ébénistes"
- **French Heritage**: "depuis 1984", "tradition française", "ébénisterie"
- **Consciousness-Aware**: "alchimie", "résonance vibratoire", "harmonie"
- **Quality Craftsmanship**: "finitions perfectionnées", "bois massif"
- **Well-being Focus**: "Mieux vivre, Mieux dormir, Mieux respirer"

### Voice Characteristics
- **Sophisticated but accessible** - Technical expertise without intimidation
- **Poetic yet practical** - Philosophical approach grounded in functionality  
- **Heritage-focused** - Emphasizing 40+ years of tradition and expertise
- **Consciousness-aware** - Using elevated language around harmony and well-being
- **Authentically French** - Premium craftsmanship vocabulary and cultural references

## Technical Architecture

### Hugo Structure - Content-Driven Architecture ✅
```
litgigogne-hugo/
├── config.yaml               # Main configuration
├── content/                   # NEW: Content-driven architecture
│   └── modal-teintes-finitions/
│       ├── _index.md         # Modal root content
│       ├── sidebar/          # Sidebar content files
│       │   ├── introduction.md
│       │   ├── cta-buttons.md
│       │   ├── contact-info.md
│       │   └── trust-indicators.md
│       └── tabs/             # Tab content files
│           ├── finitions.md
│           ├── teintes.md
│           ├── ral.md
│           └── guide.md
├── layouts/
│   ├── _default/
│   └── partials/
│       ├── color-modal.html           # Main modal container
│       ├── color-modal-sidebar.html   # Content-driven sidebar
│       ├── color-modal-finishes.html  # Content-driven tab
│       ├── color-modal-water-tints.html # Content-driven tab
│       ├── color-modal-ral.html       # Content-driven tab
│       ├── color-modal-guide.html     # Content-driven tab
│       ├── color-modal-styles.html    # CSS styling
│       ├── color-modal-scripts.html   # JavaScript functionality
│       ├── contact-modal.html         # Contact form modal
│       └── modal/content-loaders/     # NEW: Content loader partials
│           ├── sidebar-introduction.html
│           ├── sidebar-cta-buttons.html
│           ├── sidebar-contact-info.html
│           ├── sidebar-trust-indicators.html
│           ├── tab-finitions.html
│           ├── tab-teintes.html
│           ├── tab-ral.html
│           └── tab-guide.html
├── data/
│   └── colors/
│       ├── finishes.json      # 3 finish types with imagery
│       ├── water-tints.json   # 7 wood essence reproductions
│       └── ral-colors.json    # 200+ professional RAL colors
└── static/
```

### Color Modal System - Key Achievement

The **color customization modal** is the crown jewel of this project - a sophisticated interface that builds trust and encourages customer dialog through:

#### Technical Implementation
- **Alberta Modal Pattern**: Uses proven content-section + sidebar-section structure
- **4-Tab Navigation**: Finitions, Teintes à l'Eau, RAL Colors, Color Guide
- **Responsive Design**: Mobile-optimized with 360px sidebar constraint
- **Hugo Data Binding**: JSON-driven content with real Le Lit Gigogne imagery
- **CSS Transitions**: Opacity/visibility animations, no display toggles

#### Content Strategy
- **Trust-Building Focus**: Demonstrates expertise through detailed technical knowledge
- **Lead Generation**: Guides users toward project discussions
- **Brand Differentiation**: Sophisticated French approach vs. generic furniture
- **Progressive Disclosure**: Complex information made accessible and scannable

#### Modal Structure
```html
<div id="colorModalOverlay">
  <div class="color-modal">
    <div class="modal-content-section">
      <!-- 4 tabs with color/finish options -->
    </div>
    <div class="modal-sidebar-section">
      <!-- Brand messaging, navigation, contact -->
    </div>
  </div>
</div>
```

## Data Architecture

### Color System JSON Structure

Each color/finish item follows this pattern:
```json
{
  "code": "FIN-01",
  "name": "Vernis Incolore", 
  "image": "http://www.lelitgigogne.fr/img/cms/verni%20incolore.jpg",
  "category": "protection",
  "description": "Protection du bois avec plusieurs couches d'acrylique..."
}
```

### Current Data Sources
- **finishes.json**: 3 traditional finish methods with authentic website imagery
- **water-tints.json**: 7 wood essence reproductions (Acajou, Chêne, Wengé, etc.)
- **ral-colors.json**: 200+ standardized professional colors organized by families

## Content Development History

### Phase 1.1: Modal Restructuring
- Converted broken modal to Alberta pattern structure
- Fixed CSS/JavaScript integration issues
- Implemented proper tab navigation system
- Established responsive design patterns

### Phase 2: Visual Polish & Data Enhancement
- Typography refinements (removed italics, optimized fonts, line heights)
- Real image integration from Le Lit Gigogne website
- Content reorganization for trust-building and lead generation
- Square design theme implementation

### Phase 3: Content Strategy Development
- Created comprehensive content specifications
- Developed brand voice guidelines for AI tools
- Established tone mapping per modal section
- Built framework for future content generation

### Phase 4: Content Architecture Migration ✅ COMPLETED
**Complete separation of content from templates with seasonal variant support**

#### Phase 4.1: Sidebar Content Migration
- **4 Content Files Created**: Introduction, CTA Buttons, Contact Info, Trust Indicators
- **4 Content Loaders Built**: With robust fallback systems
- **Complete Integration**: Sidebar fully content-driven with zero hardcoded content

#### Phase 4.2: Tab Content Migration  
- **4 Tab Content Files Created**: Finitions, Teintes, RAL, Guide des Couleurs
- **4 Tab Content Loaders Built**: With structured data mapping
- **Complete Integration**: All tabs fully content-driven

#### Architecture Achievements
- **8 Markdown Files**: Rich front matter metadata for easy content management
- **8 Content Loaders**: Comprehensive fallback systems prevent site breakage
- **Seasonal Content System**: Full seasonal variant support (Noël, Fête des Mères, etc.)
- **Content Separation**: 100% separation achieved - zero hardcoded content remains
- **Hugo Build Success**: 985 pages generated successfully, all content verified
- **Non-Technical Management**: Content can now be managed without touching templates

### Phase 5: Project Restoration & Enhanced Content Integration ✅ COMPLETED (August 2025)
**Complete restoration from August 1 backup with enhanced drawer storage content**

#### Phase 5.1: Forensic Recovery & Backup
- **GitHub Repository Created**: https://github.com/galactictrotter/litgigogne-project
- **Complete Project Backup**: All states preserved before restoration
- **August 1 Backup Restoration**: Working Alberta modal system restored
- **Content Archive Creation**: lit-a-tiroirs-hugo content safely preserved

#### Phase 5.2: Enhanced Content Transplant
- **12 Enhanced Product Files**: MASSAKO series with detailed specifications
- **7 Lits-Tiroirs Files**: Capacity indicators, prestashop integration (IDs: 22, 428, 446)
- **3 Canapés Files**: Drawer sofas with enhanced features
- **2 Produits Files**: Additional storage solutions
- **Template Compatibility**: Price range and gallery format fixes

#### Phase 5.3: Multi-Site Architecture
- **Dual Site Operation**: litgigogne-hugo (985 pages) + lit-a-tiroirs-hugo (226 pages)
- **Brand Identity Separation**: No contextual a-propos files transplanted
- **Content Inheritance Ready**: Infrastructure for Hugo modules sharing
- **Both Sites Operational**: localhost:1313 + localhost:1314 simultaneously

#### Restoration Achievements
- **PEFC Certifications**: Consistent environmental standards across products
- **French Artisanal Details**: "Assemblages traditionnels français depuis 1984"
- **Enhanced Specifications**: Detailed capacity mapping (0.40 m³ = 1 commode)
- **Prestashop Integration**: Complete e-commerce field structure
- **Template Robustness**: Cross-format compatibility for price_range and gallery
- **Build Verification**: Both sites generate correct page counts and full functionality

## Content Reference Materials

### Primary Documents (in _buffer_files/content_modal_dev/)
- **enhanced_color_modal_memo.md** - Complete project context and requirements
- **claude_project_instructions.md** - AI tool collaboration guidelines  
- **lit-gigogne-modal-content.md** - Master philosophical content blueprint
- **color-modal-content-specs.md** - Comprehensive specification with verbatim source

### Content Approach by Section

#### Tab 1 - Finitions Classiques
**Tone**: Artisanal Intimacy - sensory, personal, craft-focused
**Content**: 3 traditional finishes (Bois Brut, Vernis Incolore, Huile de Lin)
**Approach**: Technical precision within poetic expression

#### Tab 2 - Teintes à l'Eau  
**Tone**: Poetic Elevation - nature, ecology, transformation
**Content**: 7 authentic wood essence reproductions
**Approach**: Biomimetic innovation with ecological consciousness

#### Tab 3 - Nuancier RAL
**Tone**: Heritage & Mastery - authority, expertise, sophistication
**Content**: 200+ professional colors organized by families (1000-9000 series)
**Approach**: Technical mastery with architectural sophistication

#### Tab 4 - Guide des Couleurs
**Tone**: Holistic Well-being - psychology, harmony, guidance  
**Content**: Room-specific recommendations and color psychology
**Approach**: Consciousness-aware guidance for spatial harmony

## Key Technical Patterns

### Alberta Modal CSS Structure
```css
.modal-content-section {
  flex: 1 1 45% !important;
}
.modal-sidebar-section {  
  flex: 0 0 360px !important;
}

#colorModalOverlay {
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s ease, visibility 0.3s ease;
}
#colorModalOverlay.active {
  opacity: 1;
  visibility: visible;
}
```

### Brand-Consistent Content Length Guidelines
- **Sidebar introduction**: 40-60 words
- **Tab introductions**: 60-100 words
- **Individual option descriptions**: 30-50 words  
- **Contact section**: Exact Alberta modal template format

### JavaScript Modal Functions
- `openColorModal()` - Global function to open modal
- `closeColorModal()` - Global function to close modal
- Tab switching with proper ID consistency across partials

## Content Quality Standards

### Brand Authenticity Checklist
- [ ] Immediately recognizable as premium French craftsmanship
- [ ] Uses signature Le Lit Gigogne vocabulary ("savoir-faire", "maîtres ébénistes")
- [ ] Maintains consciousness-aware messaging approach
- [ ] References 40+ years expertise appropriately without overwhelming

### User Experience Requirements  
- [ ] Enables quick decision-making while building confidence
- [ ] Creates desire to learn more about the brand
- [ ] Guides toward project discussion naturally ("Parlons de votre projet")
- [ ] Fits within technical constraints (360px sidebar, scannable format)

### Technical Integration Standards
- [ ] Follows Alberta modal HTML structure patterns
- [ ] Uses established CSS class conventions (.info-item, .intro-text)
- [ ] Contact section matches exact Alberta template
- [ ] Maintains visual hierarchy and mobile responsiveness

## Business Objectives

### Primary Goals
1. **Trust Building**: Demonstrate Le Lit Gigogne's expertise and attention to detail
2. **Lead Generation**: Encourage users to start project discussions
3. **Brand Differentiation**: Clearly distinguish from generic furniture competitors
4. **User Engagement**: Make exploration interesting and educational

### Success Metrics
- Content feels premium and artisanal, not generic
- Technical information builds customer confidence  
- Modal interactions lead to contact form completions
- Users spend adequate time exploring different sections

## Hugo Configuration Highlights

### Brand Parameters (config.yaml)
```yaml
params:
  brand:
    name: 'Le Lit Gigogne'
    tagline: 'Mieux vivre, Mieux dormir, Mieux respirer'
    since: 1984
  
  seo:
    description: 'Artisan français depuis 1984, créateur de lits gigogne, canapés, futons et tatamis en bois massif.'
```

### Contact Modal Integration
- **CTA 1**: "Parlons de votre projet" - Opens contact modal
- **CTA 2**: Product Discovery - Under development
- **Form Data**: Project types, budget ranges, timeline options from config.yaml

## Development Workflow

### When Making Changes
1. **Always reference brand voice guidelines** - Maintain sophisticated French approach
2. **Use Alberta modal patterns** - Preserve proven UI/UX structure  
3. **Test data binding** - Ensure Hugo partials integrate with JSON data
4. **Validate mobile responsiveness** - 360px sidebar constraint critical
5. **Check content against business objectives** - Trust-building and lead generation focus

### Content Updates
- **For new content**: Reference comprehensive blueprint in lit-gigogne-modal-content.md
- **For tone consistency**: Use tone mapping per section guidelines
- **For technical specs**: Follow verbatim source content in specs document
- **For copy length**: Adhere to Alberta modal constraints

## Maintenance Commands

### Hugo Development
```bash
hugo server -D                    # Local development server
hugo --minify                     # Production build
```

### Content Validation
- Verify all modal tabs display correctly
- Test tab switching functionality  
- Confirm data binding from JSON files
- Validate mobile responsive design
- Check contact modal integration

## Future Development Notes

### Pending Improvements
- Complete tab switching functionality for all 4 sections
- Implement color selection state management
- Add image optimization for better loading performance
- Enhance mobile touch interactions
- Integrate with contact form submission handling

### Content Expansion
- Seasonal color recommendations
- Room-specific photography examples
- Customer testimonials integration
- Before/after project showcases
- Video content for craftsmanship demonstration

---

## Working with This Project

### For New Claude Sessions
1. **Read this CLAUDE.md first** - Establishes full project context
2. **Review content specification documents** in _buffer_files/content_modal_dev/
3. **Understand Alberta modal patterns** - Critical for UI consistency
4. **Maintain Le Lit Gigogne brand voice** - Sophisticated French craftsmanship approach
5. **Focus on business objectives** - Trust-building and lead generation

### Key Success Factors
- **Never generic furniture language** - Must reflect 40+ years French craftsmanship
- **Alberta modal structure integrity** - Don't break proven UI patterns
- **Content serves business goals** - Every word should build trust or encourage engagement
- **Mobile-first responsive** - 360px sidebar constraint is non-negotiable
- **Hugo data binding consistency** - Maintain JSON structure and partial integration

### Emergency Guidelines
If unsure about direction:
1. Return to business objective: building trust and encouraging dialog
2. Check against Le Lit Gigogne's established brand voice
3. Ensure content differentiates from generic furniture brands  
4. Prioritize user confidence and decision-making support

---

**Le Lit Gigogne - Depuis 1984, l'excellence artisanale au service de votre bien-être spatial**

*This CLAUDE.md provides complete context for maintaining consistency with Le Lit Gigogne's sophisticated brand approach while preserving the technical excellence of the color modal system.*