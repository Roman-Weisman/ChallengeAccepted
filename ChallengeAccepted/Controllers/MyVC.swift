//
//  MyVC.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/7/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

class MyVC: UIViewController {
    
    func onTap(TheView theView : UIView) {
        let tap = UITapGestureRecognizer(target: theView, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}
