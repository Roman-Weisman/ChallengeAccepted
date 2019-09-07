//
//  CoreDataManager.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/5/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import Foundation
import CoreData


final class CoreDataManager {
    
    private let modelName : String
    
    init(nameOfTheModel modelName: String) {
        self.modelName = modelName
    }
    
    private(set) lazy var managedObjectContext : NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        // Enforcing parent managedObjectContext to have reference to persistentStoreCoordinator
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCordinator
        
        return managedObjectContext
    }()
    
    // Get managedObjectModel by bundle the URL to the data model
    private lazy var managedObjectModel : NSManagedObjectModel = {
        // momd is extension of the complied version of the data model
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to find data model")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unalbe to load data model")
        }
        
        return managedObjectModel
    }()
    
    // The core data stuck is functional only when the persistent store is added to the persistentStoreCordinator
    private lazy var persistentStoreCordinator : NSPersistentStoreCoordinator = {
        let persistentStoreCordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let fileMananger = FileManager.default
        
        // Storing the store in the document directory, for library change to: .libraryDirectory
        let documentDirectoryURL = fileMananger.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let storeName = "\(self.modelName).sqlite"
        let persistentStoreURL = documentDirectoryURL.appendingPathComponent(storeName)
        
        do {
            try persistentStoreCordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                             configurationName: nil,
                                                             at: persistentStoreURL,
                                                             options: nil)
        } catch {
            fatalError("Unable to laod persistent store")
        }
        
        return persistentStoreCordinator
    }()
}
