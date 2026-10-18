---
name: Sprite-Studio
description: A warm, focused workbench for frame-by-frame sprite editing.
colors:
  canvas-ground: "#171a18"
  panel-surface: "#202421"
  panel-raised: "#292e2a"
  line-subtle: "#343a35"
  ink-primary: "#e9ede8"
  ink-secondary: "#a3ada4"
  accent-clay: "#e68a65"
  accent-soft: "#f0a17a"
  preview-paper: "#e8e8e4"
typography:
  display:
    fontFamily: "Manrope, DM Sans, sans-serif"
    fontSize: "23px"
    fontWeight: 750
    lineHeight: 1.2
    letterSpacing: "-0.04em"
  body:
    fontFamily: "DM Sans, Arial, sans-serif"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: "normal"
  data:
    fontFamily: "Cascadia Code, Consolas, monospace"
    fontSize: "11px"
    fontWeight: 400
    lineHeight: 1.4
    letterSpacing: "normal"
rounded:
  sm: "5px"
  md: "7px"
  lg: "10px"
spacing:
  compact: "8px"
  control: "13px"
  section: "19px"
components:
  button-primary:
    backgroundColor: "{colors.accent-clay}"
    textColor: "{colors.canvas-ground}"
    rounded: "{rounded.md}"
    padding: "0 12px"
    height: "33px"
  button-quiet:
    backgroundColor: "{colors.panel-raised}"
    textColor: "{colors.ink-primary}"
    rounded: "{rounded.md}"
    padding: "0 12px"
    height: "33px"
---

# Design System: Sprite-Studio

## Overview

**Creative North Star: "The maker's bench"**

Sprite-Studio is a compact, calm editing surface where image work stays in focus. Graphite panels reduce glare around the transparent canvas, while clay accents mark the active tool and the main action. The interface treats the sprite itself as the subject; panels stay quiet and controls stay close to the work they affect.

The checkerboard preview uses a light paper tone so transparent pixels remain clear against the dark workspace. The Palomin sample appears only as working content, not as a visual theme that future sprite projects must inherit.

**Key Characteristics:**
- Dark, low-glare work surfaces with clear tonal separation
- Warm clay accent used for active and primary actions
- A neutral checkerboard for transparency
- Compact but legible controls around a large central canvas

## Colors

The palette uses graphite surfaces and warm clay for focus, with a light neutral checkerboard behind art.

### Primary
- **Clay Accent** (#e68a65): Primary export action, active tool, and key selected states.
- **Soft Clay** (#f0a17a): Hover and emphasis states.

### Neutral
- **Canvas Ground** (#171a18): Main workspace background.
- **Panel Surface** (#202421): Top bar, tool rail, timeline, and inspector.
- **Raised Panel** (#292e2a): Layer rows and inset controls.
- **Subtle Line** (#343a35): Panel boundaries and separators.
- **Primary Ink** (#e9ede8): Headings and important labels.
- **Secondary Ink** (#a3ada4): Supporting text and less prominent controls.
- **Preview Paper** (#e8e8e4): Checkerboard transparency preview.

### Named Rules
**The Artifact-First Rule.** The canvas remains the visual center; chrome supports editing without competing with the sprite.

**The Clay Signal Rule.** Reserve clay for an action, selected state, or focus that needs the user's attention.

## Typography

**Display Font:** Manrope (with DM Sans fallback)  
**Body Font:** DM Sans (with Arial fallback)  
**Label/Mono Font:** Cascadia Code (with Consolas fallback)

**Character:** Manrope gives concise editor headings a firm silhouette. DM Sans keeps dense controls readable; monospace is reserved for frame numbers, dimensions, and color values.

### Hierarchy
- **Display** (750, 23px, 1.2): Opening state title.
- **Headline** (700, 13px, 1.3): Inspector and dialog headings.
- **Title** (650, 11–12px, 1.3): Tool labels, document and timeline titles.
- **Body** (400, 13px, 1.5): Supporting copy and main app text.
- **Label** (500, 11px, 1.4): Compact controls and properties.
- **Data** (400, 11px, 1.4): Frame indices, dimensions, and color codes.

## Layout

A fixed-height top bar anchors project and export actions. Below it, the workspace uses a narrow vertical tool rail, flexible central canvas and timeline, and a 274px inspector. Panels scroll independently where their content exceeds the available height. At narrower desktop widths the rail and inspector contract while the canvas keeps priority.

## Elevation & Depth

Tonal panel steps, fine borders, and a soft shadow under the artwork separate regions. Use shadows for the canvas preview or dialogs; use borders for tool and inspector boundaries. Keep the working panels flat.

## Shapes

Controls use compact 5–7px radii, with a slightly larger 10px dialog radius. Avoid large pills for editor controls; reserve rounded ends for small toggles and indicators.

## Components

- **Primary button:** Clay filled, dark ink text, compact height. Use for export and opening the project.
- **Quiet button:** Raised panel with a subtle border. Use for supporting actions.
- **Tool button:** Icon above a short label. Clay text and raised background indicate selection.
- **Layer row:** Toned inset strip with a clear selected border and a small checkerboard thumbnail.
- **Canvas preview:** Light checkerboard behind transparent PNG pixels; zoom changes the image scale without changing source pixels.
- **Timeline frame:** Repeated thumbnail strip with an accent border around the active frame.

## Do's and Don'ts

- Keep keyboard shortcuts visible near their controls where space allows.
- Use the same accent for primary actions and active editing state.
- Keep dimensions and frame indices in monospace.
- Don't use the sample character as decoration on unrelated projects.
- Don't use color alone to communicate canvas selection; pair it with an outline.
- Don't use a heavy shadow on every panel.

