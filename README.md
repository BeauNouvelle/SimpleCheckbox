![](demo/images/banner.png)

SimpleCheckbox aims to accomplish what other ios checkbox controls haven't. To be simple. There's no animations, no IBDesignable to slow down interface builder, and no performance heavy draw methods.

# 🎉 Features

 📒 Documentation
 
 ⚖️ Carefully tuned default values.

# ✅ Requirements

* Xcode 11
* iOS 10+
* Swift 5.1

# 👨‍💻 Installation

### Manual

Just drag Checkbox.swift into your project to start using it.

### Carthage
- Add `github "BeauNouvelle/SimpleCheckbox"` to your `Cartfile`.

You can learn more about Carthage and get help setting it up [here](https://github.com/Carthage/Carthage/).

### Cocoapods
- Add pod `SimpleCheckbox` to your pod file.
- Add `import SimpleCheckbox` to the top of your files in where you wish to use it.

### Swift Package Manager
> Would love some help with this one.

# 👩‍🍳 Usage

You can create a new Checkbox either programatically:
```swift
let checkbox = Checkbox(frame: CGRect(x: 50, y: 50, width: 25, height: 25))
```
Or using interface builder by dragging a `UIView` into your view controller and assigning its class to `Checkbox`. 

After hooking up an outlet you can begin customization.


# 👩‍🎨 Customization

## Border

### Border Color
```swift
checkbox.checkedBorderColor = .blue
checkbox.uncheckedBorderColor = .black
```
### Border Style
```swift
checkbox.borderStyle = .circle
checkbox.borderStyle = .square
```

## Checkmark

### Checkmark Color
```swift
checkbox.checkmarkColor = .blue
```
### Checkmark Style
```swift
checkbox.checkmarkStyle = .circle
checkbox.checkmarkStyle = .square
checkbox.checkmarkStyle = .cross
checkbox.checkmarkStyle = .tick
```

## Haptic Feedback
```swift
checkbox.useHapticFeedback = true
```

## Events
There are two methods for detecting when a tap event has occured and the `isChecked` property has changed.

### Add Target
```swift
checkbox.addTarget(self, action: #selector(checkboxValueChanged(sender:)), for: .valueChanged)

.......

@objc func checkboxValueChanged(sender: Checkbox) {
    print("checkbox value change: \(sender.isChecked)")
}
```       
### Closure
```swift
checkbox.valueChanged = { (isChecked) in
    print("checkbox is checked: \(isChecked)")
}
```

## Touch Area
Checkboxs can sometimes appear smaller than their UIButton and UISwitch counterparts which can make them difficult to activate. 

SimpleCheckbox has a way for you to tune the touch raduis to extend beyond its frame. Setting increasedTouchRadius will increase the touch radius by that amount.

```swift
checkbox.increasedTouchRadius = 5 // Default
```


# 🎩 Fancy Alternatives
[**Objective C** — BEMCheckbox](https://github.com/Boris-Em/BEMCheckBox)

[**Swift** — M13Checkbox](https://github.com/Marxon13/M13Checkbox)

### Cocoapods
> I'm unable to continue supporting cocoapods with this project as I no longer have access the email account that was registered with this pod. All attempts to contact the cocoapods team to claim SimpleCheckbox pod have been ignored.
