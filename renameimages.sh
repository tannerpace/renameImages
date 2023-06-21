#!/bin/bash

imageNames=(
  "charleston-custom-home-builder.jpg"
  "home-renovations-charleston-sc.jpg"
  "kitchen-remodeling-charleston.jpg"
  "bathroom-renovations-charleston.jpg"
  "charleston-home-construction.jpg"
  "charleston-house-renovation.jpg"
  "home-remodeling-charleston-sc.jpg"
  "custom-home-design-charleston.jpg"
  "charleston-exterior-renovations.jpg"
  "interior-remodeling-charleston-sc.jpg"
  "charleston-home-additions.jpg"
  "bathroom-remodel-charleston-sc.jpg"
  "charleston-kitchen-renovations.jpg"
  "charleston-room-additions.jpg"
  "outdoor-living-charleston-sc.jpg"
  "charleston-home-improvements.jpg"
  "charleston-architecture-design.jpg"
  "charleston-historic-home-renovation.jpg"
  "charleston-pool-construction.jpg"
  "charleston-modern-home-design.jpg"
  "charleston-landscape-design.jpg"
  "charleston-basement-remodeling.jpg"
  "charleston-green-home-builder.jpg"
  "charleston-deck-construction.jpg"
  "charleston-custom-cabinets.jpg"
  "charleston-home-restoration.jpg"
  "charleston-home-renovation-contractor.jpg"
  "charleston-outdoor-kitchens.jpg"
  "charleston-additional-room-builder.jpg"
  "charleston-remodeling-contractor.jpg"
  "charleston-home-extensions.jpg"
  "charleston-fireplace-renovations.jpg"
  "charleston-beach-house-builder.jpg"
  "charleston-commercial-renovations.jpg"
  "charleston-historic-preservation.jpg"
  "charleston-attic-conversions.jpg"
  "charleston-architectural-details.jpg"
  "charleston-renovation-services.jpg"
  "charleston-home-makeovers.jpg"
  "charleston-modern-kitchen-design.jpg"
  "charleston-luxury-home-builder.jpg"
  "charleston-porch-construction.jpg"
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
