//
//  ViewController.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Action Tap Popup
    
    var items: [RightClickPopupPresenter]  = {
        
        // setup color
        let colors: (String, [String]) = (UIColor.green.hex, [
            UIColor.orange.hex,
            UIColor.blue.hex,
            UIColor.green.hex,
            UIColor.purple.hex,
            UIColor.systemPink.hex,
            UIColor.gray.hex,
            UIColor.yellow.hex,
            UIColor.brown.hex,
            UIColor.red.hex
        ])
        
        // setup suggested
        let suggested: [(String, String)] = [("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]
        
        return [
            .bookmark,
            .contact(suggested),
            .email(suggested),
            .event(suggested, colors),
            .note(suggested),
            .todo(suggested)
        ]
    }()
    
    
    @objc dynamic private func tap(button: UIButton) {
        
        self.present(type: self.items[button.tag], sourceView: button) { (action, value) in
            switch action {
            case .suggested(let tag, let title, _):
                print("selectecd suggested:", action, title, tag, value)
            case .colors(let tag, let title, _):
                print("selectecd color:", action, title, tag, value)
            case .title(let value):
                print("selectecd title:", action, value)
            default: break
            }
        }
    }
    
    // MARK: Life circle
    
    let backGroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ipadp.jpg")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    
    
    var itemViews: [UIButton] = []
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .red
        
        self.view.addSubview(self.backGroundImageView)
        self.backGroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.backGroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.backGroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.backGroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.backGroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        for (index, item) in self.items.enumerated() {
            let view = UIButton()
            view.tag = index
            view.setTitle(item.title, for: .normal)
            view.layer.cornerRadius = 4
            view.backgroundColor = UIColor.gray
            view.layer.masksToBounds = true
            view.titleLabel?.textAlignment = .center
            self.itemViews.append(view)
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for (index, view) in self.itemViews.enumerated() {
            view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
            if view == self.itemViews.first! {
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
            } else {
                view.leadingAnchor.constraint(equalTo: self.itemViews[index - 1].trailingAnchor, constant: 8).isActive = true
            }
            if view == self.itemViews.last! {
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true
            }
        }
        
        
        for (index, view) in self.itemViews.enumerated() {
            if view != self.itemViews.last! {
                view.widthAnchor.constraint(equalTo: self.itemViews[index + 1].widthAnchor).isActive = true
            } else {
                view.widthAnchor.constraint(equalTo: self.itemViews.first!.widthAnchor).isActive = true
            }
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        for view in self.itemViews {
            view.addTarget(self, action: #selector(tap(button:)), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

