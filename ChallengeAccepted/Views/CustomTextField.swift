//
//  CustomTextField.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/15/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    // MARK: - Parameters
    var placeHolder : String!
    
    // MARK: - Init
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        self.placeHolder = placeHolder
        
        configureTextField()
    }
    
    // for storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Handlers
    
    private func configureTextField() {
        placeholder = self.placeHolder
        borderStyle = UITextField.BorderStyle.roundedRect
    }
    
}
