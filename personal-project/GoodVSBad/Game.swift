//
//  Game.swift
//  GoodVSBad
//
//  Created by Thomas Sesselmann on 29/05/2015.
//  Copyright (c) 2015 ACME Inc. All rights reserved.
//

import Foundation
import CoreData

class Game: NSManagedObject {

    @NSManaged var heroClass: String?
    @NSManaged var villianClass: String?
    @NSManaged var winner: String?
    @NSManaged var createdAt: NSDate

}
