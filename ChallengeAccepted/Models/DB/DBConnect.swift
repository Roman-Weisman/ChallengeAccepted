//
//  DBConnect.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/5/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import CoreData

protocol DBConnect  {
    func insert(EntityName entityName: String) -> NSManagedObject
    func get(ParamToSearcheBy param : String) -> String
    func save()
}
