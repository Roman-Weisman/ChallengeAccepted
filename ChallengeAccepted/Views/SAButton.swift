//
//  SAButton.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/4/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import Foundation
import UIKit

class SAButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        backgroundColor     = UIColor.blue
        titleLabel?.font    = UIFont(name: "HelveticaNeue-Bold", size: 22)
        layer.cornerRadius  = frame.size.height/2
        setTitleColor(.white, for: .normal)
    }
}
