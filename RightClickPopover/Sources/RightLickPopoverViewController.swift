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
                case .space(let value):
                    let view = UIView()
                    view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
                    self.items.append((value, view))
                case .colors(let value):
                    let view = RightLickPopover.ColorButtonView(item: value)
                    view.titleLabel.text = action.text
                    view.delegate = self
                    self.items.append((action.height,view))
                case .suggested(let value):
                    let view = RightLickPopover.SuggestedView(items: value)
                    view.delegate = self
                    view.titleLabel.text = action.text
                    self.items.append((action.height,view))
                default:
                    let view = RightLickPopover.TitleButtonView(action: action)
                    self.items.append((action.height, view))
                    view.delegate = self
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

extension RightLickPopover.RightLickPopoverViewController: RightLickPopoverTitleButtonViewDelegate {
    
    func titleButtonView(view: RightLickPopover.TitleButtonView, action: RightLickPopover.Action) {
        self.completion(action, "")
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension RightLickPopover.RightLickPopoverViewController: RightLickPopoverColorButtonViewDelegate {
    
    func colorButtonView(view: RightLickPopover.ColorButtonView, color: String) {
        guard let index = self.items.map({ $0.view }).firstIndex(where: { $0 == view}) else { return }
        self.completion(self.actions[index], color)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}


extension RightLickPopover.RightLickPopoverViewController: RightLickPopoverSuggestedViewDelegate {
    
    func suggestedView(view: RightLickPopover.SuggestedView, suggested: RightLickPopover.Suggested) {
        guard let index = self.items.map({ $0.view }).firstIndex(where: { $0 == view}) else { return }
        self.completion(self.actions[index], suggested.id)
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
