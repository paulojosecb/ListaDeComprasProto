//
//  CDItem+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData

extension CDItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDItem> {
        return NSFetchRequest<CDItem>(entityName: "CDItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var pricePerUnit: Double
    @NSManaged public var isPackage: Bool
    @NSManaged public var brand: String?
    @NSManaged public var category: NSObject?

}
