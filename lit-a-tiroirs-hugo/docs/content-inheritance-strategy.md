# Content Inheritance Strategy - Technical Implementation Guide

## Overview

This document outlines the comprehensive strategy for implementing content inheritance between Le Lit Gigogne (parent brand) and Lit à Tiroirs (specialized storage brand), allowing selective content reuse while maintaining brand-specific voice and specialization.

## Core Philosophy

**Refined Brand Philosophy:** "Mieux vivre, mieux dormir, mieux respirer, mieux ranger"
- **"Mieux ranger"** chosen over "mieux organiser" for more direct, actionable language
- Represents the natural evolution of Le Lit Gigogne's philosophy with storage specialization

## Technical Architecture

### 1. Hugo Modules Content Inheritance

#### **Setup Configuration**

**Le Lit Gigogne as Content Provider:**
```yaml
# litgigogne-hugo/config.yaml
module:
  path: "github.com/litgigogne/content-library"
  mounts:
  - source: "content/a-propos"
    target: "content/shared/heritage"
  - source: "content/artisanat" 
    target: "content/shared/craftsmanship"
  - source: "data/company"
    target: "data/shared/company"
```

**Lit à Tiroirs as Content Consumer:**
```yaml
# lit-a-tiroirs-hugo/config.yaml
module:
  imports:
  - path: "github.com/litgigogne/content-library"
    mounts:
    - source: "content/shared/heritage"
      target: "content/shared/heritage"
    - source: "data/shared/company"
      target: "data/shared/company"
```

#### **Content Access Pattern**
```go
{{/* Access inherited content */}}
{{ $gigogne_histoire := .Site.GetPage "/shared/heritage/_index" }}
{{ $gigogne_charte := .Site.GetPage "/shared/heritage/charte-engagement-environnemental" }}
{{ $gigogne_philosophie := .Site.GetPage "/shared/heritage/philosophie-heritage-artisanat" }}

{{/* Use inherited content with transformations */}}
{{ $transformed_content := $gigogne_histoire.Content | transform }}
```

### 2. Content Transformation Pipeline

#### **Core Transformation Dictionary**
```go
{{ $brand_transforms := dict 
  "Le Lit Gigogne" "Lit à Tiroirs"
  "lits gigognes" "solutions de rangement"
  "multifonctionnels" "de rangement intelligent"
  "mieux vivre, mieux dormir, mieux respirer" "mieux vivre, mieux dormir, mieux respirer, mieux ranger"
  "optimisation d'espace" "solutions de rangement intelligent"
  "mobilier multifonctionnel" "meubles de rangement"
  "gain de place" "optimisation de rangement"
}}
```

#### **Advanced Transformation Functions**
```go
{{/* Multi-step transformation pipeline */}}
{{ define "transform-for-storage" }}
  {{ $content := . }}
  
  {{/* Step 1: Brand name transformations */}}
  {{ $content = $content | replaceRE "Le Lit Gigogne" "Lit à Tiroirs" }}
  
  {{/* Step 2: Product terminology */}}
  {{ $content = $content | replaceRE "lits gigognes" "solutions de rangement" }}
  {{ $content = $content | replaceRE "multifonctionnels" "de rangement intelligent" }}
  
  {{/* Step 3: Philosophy enhancement */}}
  {{ $content = $content | replaceRE "mieux vivre, mieux dormir, mieux respirer" "mieux vivre, mieux dormir, mieux respirer, mieux ranger" }}
  
  {{/* Step 4: Specialization terminology */}}
  {{ $content = $content | replaceRE "optimisation d'espace" "solutions de rangement intelligent" }}
  
  {{ return $content }}
{{ end }}
```

#### **Context-Aware Content Injection**
```go
{{/* Smart content composition with storage-specific additions */}}
{{ $base_content := .Site.GetPage "/shared/heritage/philosophie" }}
{{ $transformed := partial "transform-for-storage" $base_content.Content }}

<article class="heritage-philosophy">
  {{/* Inherited and transformed base content */}}
  {{ $transformed | safeHTML }}
  
  {{/* Storage-specific extensions */}}
  <section class="storage-specialization">
    <h3>Notre Spécialisation : L'Art du Rangement Intelligent</h3>
    <p>Cette expertise unique dans la création de meubles multifonctionnels nous a naturellement menés vers notre spécialisation : <strong>les solutions de rangement intelligentes</strong>.</p>
    
    <p><strong>Lit à Tiroirs</strong> naît de cet héritage exceptionnel, héritant de quarante années d'innovation dans l'art de <strong>"faire plus avec moins"</strong> – transformer chaque centimètre cube en opportunité d'organisation élégante.</p>
  </section>
</article>
```

### 3. Front Matter Inheritance System

#### **Inheritance Pattern Architecture**

