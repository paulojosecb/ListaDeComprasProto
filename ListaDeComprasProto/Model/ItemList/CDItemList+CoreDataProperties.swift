//
//  CDItemList+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData


extension CDItemList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDItemList> {
        return NSFetchRequest<CDItemList>(entityName: "CDItemList")
    }

    @NSManaged public var quantity: Int16
    @NSManaged public var weight: Double
    @NSManaged public var item: CDItem?
    @NSManaged public var list: CDList?

}
