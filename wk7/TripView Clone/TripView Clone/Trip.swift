//
//  Trip.swift
//  TripView Clone
//
//  Created by Thomas Sesselmann on 14/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import Foundation
import CoreData

@objc(Trip)

class Trip: NSManagedObject {

    @NSManaged var fromLocation: String
    @NSManaged var toLocation: String
    @NSManaged var subtitle: String
    @NSManaged var createdAt: NSDate

}
