# KDSegmentedControl


## About

A customizable segmented control for iOS swift version 4.0 and plus created by kedardesai.


## Features

* Variable number of items
* Configurable
* Designable into Interface Builder


## Requirements

* iOS 10.0
* swift 4.0

## Installation

### CocoaPods
```
pod 'KDSegmentedControl'
```

### Manual
Add the KDSegmentedControl.swift file to your project.


## Usage

### Programatically
```
let segmentControl: KDSegmentedControl = KDSegmentedControl(frame: CGRect(x: 20.0, y: 100.0, width: view.bounds.width - 40.0, height: 50.0))
segmentControl.items = ["Item 1", "Item 2", "Item 3"]
segmentControl.dropShadow = true // set it false if you dont want the shadow for selected thumb view.
segmentControl.thumbColor = .green
segmentControl.cornerRadius = 10.0
segmentControl.selectedIndex = -1 // -1 in case if you dont want to select any index.
segmentControl.backgroundColor = .lightGray
segmentControl.delegate = self
view.addSubview(segmentControl)
```

### Interface Builder
Add a UIView from interface builder and set it's class to KDSegmentedControl. You can customize the control directly from the interface builder.


## Properties

### selectedIndex
If you set selectedIndex as -1, It will deselect all the items in segmented control. The default value is 0.
```
segmentControl.selectedIndex = -1
```

### defaultTextFont
This defines default text font for the segmented control's items. Default value is UIFont.systemFont(ofSize: 12.0)
```
segmentControl.defaultTextFont = <font> // set any UIFont. 
```

### selectedTextFont
This defines text font only for the selected segment in segmented control. Default value is UIFont.systemFont(ofSize: 12.0)
```
segmentControl.selectedTextFont = <font> // set any UIFont. 
```

### defaultTextColor
This defines text color for the segmented control's items. Default value is UIColor.black
```
segmentControl.defaultTextColor = <color> // set any UIColor. 
```

### selectedTextColor
This defines text color for the selected segment in segmented control. Default value is UIColor.white
```
segmentControl.selectedTextColor = <color> // set any UIColor. 
```

### thumbColor
This defines overlay color for the selected segment in segmented control. Default value is UIColor.clear.
```
segmentControl.thumbColor = <color> // set any UIColor. 
```

### thumbShadowColor
This defines overlay's shadow color for the selected segment in segmented control. Default value is UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
```
segmentControl.thumbShadowColor = <color> // set any UIColor. 
```

### dropShadow
This property can be used to drop shadow for the thumbview. Default value is true. If you set it false it will not show the shadow for thumbview (overalay view for selected segment)
```
segmentControl.dropShadow = false 
```

### cornerRadius
This property defines the corner radius for segmented control as well as thumbview. As of now, you can not set different corner radius for segmented control and thumbview. Default value is 0.
```
segmentControl.cornerRadius = 10.0 
```

### borderColor
This property defines the border color for segmented control. Unlike cornerRadius this doesn't apply to thumbview. Default value is UIColor.white.
```
segmentControl.borderColor = .black 
```

### borderWidth
This property defines the border width for segmented control. Default value is 0.0.
```
segmentControl.borderWidth = 1.0 
```

### padding
This property defines the padding between segmented control and thumbview. Default value is 5.0.
```
segmentControl.padding = 0.0 
```

### items
This defines the array of items in segmented control.
```
segmentControl.items = ["Male", "Female", "Other"] 
```

## Delegate

### Methods available
As of now, delegate has only one method which will be called when user selects the segmented control.
```
func didSelectItem(atIndex index: Int, item: String) 
```

### How to set delegate
First import KDSegmentedControlDelegate in your class.

```
class ViewController: UIViewController, KDSegmentedControlDelegate {
}
```

Then just use delegate property of segment control. 
```
segmentControl.delegate = self
```

### How to implement delegate method
```
func didSelectItem(atIndex index: Int, item: String) {
    print("didSelectItem(atIndex index: \(index), item: \(item)")
}
```


## Contribution

You can help us to improve this control. If you have any suggestions or any issues just create an issue in github we will try to respond in 24 hours. You can also mail us at kedar.dwl@gmail.com. 


## License

KDSegmentedControl is available under the MIT license. See the LICENSE file for more info.
