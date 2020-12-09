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
            .title((1, "Open", UIColor.black, UIImage(named: "phone"))),
            .title((2, "Move/ Add", UIColor.black, UIImage(named: "phone"))),
            .space(6),
            .suggested(suggested),
            .space(6),
            .title((3, "Invite", UIColor.black, UIImage(named: "phone"))),
            .space(6),
            .title((4, "Make Schedule", UIColor.black, UIImage(named: "phone"))),
            .title((5, "Make Todo", UIColor.black, UIImage(named: "phone"))),
            .title((6, "Make Note", UIColor.black, UIImage(named: "phone"))),
            .space(6),
            .colors(colors),
            .space(6),
            .title((7, "Duplicate", UIColor.black, UIImage(named: "phone"))),
            .title((8, "Trash", UIColor.red, UIImage(named: "phone"))),
        ]
        
        // present action
        self.present(actions: actions, sourceView: sourceView) { (action, value) in
            switch action {
            case .suggested(_):
                print("selectecd suggested:", action.text ?? "", value)
            case .colors(_):
                print("selectecd color:", action.text ?? "", value)
            case .title(let value):
                print("selectecd title:", action.text  ?? "", value.tag)
            default:
                print("selectecd action:", action.text ?? "")
            }
        }
    }
    
    
    // MARK: View Life Circle
    
//    @objc dynamic private func tap(button: UIButton) {
//        self.present(type: self.items[button.tag], sourceView: button) { (action, value) in
//            switch action {
//            case .suggested(_):
//                print("selectecd suggested:", action.title ?? "", value)
//            case .colors(_):
//                print("selectecd color:", action.title ?? "", value)
//            default:
//                print("selectecd action:", action.title ?? "")
//            }
//        }
//    }
    
    var items: [CustomPopupPresenterData] = [
        .bookmark,
        .contact,
        .email,
        .event,
        .note,
        .todo
    ]
    
    
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

