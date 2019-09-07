//
//  UserMO.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/5/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import Foundation
import CoreData

class UserMO : NSManagedObject {
    
    // @ means : will be resolved in runtime
    @NSManaged var name : String?
    @NSManaged var email : String?
    
//    init(name n: String, email e: String) {
//        super.init()
//        self.name = n
//        self.email = e
//    }
}
