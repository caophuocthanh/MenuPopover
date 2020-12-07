//
//  DefaultData.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension RightLickPopover {
    
    enum DefaultData {
        
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
                    .line,
                    .suggested([("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]),
                    .reply,
                    .replyAll,
                    .forward,
                    .markAsJunk,
                    .markAsRead,
                    .line,
                    .makeSchedule,
                    .makeTodo,
                    .line,
                    .trash
                ]
                
            case .todo:
                return [
                    .open,
                    .moveadd,
                    .line,
                    .suggested([("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]),
                    .line,
                    .dueToday,
                    .dueTomorrow,
                    .dueNextWeek,
                    .due30Days,
                    .done,
                    .star,
                    .line,
                    .sendEmail,
                    .makeNote,
                    .line,
                    .duplicate,
                    .trash
                ]
                
            case .event:
                return [
                    .open,
                    .moveadd,
                    .line,
                    .suggested([("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]),
                    .line,
                    .invite,
                    .line,
                    .makeSchedule,
                    .makeTodo,
                    .makeNote,
                    .line,
                    .colors((UIColor.green.hex, [UIColor.orange.hex, UIColor.blue.hex, UIColor.green.hex, UIColor.purple.hex, UIColor.systemPink.hex, UIColor.gray.hex, UIColor.yellow.hex, UIColor.brown.hex, UIColor.red.hex])),
                    .line,
                    .duplicate,
                    .trash
                ]
                
            case .contact:
                return [
                    .open,
                    .moveadd,
                    .line,
                    .suggested([("0", "Home"), ("1", "Work"), ("2", "Suggest"), ("3", "Local")]),
                    .line,
                    .call,
                    .chat,
                    .line,
                    .sendEmail,
                    .invite,
                    .line,
                    .duplicate,
                    .trash
                ]
                
            case .bookmark:
                return [
                    .open,
                    .openInNewTab,
                    .line,
                    .moveadd,
                    .line,
                    .edit,
                    .line,
                    .sendEmail,
                    .line,
                    .trash
                ]
                case .note:
                    return [
                        .open,
                        .moveadd,
                        .line,
                        .makeSchedule,
                        .sendEmail,
                        .makeTodo,
                        .line,
                        .duplicate,
                        .trash
                    ]
            }
        }
    }
    
}

