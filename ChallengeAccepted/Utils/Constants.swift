//
//  Constants.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/9/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

extension UIColor {
    struct constants {
        struct color {
            static var buttonColor: UIColor { return UIColor(displayP3Red: 255/255, green: 140/255, blue: 0, alpha: 1)}
            static var buttonBorderColor: UIColor { return .black}
            static var buttonTitleColor: UIColor { return .white}
            static var menuBackgroundColor: UIColor { return UIColor(displayP3Red: 50/255, green: 168/255, blue: 143/255, alpha: 1)}
            static var menuColor2: UIColor {return UIColor(displayP3Red: 50/255, green: 168/255, blue: 58/255, alpha: 1)}
        }
    }
}

extension Int {
    struct constants {
        static var menuWidh: CGFloat = 175;
    }
}

extension String {
    struct constants {
        static var signIn:  String = "Sign In"
        static var signUp:  String = "Sign Up"
        static var landing: String = "Landing"
        
        static var profile: String = "Profile"
        static var inbox: String = "Inbox"
        static var notifications: String = "Notifications"
        static var settings: String = "Settings"
        
        static var landingTitle: String = "Welcome To - Challenge Accepted"
        static var homeTitle: String = "Home"
    }
}
