//
//  ViewController.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backGroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ipadp.jpg")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    var items: [RightLickPopover.DefaultData] = [.bookmark, .contact, .email, .event, .note, .todo]
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
    
    @objc dynamic private func tap(button: UIButton) {
        func pulsate(_ view: UIView) {
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.05
            pulse.fromValue = 0.95
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 1
            pulse.initialVelocity = 0.5
            pulse.damping = 0.3
            view.layer.add(pulse, forKey: "pulse")
        }
        pulsate(button)

        self.present(type: self.items[button.tag], sourceView: button) { (action) in
            print("JHSGKJFDHGSKFJFH:", action)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

