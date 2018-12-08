//
//  CoreDataManager+Extension.swift
//  NewYearResolution
//
//  Created by Manish Kumar on 06/12/18.
//  Copyright © 2018 manish. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataManager {

    func fetchResolutions() -> [ResolutionEntity]? {
        //1. Creat fetch request
        let context = CoreDataManager.sharedInstance.backgroundContext
        let fetchRequest: NSFetchRequest<ResolutionEntity>  = ResolutionEntity.fetchRequest()
        do {
            let objects = try context.fetch(fetchRequest)
            return objects
        } catch {
            // if error log here
        }

        return nil
    }


    
    func deleteResolution(identifier: UUID) {
        let context = CoreDataManager.sharedInstance.backgroundContext
        let fetchRequest: NSFetchRequest<ResolutionEntity>  = ResolutionEntity.fetchRequest()

        do {
            let objects = try context.fetch(fetchRequest)
            if let foundObj = objects.first {
                context.delete(foundObj)
            }
            try context.save()
        } catch {
            // if error log here
        }
    }
}
