//
//  ItemList+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemList> {
        return NSFetchRequest<ItemList>(entityName: "ItemList")
    }

    @NSManaged public var quantity: Int16
    @NSManaged public var weight: Double
    @NSManaged public var item: Item?
    @NSManaged public var list: List?

}
