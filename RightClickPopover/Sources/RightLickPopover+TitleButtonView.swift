//
//  TitleButtonView.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension RightLickPopover {
    
    class TitleButtonView: UIButton {
        
        convenience init(action: RightLickPopover.Action) {
            self.init(frame: .zero)
            self.textLabel.text = action.title
            self.textLabel.textColor = action.tintColor
            self.iconImageView.image = action.image?.withRenderingMode(.alwaysTemplate)
            self.iconImageView.tintColor = action.tintColor
        }
        
        private let textLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        private let lineView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            return view
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
            self.addSubview(lineView)
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            lineView.translatesAutoresizingMaskIntoConstraints = false
            
            self.iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
            self.iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
            self.iconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
            self.iconImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
            
            self.textLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: 16).isActive = true
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
            self.textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            self.textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2).isActive = true
            self.lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
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
            print("tap:", self.textLabel.text ?? "")
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
}
