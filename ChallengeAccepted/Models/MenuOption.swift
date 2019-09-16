//
//  MenuOption.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/8/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

enum MenuOption {
    
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var imageName: String {
        switch self {
        case .Profile:        return "ic_person_outline_white_2x"
        case .Inbox:          return "ic_mail_outline_white_2x"
        case .Notifications:  return "ic_menu_white_3x"
        case .Settings:       return "baseline_settings_white_24dp"
        }
    }
    
    var description: String {
        switch self {
        case .Profile:       return String.constants.profile
        case .Inbox:         return String.constants.inbox
        case .Notifications: return String.constants.notifications
        case .Settings:      return String.constants.settings
        }
    }
}

extension MenuOption {
    static var array : [MenuOption] = {
        var arr : [MenuOption] = []
        switch MenuOption.Profile {
        case .Profile: arr.append(.Profile); fallthrough
        case .Inbox: arr.append(.Inbox); fallthrough
        case .Notifications: arr.append(.Notifications); fallthrough
        case .Settings: arr.append(.Settings);
        }
        return arr
    }()
}
