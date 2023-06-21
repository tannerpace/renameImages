#!/bin/bash

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
)


IFS=$'\n' read -d '' -r -a selectedPhotos < <(osascript -e 'tell application "Finder" to set theFiles to choose file with multiple selections allowed')
if [ ${#selectedPhotos[@]} -eq 0 ]; then
  echo "No photos selected. Exiting..."
  exit 0
fi


for (( i=0; i<${#selectedPhotos[@]}; i++ )); do
  directory=$(dirname "${selectedPhotos[i]}")
  extension="${selectedPhotos[i]##*.}"
  newFileName="$directory/${imageNames[i]}.$extension"
  mv "${selectedPhotos[i]}" "$newFileName"
  echo "Renamed ${selectedPhotos[i]} to $newFileName"
done

echo "Photos renamed successfully."
exit 0
