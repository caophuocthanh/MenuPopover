//
//  SuggestedView.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit


protocol RightLickPopoverSuggestedViewDelegate: class {
    func suggestedView(view: RightLickPopover.SuggestedView, suggested: RightLickPopover.Suggested)
}

extension RightLickPopover {
    
    class SuggestedView: UIView {
        
        weak var delegate: RightLickPopoverSuggestedViewDelegate?
        
        private var items: [RightLickPopover.Suggested] = []
        private var itemViews: [UIButton] = []
        
        convenience init(items: [RightLickPopover.Suggested]) {
            self.init(frame: .zero)
            self.items = items
            self.reloadItems()
        }
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
        
        private func reloadItems() {
            self.itemViews.forEach { $0.removeFromSuperview() }
            self.itemViews.removeAll()
            
            for (index, item) in self.items.enumerated() {
                let view = UIButton()
                view.tag = index
                view.setTitle(item.title, for: .normal)
                view.setTitleColor(.black, for: .normal)
                view.layer.cornerRadius = 4
                view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                view.layer.masksToBounds = true
                view.layer.borderWidth = 1
                view.titleLabel?.textAlignment = .center
                self.itemViews.append(view)
                self.itemContentView.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            for (index, view) in self.itemViews.enumerated() {
                
                print("index:", index)
                view.heightAnchor.constraint(equalToConstant: 34).isActive = true
                view.centerYAnchor.constraint(equalTo: self.itemContentView.centerYAnchor, constant: 0).isActive = true
                
                if view == self.itemViews.first! {
                    view.leadingAnchor.constraint(equalTo: self.itemContentView.leadingAnchor, constant: 8).isActive = true
                } else {
                    view.leadingAnchor.constraint(equalTo: self.itemViews[index - 1].trailingAnchor, constant: 8).isActive = true
                }
                if view == self.itemViews.last! {
                    view.trailingAnchor.constraint(equalTo: self.itemContentView.trailingAnchor, constant: -8).isActive = true
                }
            }
            
            for (index, view) in self.itemViews.enumerated() {
                if view != self.itemViews.last! {
                    view.widthAnchor.constraint(equalTo: self.itemViews[index + 1].widthAnchor).isActive = true
                } else {
                    view.widthAnchor.constraint(equalTo: self.itemViews.first!.widthAnchor).isActive = true
                }
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
            self.delegate?.suggestedView(view: self, suggested: self.items[button.tag])
        }
        
        private let lineView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            return view
        }()
        
        private let itemContentView: UIView = {
            let view = UIView()
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.addSubview(titleLabel)
            self.addSubview(lineView)
            self.addSubview(itemContentView)
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.lineView.translatesAutoresizingMaskIntoConstraints = false
            self.itemContentView.translatesAutoresizingMaskIntoConstraints = false
            
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
            self.titleLabel.bottomAnchor.constraint(equalTo: self.itemContentView.topAnchor, constant: -8).isActive = true
            
            self.itemContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            self.itemContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            self.itemContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2).isActive = true
            self.lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}