**Parent Content Structure (Le Lit Gigogne):**
```yaml
# philosophie-heritage-artisanat.md
---
title: "Philosophie et Héritage"
company_foundation: 1984
core_philosophy: "Mieux vivre, mieux dormir, mieux respirer"

heritage_values:
  - name: "Excellence Artisanale"
    description: "Savoir-faire transmis depuis 40 ans"
    icon: "craftmanship"
  - name: "Innovation Respectueuse" 
    description: "Évolution dans le respect de la tradition"
    icon: "innovation"

metiers_art:
  - title: "L'Ébéniste"
    description: "Architecte du bois, maître des assemblages ancestraux"
    specializations: ["tenons-mortaises", "assemblages-chevillés"]
  - title: "Le Finisseur"
    description: "Magicien des surfaces et finitions expertes"
    specializations: ["ponçage-progressif", "finitions-naturelles"]

environmental_commitments:
  materials: "Pin massif des Landes certifié PEFC"
  production: "Fabrication sur commande, zéro gaspillage"
  warranties: "5 ans structure, 3 ans finitions"
---
```

**Child Content Extensions (Lit à Tiroirs):**
```yaml
# philosophie-rangement-intelligent.md
---
# Inheritance configuration
parent_content: "/shared/heritage/philosophie-heritage-artisanat"
inherit_sections: ["heritage_values", "environmental_commitments"]

# Enhanced philosophy
title: "Philosophie du Rangement Intelligent"
core_philosophy: "Mieux vivre, mieux dormir, mieux respirer, mieux ranger"

# Storage-specific specialization
storage_expertise:
  focus: "Solutions de rangement intelligent"
  specialization_years: 40
  innovations:
    - "Mécanismes silencieux à fermeture douce"
    - "Coulisses à billes haute résistance" 
    - "Optimisation volumétrique maximale"
    - "Intégration esthétique harmonieuse"

# Extended métiers d'art with storage specialists
storage_metiers:
  - title: "L'Ébéniste-Rangement"
    description: "Spécialiste des assemblages complexes pour structures à tiroirs multiples"
    base_metier: "L'Ébéniste"
    storage_specializations: 
      - "Assemblages renforcés pour tiroirs"
      - "Structures multi-niveaux"
      - "Intégration mécanismes coulissants"
  - title: "Le Mécanicien du Bois"
    description: "Expert des systèmes de coulissement et fermeture douce"
    storage_specific: true
    specializations:
      - "Coulisses à billes precision"
      - "Systèmes de fermeture amortie"
      - "Réglages et maintenance"

# Enhanced warranties for storage solutions
storage_warranties:
  structure: "10 ans - Garantie décennale sur robustesse structurelle"
  mechanisms: "5 ans - Coulisses et systèmes de fermeture" 
  parts_availability: "15 ans - Pièces de rechange garanties"
  maintenance: "Service à domicile et adaptation évolutive"
---
```

#### **Template Implementation for Front Matter Inheritance**
```go
{{/* Smart front matter composition template */}}
{{ $parent := .Site.GetPage (.Params.parent_content) }}
{{ $current := . }}

<article class="philosophy-complete">
  {{/* Inherited foundation with enhancement */}}
  <header class="foundation">
    <h1>{{ $current.Title }}</h1>
    <p class="since">Depuis {{ $parent.Params.company_foundation }}</p>
    <p class="core-philosophy">{{ $current.Params.core_philosophy }}</p>
  </header>

  {{/* Inherited heritage values */}}
  <section class="heritage-values">
    <h2>Nos Valeurs Héritées</h2>
    {{ range $parent.Params.heritage_values }}
      <div class="value inherited">
        <h3>{{ .name }}</h3>
        <p>{{ .description }}</p>
      </div>
    {{ end }}
    
    {{/* Storage-specific expertise */}}
    <div class="value specialized">
      <h3>{{ $current.Params.storage_expertise.focus }}</h3>
      <p>{{ $current.Params.storage_expertise.specialization_years }} ans d'expertise spécialisée</p>
      <ul>
        {{ range $current.Params.storage_expertise.innovations }}
          <li>{{ . }}</li>
        {{ end }}
      </ul>
    </div>
  </section>

  {{/* Enhanced métiers d'art composition */}}
  <section class="metiers-art">
    <h2>Nos Métiers d'Art</h2>
    
    {{/* Base métiers with storage extensions */}}
    {{ range $parent.Params.metiers_art }}
      <div class="metier base">
        <h3>{{ .title }}</h3>
        <p>{{ .description }}</p>
        
        {{/* Add storage specializations if available */}}
        {{ range $current.Params.storage_metiers }}
          {{ if eq .base_metier $.title }}
            <div class="storage-extension">
              <h4>Spécialisation Rangement</h4>
              <p>{{ .description }}</p>
              <ul>
                {{ range .storage_specializations }}
                  <li>{{ . }}</li>
                {{ end }}
              </ul>
            </div>
          {{ end }}
        {{ end }}
      </div>
    {{ end }}
    
    {{/* Pure storage-specific métiers */}}
    {{ range $current.Params.storage_metiers }}
      {{ if .storage_specific }}
        <div class="metier storage-only">
          <h3>{{ .title }}</h3>
          <p>{{ .description }}</p>
          <ul>
            {{ range .specializations }}
              <li>{{ . }}</li>
            {{ end }}
          </ul>
        </div>
      {{ end }}
    {{ end }}
  </section>

  {{/* Enhanced warranty structure */}}
  <section class="warranties">
    <h2>Nos Engagements Qualité</h2>
    
    {{/* Inherited base warranties */}}
    <div class="base-warranties">
      <p><strong>Matériaux :</strong> {{ $parent.Params.environmental_commitments.materials }}</p>
      <p><strong>Production :</strong> {{ $parent.Params.environmental_commitments.production }}</p>
    </div>
    
    {{/* Enhanced storage warranties */}}
    <div class="storage-warranties">
      <h3>Garanties Spécialisées Rangement</h3>
      {{ range $type, $description := $current.Params.storage_warranties }}
        <p><strong>{{ $type | title }} :</strong> {{ $description }}</p>
      {{ end }}
    </div>
  </section>
</article>
```

