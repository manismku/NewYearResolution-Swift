//
//  NYRTableViewController.swift
//  NewYearResolution
//  Introduction and Saving Entity
//  Created by Manish Kumar on 04/12/18.
//  Copyright © 2018 manish. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    static let sharedInstance = CoreDataManager()
    private override init() { }

    // MARK: - Core Data stack
    private lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "NewYearResolution")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    public func defaultDirectoryURL() -> URL {
        return NSPersistentContainer.defaultDirectoryURL()
    }

    public lazy var backgroundContext: NSManagedObjectContext = {
        return persistentContainer.newBackgroundContext()
    }()
    
    // MARK: - Core Data Saving support
    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}


/*
 *  Create a managed object and save it into context
 */
extension CoreDataManager {
    public func saveEntity(model: Resolution) {
        let context = self.persistentContainer.viewContext
        let description =
            NSEntityDescription.entity(forEntityName: "ResolutionEntity",
                                       in: context)!

        if let obj = NSManagedObject(entity: description, insertInto: context) as? ResolutionEntity {
            obj.text = model.description
            obj.completed = model.isCompleted
            obj.identifier = model.identifier
            self.saveContext()
        }
    }
}
