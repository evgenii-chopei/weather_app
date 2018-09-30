//
//  CoreDataModelService.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/29/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

fileprivate let core_data_name: String = "WeatherApp"

class CoreDataModelService {
    
    public static var mainContext: NSManagedObjectContext {
       return primaryContext
    }
    
    public static var backgroundContext: NSManagedObjectContext {
        let backgroundContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        backgroundContext.parent = self.primaryContext
        backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return backgroundContext
    }
    
    public static func save(_ context: NSManagedObjectContext = persistentContainer.viewContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
    
    private static var primaryContext: NSManagedObjectContext {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        managedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return managedObjectContext
    }
    
    
    private static  let persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: core_data_name)
        persistentContainer.loadPersistentStores(completionHandler: { (_, error) in
            if error != nil {
                //TODO : Log
                debugPrint(error?.localizedDescription)
            }
        })
        return persistentContainer
    }()
    
}
