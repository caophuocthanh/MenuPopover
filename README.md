# MenuPopover

## Demo

<img sizes="(max-width: 320px) 100vw, 600px" src="https://github.com/caophuocthanh/MenuPopover/blob/main/Resources/Demo.png?raw=true"></img>

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

## Custom action 
You may custom action like below. Not depend on default action

```swift

// create action
        let actions: [RightLickPopover.Action] = [
            .title((1, "Open", UIColor.black, UIImage(named: "phone"))),
            .title((2, "Move/ Add", UIColor.black, UIImage(named: "phone"))),
            .space,
            .suggested(suggested),
            .space,
            .title((3, "Invite", UIColor.black, UIImage(named: "phone"))),
            .space,
            .title((4, "Make Schedule", UIColor.black, UIImage(named: "phone"))),
            .title((5, "Make Todo", UIColor.black, UIImage(named: "phone"))),
            .title((6, "Make Note", UIColor.black, UIImage(named: "phone"))),
            .space,
            .colors(colors),
            .space,
            .title((7, "Duplicate", UIColor.black, UIImage(named: "phone"))),
            .title((8, "Trash", UIColor.red, UIImage(named: "phone"))),
        ]


```

## Contact
- Email: caophuocthanh@gmail.com
- Site: https://onebuffer.com
- Linkedin: https://www.linkedin.com/in/caophuocthanh/
