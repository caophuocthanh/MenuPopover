//
//  TitleButtonView.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

protocol RightLickPopoverTitleButtonViewDelegate: class {
    func titleButtonView(view: RightLickPopover.TitleButtonView, action: RightLickPopover.Action)
}

extension RightLickPopover {
    
    class TitleButtonView: UIButton {
        
        weak var delegate: RightLickPopoverTitleButtonViewDelegate?
        
        private var action: RightLickPopover.Action!
        
        convenience init(action: RightLickPopover.Action) {
            self.init(frame: .zero)
            self.action = action
            if case let RightLickPopover.Action.title(value) = action {
                self.textLabel.text = value.title
                self.textLabel.textColor = value.color
                self.iconImageView.image = value.icon?.withRenderingMode(.alwaysTemplate)
                self.iconImageView.tintColor = value.color
            }
        }
        
        private let textLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()

        private let iconImageView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.addSubview(textLabel)
            self.addSubview(iconImageView)
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
            self.iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
            self.iconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
            self.iconImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
            
            self.textLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: 16).isActive = true
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
            self.textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            self.textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            
            self.addTarget(self, action: #selector(tap), for: .touchUpInside)
        }
        
        @objc dynamic private func tap() {
            func pulsate(_ view: UIView) {
                let pulse = CASpringAnimation(keyPath: "transform.scale")
                pulse.duration = 0.05
                pulse.fromValue = 0.98
                pulse.toValue = 1.0
                pulse.autoreverses = true
                pulse.repeatCount = 1
                pulse.initialVelocity = 0.5
                pulse.damping = 0.3
                view.layer.add(pulse, forKey: "pulse")
            }
            pulsate(self)
            self.delegate?.titleButtonView(view: self, action: self.action)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
}
