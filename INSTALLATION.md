
# Color Modal Installation Instructions

## Files Created:
1. color-modal-trigger.html - Floating button to open modal
2. color-modal-finishes.html - Classic finishes tab
3. color-modal-water-tints.html - Water-based tints tab
4. color-modal-ral.html - RAL color system tab
5. color-modal-guide.html - Color selection guide

## Installation Steps:

1. Copy all files to your Hugo project:
   ```bash
   cp layouts/partials/color-modal-*.html /path/to/your/hugo/layouts/partials/
   ```

2. Ensure your data files exist:
   - data/colors/finishes.json
   - data/colors/water-tints.json
   - data/colors/ral-colors.json

3. Test the modal:
   ```bash
   hugo server -D
   ```

4. Visit http://localhost:1313/test/modal-test/

## Next Steps:
- Download color images locally
- Update image URLs in JSON files
- Test on actual product pages
- Refine styling as needed
