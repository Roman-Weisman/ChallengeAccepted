//
//  LandingOption.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/10/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

enum LandingOption {

    case SignIn
    case SignUp
    
    var imageName: String {
        
        switch self {
        case .SignIn: return "ic_person_outline_white_2x"
        case .SignUp: return "ic_person_outline_white_2x"
        }
    }
    
    var description: String {
        switch self {
        case .SignIn: return String.constants.signIn
        case .SignUp: return String.constants.signUp
        }
    }
}

extension LandingOption {
    
    // Set enum into an array, so it can be used from outside of the class as an array and allow iteration
    
    static var array: [LandingOption] = {
        var arr : [LandingOption] = []
        switch LandingOption.SignIn {
        case .SignIn: arr.append(.SignIn); fallthrough
        case .SignUp: arr.append(.SignUp);
        }
        return arr
    }()
}
