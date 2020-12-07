//
//  RightLickPopoverViewController.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit


protocol RightLickPopoverViewControllerProtocol: class {
    var actions: [RightLickPopover.Action] { get set }
    var completion: RightLickPopover.ActionCompletion { get set }
}

extension RightLickPopover {
    
    class RightLickPopoverView: UIView { }
    
    class RightLickPopoverViewController: UIViewController, RightLickPopoverViewControllerProtocol {
        
        var completion: RightLickPopover.ActionCompletion
        var actions: [RightLickPopover.Action]
        var items: [(height: CGFloat, view: UIView)] = []
        
        private var contentView: RightLickPopover.RightLickPopoverView = {
            let view = RightLickPopover.RightLickPopoverView()
            return view
        }()
        
        public required init(actions: [RightLickPopover.Action],
                             completion: @escaping RightLickPopover.ActionCompletion) {
            
            self.actions = actions
            self.completion = completion
            super.init(nibName: nil, bundle: nil)
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                self.navigationController?.isNavigationBarHidden = true
                self.view.layer.shadowColor = UIColor.white.withAlphaComponent(0.3).cgColor
            } else {
                self.navigationController?.isNavigationBarHidden = false
                self.view.backgroundColor = .white
            }
            
            self.view.addSubview(contentView)
            self.contentView.translatesAutoresizingMaskIntoConstraints = false
            if #available(iOS 11.0, *) {
                NSLayoutConstraint.activate([
                    contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
                ])
            } else {
                self.view = contentView
            }
            
            for action in actions {
                switch action {
                case .line:
                    let view = UIView()
                    view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
                    self.items.append((action.height,view))
                case .colors(let value):
                    let view = RightLickPopover.ColorButtonView(item: value)
                    view.titleLabel.text = action.title
                    self.items.append((action.height,view))
                case .suggested(let items):
                    let view = RightLickPopover.SuggestedView(items: items)
                    view.titleLabel.text = action.title
                    self.items.append((action.height,view))
                default:
                    let view = RightLickPopover.TitleButtonView(action: action)
                    self.items.append((action.height, view))
                }
            }
            
            for view in self.items {
                self.contentView.addSubview(view.view)
                view.view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            for (index, view) in self.items.enumerated() {
                view.view.heightAnchor.constraint(equalToConstant: view.height).isActive = true
                view.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
                view.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
                
                if view == self.items.first! {
                    view.view.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
                } else {
                    view.view.topAnchor.constraint(equalTo: self.items[index - 1].view.bottomAnchor, constant: 2).isActive = true
                }
                if view.view == self.items.last!.view {
                    view.view.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor).isActive = true
                }
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        public override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if UIDevice.current.userInterfaceIdiom == .pad {
                self.navigationController?.isNavigationBarHidden = true
                self.view.layer.shadowColor = UIColor.white.withAlphaComponent(0.3).cgColor
            } else {
                self.navigationController?.isNavigationBarHidden = false
                self.view.backgroundColor = .white
            }
        }
        
    }
}
