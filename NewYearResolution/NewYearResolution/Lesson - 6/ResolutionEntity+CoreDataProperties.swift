//
//  ResolutionEntity+CoreDataProperties.swift
//  NewYearResolution
//
//  Created by Manish Kumar on 06/12/18.
//  Copyright © 2018 manish. All rights reserved.
//
//

import Foundation
import CoreData


extension ResolutionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ResolutionEntity> {
        return NSFetchRequest<ResolutionEntity>(entityName: "ResolutionEntity")
    }

    @NSManaged public var text: String?
    @NSManaged public var identifier: UUID?
    @NSManaged public var completed: Bool

}
