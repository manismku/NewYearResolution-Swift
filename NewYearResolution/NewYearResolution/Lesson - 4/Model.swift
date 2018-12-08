//
//  Model.swift
//  NewYearResolution
//
//  Created by Manish Kumar on 05/12/18.
//  Copyright © 2018 manish. All rights reserved.
//

import Foundation

struct Resolution {
    var description: String
    var isCompleted: Bool
    var identifier: UUID
}

extension Resolution {
    init(desc: String, completed: Bool = false, iden: UUID = UUID()) {
        self.description = desc
        self.isCompleted = completed
        self.identifier = iden
    }
}
