# SwipeGesture

## Usage
### Multi Direction APIs
```
YourView()
    .onSwipe(leftAction: {
        // do something in left swipe
    }, rightAction: {
        // do something in right swipe
    }, upAction: {
        // do something in up swipe
    }, downAction: {
        // do something in down swipe
    })
```

### Single Direction APIs
```
YourView()
    .onSwipeLeft {
        // do something in left swipe
    }
```

## Installation
Please install this package(https://github.com/yosshi4486/SwipeGesture) via SwiftPM, using Xcode GUI package manager.
