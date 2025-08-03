# Lit à Tiroirs - Taxonomy Standards & Migration Strategy

## Philosophy: NON-BREAKING EVOLUTION

Instead of disrupting Le Lit Gigogne's existing taxonomy, we'll **add new clean fields** alongside existing messy ones, allowing both systems to coexist until Le Lit Gigogne is ready to migrate.

## Approved Terms Directory

### PRIMARY CATEGORIES (Functional Classification)
```yaml
# NEW CLEAN FIELDS (add to front matter)
lit_tiroirs_category: "lits-tiroirs"        # Clean primary classification
lit_tiroirs_category: "canapes-tiroirs"     # Clean primary classification  
lit_tiroirs_category: "canapes-convertibles" # Clean primary classification
```

### STORAGE FEATURES (Standardized Tags)
```yaml
# NEW CLEAN FIELDS (add to front matter)
lit_tiroirs_features:
  - "tiroir-integre"          # Integrated drawer
  - "rangement-vertical"      # Vertical storage
  - "haute-capacite"          # High capacity  
  - "rangement-compact"       # Compact storage
  - "modulaire"               # Modular
  - "convertible"             # Convertible
```

### MATERIALS (Standardized)
```yaml
# NEW CLEAN FIELDS (add to front matter)  
lit_tiroirs_materials:
  - "pin-massif"              # Solid pine
  - "bois-massif"             # Solid wood
  - "artisanal"               # Handcrafted
```

### DESIGN STYLES (Standardized)
```yaml
# NEW CLEAN FIELDS (add to front matter)
lit_tiroirs_styles:
  - "japonais"                # Japanese inspired
  - "minimaliste"             # Minimalist
  - "contemporain"            # Contemporary
```

## Migration Examples (NON-BREAKING)

### Example: canape-tiroir-massako.md
**BEFORE (Le Lit Gigogne keeps this):**
```yaml
categories: ["canapes", "lits-tiroir", "mobilier-japonais"]
tags: ["tiroir", "Massako", "rangement", "inspiration japonaise"]
```

**AFTER (ADD these fields, don't remove old ones):**
```yaml
# Original fields (KEEP for Le Lit Gigogne compatibility)
categories: ["canapes", "lits-tiroir", "mobilier-japonais"]
tags: ["tiroir", "Massako", "rangement", "inspiration japonaise"]

# NEW clean fields (ADD for Lit à Tiroirs)
lit_tiroirs_category: "canapes-tiroirs"
lit_tiroirs_features: ["tiroir-integre"]
lit_tiroirs_materials: ["pin-massif", "artisanal"]
lit_tiroirs_styles: ["japonais", "minimaliste"]
product_family_clean: "massako"
```

## Lit à Tiroirs Filtering Strategy (Hybrid Approach)

### Template Logic: Prefer Clean, Fall Back to Messy
```hugo
{{/* Try clean taxonomy first, fall back to messy */}}
{{ $isDrawerSofa := false }}

{{/* Check NEW clean field first */}}
{{ if eq .Params.lit_tiroirs_category "canapes-tiroirs" }}
    {{ $isDrawerSofa = true }}
{{/* Fall back to messy taxonomy */}}  
{{ else if or (in .Params.tags "tiroir") (in .Params.categories "lits-tiroir") }}
    {{ $isDrawerSofa = true }}
{{ end }}

{{ if $isDrawerSofa }}
    {{/* Display product */}}
{{ end }}
```

### Capacity Mapping: Clean + Smart Fallbacks
```hugo
{{/* Try clean capacity first */}}
{{ if .Params.lit_tiroirs_capacity }}
    {{ $capacityClass = .Params.lit_tiroirs_capacity }}
{{/* Fall back to smart inference */}}
{{ else if in .Params.lit_tiroirs_features "rangement-compact" }}
    {{ $capacityClass = "capacity-compact" }}
{{ else if in .Params.lit_tiroirs_features "haute-capacite" }}
    {{ $capacityClass = "capacity-high" }}  
{{/* Ultimate fallback to filename patterns */}}
{{ else if in .Title "400" }}
    {{ $capacityClass = "capacity-compact" }}
{{ end }}
```

## Benefits of This Approach

### ✅ For Le Lit Gigogne:
- **No breaking changes** - existing templates keep working
- **Gradual adoption** - can migrate one product at a time
- **Validation period** - see how clean taxonomy works in Lit à Tiroirs

### ✅ For Lit à Tiroirs:
- **Clean architecture** - use standardized terms immediately  
- **Robust filtering** - multiple fallback strategies
- **Future-proof** - ready for when Le Lit Gigogne migrates

### ✅ For Both Projects:
- **Shared standards** - common vocabulary documented here
- **Risk mitigation** - no functionality loss during transition
- **Proven migration path** - Lit à Tiroirs validates the approach

## Implementation Phases

### Phase 1: Lit à Tiroirs Implementation (NOW)
1. ✅ Create this standards document
2. ✅ Update Lit à Tiroirs templates with hybrid filtering  
3. ✅ Test with existing messy taxonomy (works today)
4. 📋 Propose clean fields for Le Lit Gigogne content team

### Phase 2: Le Lit Gigogne Gradual Addition (FUTURE)
1. Add `lit_tiroirs_*` fields to products with content
2. Start with the 2 working lits-tiroirs + 3 working canapés
3. Validate in Lit à Tiroirs before expanding
4. Document any edge cases or needed adjustments

### Phase 3: Le Lit Gigogne Full Migration (FUTURE)
1. Migrate all products to clean taxonomy
2. Update Le Lit Gigogne templates to use clean fields
3. Deprecate messy fields gradually
4. Both sites use same clean standards

## Current Status

**Lit à Tiroirs**: Using hybrid approach, ready for clean taxonomy
**Le Lit Gigogne**: Keeps existing functionality, adds clean fields when ready
**Standards**: Documented and version-controlled in this file

---

This approach lets us move forward with clean architecture while being a good neighbor to Le Lit Gigogne's existing functionality.