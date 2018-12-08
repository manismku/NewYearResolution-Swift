//
//  Resolution+Extension.swift
//  NewYearResolution
//  Custom Initializer
//  Created by Manish Kumar on 06/12/18.
//  Copyright © 2018 manish. All rights reserved.
//

import Foundation

extension Resolution {

    init(entity: ResolutionEntity) {
        self.description = entity.text!
        self.isCompleted = entity.completed
        self.identifier = entity.identifier!
    }

    static func createNewYearResolution(entitys: [ResolutionEntity]) -> [Resolution] {
        var items = [Resolution]()
        for obj in entitys {
            items.append(Resolution(entity: obj))
        }
        return items
    }
}
