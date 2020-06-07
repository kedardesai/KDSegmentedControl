# KDSegmentedControl



## About
A customizable segmented control for iOS swift version 4.0 and plus created by kedardesai.


## Features
* Variable number of items
* Configurable
* Designable into Interface Builder


## Requirements
* swift 4.0

## Installation

### CocoaPods
```
Pod 'KDSegmentedControl'
```

### Manual
Add the KDSegmentedControl.swift file to your project.


## Usage

### Programatically
```
let segmentedControl: KDSegmentedControl = KDSegmentedControl(frame: CGRect(x: 20.0, y: 100.0, width: view.bounds.width - 40.0, height: 50.0))
segmentedControl.items = ["Item 1", "Item 2", "Item 3"]
segmentedControl.thumbColor = .green
segmentedControl.backgroundColor = .gray
segmentedControl.dropShadow = true // set it false if you dont want the shadow for selected thumb view.
segmentedControl.selectedIndex = -1 // -1 in case if you dont want to select any index.
segmentedControl.delegate = self
view.addSubview(segmentedControl)
```

### Interface Builder
Add a UIView from interface builder and set it's class to KDSegmentedControl. You can customize the control directly from the interface builder.


## Use of selectedIndex

If you set selectedIndex as -1, It wont select any index in segment control.


## Contribution
You can help us to improve this control. If you have any suggestions or any issues just create an issue in github we will try to respond in 24 hours.


## License
KDSegmentedControl is available under the MIT license. See the LICENSE file for more info.
