---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: false

# Product Information
product_family: "lits-tiroirs"
collection: ""
model_name: ""

# Pricing
price_starting: 0
price_currency: "€"
price_note: "Configuration de base"
custom_quote: true

# Storage Specifications
storage:
  drawer_count: 0
  capacity_level: "" # "haute-capacite", "compact", "max-capacite"
  drawer_dimensions: ""
  total_storage_volume: ""

# Capacity Indicator
capacity_indicator:
  label: "" # "Haute Capacité", "Compact", "Max Capacité"
  type: "" # "capacity-high", "capacity-compact", "capacity-medium"
  color_class: "" # "capacity-green", "storage-blue", "capacity-orange"

# Product Features
features:
  - icon: "tiroirs"
    label: ""
  - icon: "capacite" 
    label: ""
  - icon: "evolutif"
    label: ""
  - icon: "artisanal"
    label: ""

# Dimensions
dimensions:
  length: ""
  width: ""
  height: ""
  drawer_depth: ""

# Materials
materials:
  wood_type: "Pin massif"
  finish_options: []
  hardware: ""

# Product Gallery
gallery:
  main_image: ""
  images: []
  alt_text: ""

# SEO
seo:
  meta_description: ""
  keywords: []

# Product Detail Sections
sections:
  description:
    title: "Description"
    content: ""
  specifications:
    title: "Spécifications Techniques"
    content: ""
  storage_guide:
    title: "Guide Rangement"
    content: ""

# Content targeting
target_audience: ""
room_type: []
lifestyle_tags: []

# Product status
availability: "available" # available, pre-order, out-of-stock
lead_time: ""
customization_options: true
---

<!-- Product description in markdown -->