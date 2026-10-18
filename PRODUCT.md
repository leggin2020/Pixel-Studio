# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack
Plain HTML, CSS, and JavaScript, as chosen by the user.

## Users
Sprite creators and illustrators editing transparent PNG frames in local folders.

## Product Purpose
Sprite-Studio imports sprite folders and their JSON metadata, edits individual frames, previews animations, and exports the set in a portable folder archive. Success means creators can review and make common raster edits in one sprite workflow.

## Positioning
A frame-aware editor centered on a folder of independent PNG sprites and its accompanying metadata, with animation preview and same-structure export in one workspace.

## Operating Context
The app runs locally in a modern browser. Users open a sprite folder, select frames, edit on a transparency-aware canvas, preview sequences, and export a ZIP. The previously corrected Palomin folder is supplied as a sample project.

## Capabilities and Constraints
Confirmed: directory import of PNGs and JSON, individual frame editing, common drawing and shape tools, selection and crop, layer masks, an adjustable size-aware eraser, transparent-background bucket fill, selected-region edge cleanup, zoom, animation playback, and folder-structured export. The sample JSON defines an atlas of 113 frames at 256×256, arranged in 10 columns and 12 rows, with a default 24 fps rate. The app should support similarly structured sprite collections. Desktop is the primary editing context; smaller screens should retain access to the workspace.
Open decision: advanced vector path editing, color-managed workflows, PSD compatibility, and collaborative/cloud editing are not established requirements.

## Evidence on Hand
Latest corrected Palomin sprite set copied to public/samples/palomin: 113 individual 256×256 PNG files and palomin_sprites.json. The images are the user's supplied assets.

## Product Principles
- Keep the frame and its source file visible while editing.
- Make transparency and selection state easy to read.
- Preserve filenames, folder paths, and companion metadata on export.
- Put animation playback beside the frame workflow.
- Make controls understandable without relying on hidden shortcuts.

