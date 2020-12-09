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
    
    typealias ActionOther = (tag: Int, title: String, color: UIColor, icon: UIImage?)
    typealias ActionCompletion = (RightLickPopover.Action, String) -> Void
    
    enum Action {
        case suggested(Int, String, [Suggested])
        case colors(Int, String, Color)
        case space(CGFloat)
        case title(ActionOther)
        
        var height: CGFloat {
            switch self {
            case .suggested(_,_,_): return 100
            case .colors(_,_,_): return 100
            case .space(let value): return value
            case .title(_): return 44
            }
        }
    }
    
}


