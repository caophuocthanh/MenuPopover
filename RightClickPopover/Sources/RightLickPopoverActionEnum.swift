//
//  RightLickPopoverActionEnum.swift
//  RightClickPopover
//
//  Created by Cao Phuoc Thanh on 12/7/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class RightLickPopover {
    
    typealias CustomView = (id: String, view: UIView)
    typealias CustomTitle = (id: String, title: String, image: UIImage)
    typealias Suggested = (id: String, title: String)
    typealias Color = (selectedColor: String, colors: [String])
    
    typealias ActionCompletion = (RightLickPopover.Action, String) -> Void
    
    enum Action {
        case open
        case suggested([Suggested])
        case moveadd
        case invite
        
        case makeEvent
        case makeSchedule
        case makeTodo
        case makeNote
        
        case colors(Color)
        case duplicate
        
        case trash
        
        case reply
        case replyAll
        case forward
        
        case markAsJunk
        case markAsRead
        
        case dueToday
        case dueTomorrow
        case dueNextWeek
        case due30Days
        case done
        case star
        case sendEmail
        
        case call
        case chat
        
        case openInNewTab
        case edit
        
        case title(CustomTitle)
        case space
        
        var image: UIImage? {
            switch self {
            case .open:
                return UIImage(named: "phone")
            case .trash:
                return UIImage(named: "phone")
            case .moveadd:
                return UIImage(named: "phone")
            case .invite:
                return UIImage(named: "phone")
            case .makeEvent:
                return UIImage(named: "phone")
            case .makeSchedule:
                return UIImage(named: "phone")
            case .makeTodo:
                return UIImage(named: "phone")
            case .makeNote:
                return UIImage(named: "phone")
            case .duplicate:
                return UIImage(named: "phone")
            default:
                return UIImage(named: "phone")
            }
        }
        
        var height: CGFloat {
            switch self {
            case .suggested(_): return 100
            case .colors(_): return 100
            case .space: return 6
            default: return 44
            }
        }
        
        var tintColor: UIColor {
            switch self {
            case .trash:
                return .red
            default:
                return .black
            }
        }
        
        var title: String? {
            switch self {
            case .open:
                return "Open"
            case .trash:
                return "Trash"
            case .moveadd:
                return "Move/ Add to Collection"
            case .invite:
                return "Invite"
            case .makeEvent:
                return "Make Event"
            case .makeSchedule:
                return "Make Schedule"
            case .makeTodo:
                return "Make Todo"
            case .makeNote:
                return "Make Note"
            case .duplicate:
                return "Dublicate"
            case .reply:
                return "Reply"
            case .replyAll:
                return "Reply All"
            case .forward:
                return "Forward"
            case .markAsJunk:
                return "Mark As Junk"
            case .markAsRead:
                return "Mark As Read"
            case .suggested(_):
                return "SUGGESTED COLLECTIONS"
            case .colors(_):
                return "COLORS"
                
            case .dueToday: return "Due Today"
            case .dueTomorrow: return "Due Tomorrow"
            case .dueNextWeek: return "Due Next Week"
            case .due30Days: return "Due 30 Days"
            case .done: return "Done"
            case .star: return "Star"
            case .sendEmail: return "Send Email"
                
            case .call: return "Call"
            case .chat: return "Chat"
                
            case .openInNewTab: return "Open In New Tab"
            case .edit: return "Edit..."
                
            default:
                return nil
            }
        }
    }
    
}