## Implementation Benefits

### **Content Management Efficiency**
- **Single source of truth** for Le Lit Gigogne heritage content
- **Automatic propagation** of updates from parent to child brand
- **Reduced maintenance burden** through systematic inheritance
- **Consistent quality** across brand family

### **Brand Coherence**
- **Shared heritage foundation** maintains authentic parent-child relationship
- **Specialized adaptations** clearly position Lit à Tiroirs storage expertise
- **Content depth** leverages Le Lit Gigogne's comprehensive content investment
- **Professional voice** maintains sophisticated French artisanal tone

### **Technical Advantages**
- **Hugo-native implementation** using standard Hugo modules system
- **Build-time optimization** with cached content inheritance
- **Flexible transformation** allowing contextual content adaptation
- **Scalable architecture** supporting multiple specialized brands

## Content Areas for Priority Implementation

### **High-Value Inheritance Candidates**

#### **1. Company Foundation & Heritage**
- **"Depuis 1984" story** - Direct inheritance with brand name transformation
- **Artisanal philosophy** - Inherit craftsmanship values, add storage specialization
- **French heritage narrative** - "Patrimoine vivant" and traditional techniques
- **Company evolution** - Adapt timeline to show storage specialization development

#### **2. Environmental & Quality Charter**
- **Sustainability principles** - Direct inheritance of environmental commitments
- **Material sourcing** - Pin massif des Landes, forest certification
- **Production philosophy** - Sur commande, zero waste principles
- **Quality guarantees** - Enhance with storage-specific warranty terms

#### **3. Artisanal Expertise**
- **Métiers d'art descriptions** - Inherit base crafts, add storage specialists
- **Workshop philosophy** - "Cathédrale du savoir-faire" with storage focus
- **Technical excellence** - Traditional techniques adapted for storage solutions
- **Innovation approach** - Respectful innovation in storage mechanism design

#### **4. Brand Values & Philosophy**
- **Core values** - Excellence, innovation, transmission with storage context
- **Customer philosophy** - Mieux-être approach enhanced with "mieux ranger"
- **Quality standards** - Durability, beauty, functionality with storage optimization
- **Service approach** - Personalization and sur mesure with storage expertise

## Implementation Roadmap

### **Phase 1: Foundation Setup**
1. **Hugo modules configuration** - Set up content mounting from Le Lit Gigogne
2. **Basic transformation pipeline** - Implement core brand and terminology transforms
3. **Template architecture** - Create inheritance-aware partial templates
4. **Testing framework** - Validate content transformation accuracy

### **Phase 2: Content Migration**
1. **Heritage content** - Migrate À Propos sections with inheritance system
2. **Quality validation** - Ensure natural French language flow
3. **Brand voice consistency** - Validate Lit à Tiroirs voice throughout
4. **Content completeness** - Ensure all necessary content is covered

### **Phase 3: Enhancement & Optimization**
1. **Advanced transformations** - Context-aware content injection
2. **Performance optimization** - Build-time caching and optimization
3. **Content workflows** - Establish update and review processes
4. **Documentation** - Complete technical and editorial documentation

### **Phase 4: Maintenance & Evolution**
1. **Monitoring system** - Track content inheritance health
2. **Update workflows** - Manage parent content changes
3. **Quality assurance** - Ongoing validation of content accuracy
4. **Evolution planning** - Support for additional specialized brands

## Success Metrics

### **Content Quality Indicators**
- **Language naturalness** - French content flows naturally after transformation
- **Brand voice consistency** - Lit à Tiroirs maintains distinct specialized voice
- **Content completeness** - All necessary brand information covered
- **Technical accuracy** - Storage-specific details are precise and valuable

### **Operational Efficiency Metrics**
- **Content reuse percentage** - Amount of content inherited vs. custom created
- **Update propagation time** - Speed of parent content changes reaching child brand
- **Maintenance effort reduction** - Decreased manual content management workload
- **Content consistency score** - Alignment between parent and child brand messages

## Conclusion

This content inheritance strategy creates a sophisticated content ecosystem where Lit à Tiroirs maintains its specialized storage focus while leveraging Le Lit Gigogne's rich heritage and quality content library. The implementation achieves both brand coherence and operational efficiency, creating a scalable foundation for the brand family's content management needs.

The refined approach with "mieux ranger" philosophy and corrected brand transformation logic ensures authentic French language use while maintaining the sophisticated technical implementation of the content inheritance system.