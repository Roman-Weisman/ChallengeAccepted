//
//  HomeVC.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/6/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import Foundation
import UIKit

class HomeVC : MyVC {
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
    }
    
    private func getUser() {
        nameLabel.text  = "Welcome " + MyCoreData.getInstance.get(ParamToSearcheBy: "Roman")
    }
}
