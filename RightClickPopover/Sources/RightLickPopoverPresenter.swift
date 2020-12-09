//
//  Presenter.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension UIView {
    
    var topViewController: UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        var result: UIViewController? = nil
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            result = topController
        }
        return result
    }
    
    func present(actions: [RightLickPopover.Action], sourceView: UIView, completion: @escaping RightLickPopover.ActionCompletion) {
        guard let controller = sourceView.topViewController else { return }
        controller.present(actions: actions, sourceView: sourceView, completion: completion)
    }
        
}

extension UIViewController {
        
    func present(actions: [RightLickPopover.Action], sourceView: UIView, completion: @escaping RightLickPopover.ActionCompletion) {
        
        let popover: RightLickPopover.RightLickPopoverViewController = RightLickPopover.RightLickPopoverViewController(actions: actions, completion: completion)
        
        let nav = UINavigationController(rootViewController: popover)
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        
        let width: CGFloat = 380
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            var height: CGFloat = 0
            for action in actions {
                height += action.height
            }
            popover.preferredContentSize = CGSize(width: width,height: height - 20)
            if let popover = nav.popoverPresentationController {
                popover.permittedArrowDirections = [.left, .right]
                popover.sourceView = sourceView
                popover.sourceRect = sourceView.bounds
            }
            nav.modalPresentationStyle = .formSheet
        } else {
            nav.modalPresentationStyle = .formSheet
        }
        self.present(nav, animated: (UIDevice.current.userInterfaceIdiom == .pad), completion: nil)
    }
}

