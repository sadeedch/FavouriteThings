//
//  Things+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 4/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//
//

import Foundation
import CoreData


extension Things {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Things> {
        return NSFetchRequest<Things>(entityName: "Things")
    }

    @NSManaged public var name: String?
    @NSManaged public var things: ThingsList?

}
