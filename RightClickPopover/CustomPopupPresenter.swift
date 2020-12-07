//
//  CustomPopupPresenter.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

enum CustomPopupPresenterData {
    
    case email
    case todo
    case event
    case contact
    case bookmark
    case note
    
    var title: String {
        switch self {
        case .email: return "Email"
        case .todo: return "Todo"
        case .event: return "Event"
        case .contact: return "Contact"
        case .bookmark: return "Bookmark"
        case .note: return "Note"
        }
    }
    
    var value: [RightLickPopover.Action] {
        switch self {
            
        case .email:
            return [
                .open,
                .moveadd,
                .space,
                .suggested([("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]),
                .reply,
                .replyAll,
                .forward,
                .markAsJunk,
                .markAsRead,
                .space,
                .makeSchedule,
                .makeTodo,
                .space,
                .trash
            ]
            
        case .todo:
            return [
                .open,
                .moveadd,
                .space,
                .suggested([("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]),
                .space,
                .dueToday,
                .dueTomorrow,
                .dueNextWeek,
                .due30Days,
                .done,
                .star,
                .space,
                .sendEmail,
                .makeNote,
                .space,
                .duplicate,
                .trash
            ]
            
        case .event:
            return [
                .open,
                .moveadd,
                .space,
                .suggested([("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]),
                .space,
                .invite,
                .space,
                .makeSchedule,
                .makeTodo,
                .makeNote,
                .space,
                .colors((UIColor.green.hex, [UIColor.orange.hex, UIColor.blue.hex, UIColor.green.hex, UIColor.purple.hex, UIColor.systemPink.hex, UIColor.gray.hex, UIColor.yellow.hex, UIColor.brown.hex, UIColor.red.hex])),
                .space,
                .duplicate,
                .trash
            ]
            
        case .contact:
            return [
                .open,
                .moveadd,
                .space,
                .suggested([("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]),
                .space,
                .call,
                .chat,
                .space,
                .sendEmail,
                .invite,
                .space,
                .duplicate,
                .trash
            ]
            
        case .bookmark:
            return [
                .open,
                .openInNewTab,
                .space,
                .moveadd,
                .space,
                .edit,
                .space,
                .sendEmail,
                .space,
                .trash
            ]
        case .note:
            return [
                .open,
                .moveadd,
                .space,
                .makeSchedule,
                .sendEmail,
                .makeTodo,
                .space,
                .duplicate,
                .trash
            ]
        }
    }
}

extension UIView {
    
    func present(type: CustomPopupPresenterData, sourceView: UIView, completion: @escaping RightLickPopover.ActionCompletion) {
        guard let controller = sourceView.topViewController else { return }
        controller.present(actions: type.value, sourceView: sourceView, completion: completion)
    }
    
}

extension UIViewController {
    
    func present(type: CustomPopupPresenterData, sourceView: UIView, completion: @escaping RightLickPopover.ActionCompletion) {
        self.present(actions: type.value, sourceView: sourceView, completion: completion)
    }
}
