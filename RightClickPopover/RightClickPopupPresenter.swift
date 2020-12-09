//
//  RightClickPopupPresenter.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

enum RightClickPopupPresenter {
    
    case email([RightLickPopover.Suggested])
    case todo([RightLickPopover.Suggested])
    case event([RightLickPopover.Suggested], RightLickPopover.Color)
    case contact([RightLickPopover.Suggested])
    case bookmark
    case note([RightLickPopover.Suggested])
    
    var title: String {
        switch self {
        case .email(_): return "Email"
        case .todo(_): return "Todo"
        case .event(_, _): return "Event"
        case .contact(_): return "Contact"
        case .bookmark: return "Bookmark"
        case .note(_): return "Note"
        }
    }
    
    var value: [RightLickPopover.Action] {
        

        switch self {
            
        case .email(let suggested):
            return [
                .title((1, "Open", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((2, "Move/ Add", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .suggested(1, "SUGGESTED",suggested),
                .space(6),
                .title((3, "Invite", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((4, "Make Schedule", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((5, "Make Todo", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((6, "Make Note", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((7, "Duplicate", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((8, "Trash", UIColor.red, UIImage(named: "phone"))),
            ]
            
        case .todo(let suggested):
            return [
                .title((1, "Open", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((2, "Move/ Add", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .suggested(1, "SUGGESTED",suggested),
                .space(6),
                .title((3, "Invite", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((4, "Make Schedule", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((5, "Make Todo", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((6, "Make Note", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((7, "Duplicate", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((8, "Trash", UIColor.red, UIImage(named: "phone"))),
            ]
            
        case .event(let suggested, let colors):
            return [
                .title((1, "Open", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((2, "Move/ Add", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .suggested(1, "SUGGESTED",suggested),
                .space(6),
                .title((3, "Invite", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((4, "Make Schedule", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((5, "Make Todo", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((6, "Make Note", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .colors(1, "COLORS", colors),
                .space(6),
                .title((7, "Duplicate", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((8, "Trash", UIColor.red, UIImage(named: "phone"))),
            ]
            
        case .contact(let suggested):
            return [
                .title((1, "Open", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((2, "Move/ Add", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .suggested(1, "SUGGESTED",suggested),
                .space(6),
                .title((3, "Invite", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((4, "Make Schedule", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((5, "Make Todo", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((6, "Make Note", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((7, "Duplicate", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((8, "Trash", UIColor.red, UIImage(named: "phone"))),
            ]
            
        case .bookmark:
            return [
                .title((1, "Open", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((2, "Move/ Add", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((3, "Invite", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((4, "Make Schedule", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((5, "Make Todo", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((6, "Make Note", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((7, "Duplicate", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((8, "Trash", UIColor.red, UIImage(named: "phone"))),
            ]
        case .note(let suggested):
            return [
                .title((1, "Open", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((2, "Move/ Add", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .suggested(1, "SUGGESTED", suggested),
                .space(6),
                .title((3, "Invite", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((4, "Make Schedule", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((5, "Make Todo", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((6, "Make Note", UIColor.black, UIImage(named: "phone"))),
                .space(6),
                .title((7, "Duplicate", UIColor.black, UIImage(named: "phone"))),
                .space(1),
                .title((8, "Trash", UIColor.red, UIImage(named: "phone"))),
            ]
        }
    }
}

extension UIView {
    
    func present(type: RightClickPopupPresenter, sourceView: UIView, completion: @escaping RightLickPopover.ActionCompletion) {
        guard let controller = sourceView.topViewController else { return }
        controller.present(actions: type.value, sourceView: sourceView, completion: completion)
    }
    
}

extension UIViewController {
    
    func present(type: RightClickPopupPresenter, sourceView: UIView, completion: @escaping RightLickPopover.ActionCompletion) {
        self.present(actions: type.value, sourceView: sourceView, completion: completion)
    }
}
