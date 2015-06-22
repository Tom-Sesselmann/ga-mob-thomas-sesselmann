//
//  Class.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 14/06/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import Foundation
import CoreData

class Class: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var maxHealth: NSNumber
    @NSManaged var maxMana: NSNumber
    @NSManaged var initAttackPower: NSNumber
    @NSManaged var ability1: String
    @NSManaged var ability2: String

}
