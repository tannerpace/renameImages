#!/bin/bash

# List of image names
imageNames=(
  "charleston-custom-home-builder"
  "home-renovations-charleston-sc"
  "kitchen-remodeling-charleston"
  "bathroom-renovations-charleston"
  "charleston-home-construction"
  "charleston-house-renovation"
  "home-remodeling-charleston-sc"
  "custom-home-design-charleston"
  "charleston-exterior-renovations"
  "interior-remodeling-charleston-sc"
  "charleston-home-additions"
  "bathroom-remodel-charleston-sc"
  "charleston-kitchen-renovations"
  "charleston-room-additions"
  "outdoor-living-charleston-sc"
  "charleston-home-improvements"
  "charleston-architecture-design"
  "charleston-historic-home-renovation"
  "charleston-pool-construction"
  "charleston-modern-home-design"
  "charleston-landscape-design"
  "charleston-basement-remodeling"
  "charleston-green-home-builder"
  "charleston-deck-construction"
  "charleston-custom-cabinets"
  "charleston-home-restoration"
  "charleston-home-renovation-contractor"
  "charleston-outdoor-kitchens"
  "charleston-additional-room-builder"
  "charleston-remodeling-contractor"
  "charleston-home-extensions"
  "charleston-fireplace-renovations"
  "charleston-beach-house-builder"
  "charleston-commercial-renovations"
  "charleston-historic-preservation"
  "charleston-attic-conversions"
  "charleston-architectural-details"
  "charleston-renovation-services"
  "charleston-home-makeovers"
  "charleston-modern-kitchen-design"
  "charleston-luxury-home-builder"
  "charleston-porch-construction"
  "charleston-dock-construction"
  "charleston-outdoor-kitchen-design"
  "charleston-dock-renovation"
  "charleston-outdoor-living-spaces"
  "charleston-dock-builder"
  "charleston-outdoor-entertainment-area"
  "charleston-dock-maintenance"
  "charleston-outdoor-kitchen-builder"
  "charleston-dock-extensions"
  "charleston-outdoor-kitchen-remodel"
  "charleston-dock-design"
  "charleston-outdoor-kitchen-renovation"
  "charleston-dock-repair"
  "charleston-outdoor-kitchen-contractor"
  "charleston-dock-restoration"
  "charleston-outdoor-kitchen-makeover"
  "charleston-dock-enhancements"
  "charleston-outdoor-kitchen-upgrade"
  "charleston-dock-upgrades"
  "charleston-outdoor-kitchen-expansion"
  "charleston-dock-improvements"
  "charleston-outdoor-kitchen-customization"
  "charleston-dock-remodeling"
  "charleston-outdoor-kitchen-additions"
)


IFS=$'\n' read -d '' -r -a selectedPhotos < <(osascript -e 'tell application "Finder" to set theFiles to choose file with multiple selections allowed')
if [ ${#selectedPhotos[@]} -eq 0 ]; then
  echo "No photos selected. Exiting..."
  exit 0
fi


if [ ${#selectedPhotos[@]} -gt ${#imageNames[@]} ]; then
  echo "The number of selected photos is greater than the number of image names."
  echo "Only the first ${#imageNames[@]} photos will be renamed."
fi


for (( i=0; i<${#selectedPhotos[@]} && i<${#imageNames[@]}; i++ )); do
  directory=$(dirname "${selectedPhotos[i]}")
  extension="${selectedPhotos[i]##*.}"
  newFileName="$directory/${imageNames[i]}.$extension"
  mv "${selectedPhotos[i]}" "$newFileName"
  echo "Renamed ${selectedPhotos[i]} to $newFileName"
done

echo "Photos renamed successfully."
exit 0
