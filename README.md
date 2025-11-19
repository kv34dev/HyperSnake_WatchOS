# HyperSnake — Apple Watch Edition

HyperSnake is a minimalist, fast-paced Snake game designed specifically for the Apple Watch.  
This project is a complete WatchOS port of my original Python version of the game (available here: [Python HyperSnake Repository](https://github.com/kv34dev/HyperSnake)).

![photo-output](https://github.com/user-attachments/assets/6476af88-6e80-460c-a95b-4cfc496ecc9b)

The interface, color selection menu, difficulty system, and overall style faithfully replicate the Python version while being fully optimized for Apple Watch controls and performance.

## Game Overview

Your goal is simple: eat food, grow longer, and avoid colliding with walls or your own body.

This version is built with **SwiftUI** and uses:
- Digital Crown scrolling support  
- Swipe gestures for movement  
- A compact UI optimized for 41 mm / 45 mm / 46 mm / 49 mm Apple Watch  
- Smooth, timer-based game loop  
- Customizable colors and difficulty levels  

## Features

### Color Customization
Choose between 9 snake colors — identical to the desktop/Python version.

### Difficulty Levels
Available difficulty modes:
- Easy  
- Normal  
- Hard  

Each difficulty changes the snake’s speed.

### Digital Crown-Based Movement
Control the snake by rotating the Digital Crown on your Apple Watch:
- Rotate clockwise → turn the snake 90° clockwise  
- Rotate counterclockwise → turn the snake 90° counterclockwise  

Each rotation of the crown corresponds to a single turn of the snake.

### Digital Crown Navigation
All menus support scrolling using the **Digital Crown** for a smooth watch interface experience.


## How to Install & Run

1. Clone the repository:
```
git clone https://github.com/kv34dev/HyperSnake_WatchOS
```
2. Open the project in Xcode.
3. Connect your Apple Watch or use an Apple Watch simulator.
4. Build & Run the WatchOS target.

## Project Structure
```
/HyperSnakeWatchApp
  ├── ColorSelectionView.swift
  ├── DifficultyView.swift
  ├── GameView.swift
  ├── HyperSnakeApp.swift
  └── Assets.xcassets
        ├── AccentColor.colorset
        │     └── Contents.json
        └── AppIcon.appiconset
              ├── icon.png
              └── Contents.json

```
