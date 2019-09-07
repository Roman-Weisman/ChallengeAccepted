//
//  MyCoreData.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/5/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//


import CoreData
import UIKit

class MyCoreData : DBConnect {
    
    static let getInstance = MyCoreData()
    
    let managedObjectcontext : NSManagedObjectContext
    let coreDataManager : CoreDataManager
    let coreDataModelName : String = "ChallengeAccepted"
    
    private init() {
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectcontext = appDelegate.persistentContainer.viewContext as NSManagedObjectContext
        coreDataManager = CoreDataManager(nameOfTheModel: coreDataModelName)
        
    }
    
    func insert(EntityName entityName : String) -> NSManagedObject {
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectcontext)
    }
    
    func get(ParamToSearcheBy param : String) -> String {
        var result : String = ""
        
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", param)
        do{
            result = try managedObjectcontext.fetch(fetchRequest)[0].name!
        } catch let error as NSError {
            NSLog("No row in entity %@ with name %@, error: %@", "User","param", error)
        }
        
        return result
    }
    
    func save() {
        do {
            try managedObjectcontext.save()
        } catch {
            fatalError("Unable to save the managed obejct context")
        }
    }
}
