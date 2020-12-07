# MenuPopover

## Demo

## How to use

```swift

   @objc dynamic private func tap(button: UIButton) {
        self.presentEventPopup(at: button)
    }
    
    func presentEventPopup(at sourceView: UIView) {
        // setup color
        let colors: (String, [String]) = (UIColor.green.hex, [UIColor.orange.hex,
                                                              UIColor.blue.hex,
                                                              UIColor.green.hex,
                                                              UIColor.purple.hex,
                                                              UIColor.systemPink.hex,
                                                              UIColor.gray.hex,
                                                              UIColor.yellow.hex,
                                                              UIColor.brown.hex,
                                                              UIColor.red.hex])
        
        // setup suggested
        let suggested: [(String, String)] = [("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]
        
        // create action
        let actions: [RightLickPopover.Action] = [
            .open,
            .moveadd,
            .space,
            .suggested(suggested),
            .space,
            .invite,
            .space,
            .makeSchedule,
            .makeTodo,
            .makeNote,
            .space,
            .colors(colors),
            .space,
            .duplicate,
            .trash
        ]
        
        // present action
        self.present(actions: actions, sourceView: sourceView) { (action, value) in
            switch action {
            case .suggested(_):
                print("selectecd suggested:", action.title ?? "", value)
            case .colors(_):
                print("selectecd color:", action.title ?? "", value)
            default:
                print("selectecd action:", action.title ?? "")
            }
        }
    }

```
