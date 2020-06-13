//
//  List+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?
    @NSManaged public var itemsLists: NSSet?
    
}

// MARK: Generated accessors for items
extension List {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

// MARK: Generated accessors for itemsLists
extension List {

    @objc(addItemsListsObject:)
    @NSManaged public func addToItemsLists(_ value: ItemList)

    @objc(removeItemsListsObject:)
    @NSManaged public func removeFromItemsLists(_ value: ItemList)

    @objc(addItemsLists:)
    @NSManaged public func addToItemsLists(_ values: NSSet)

    @objc(removeItemsLists:)
    @NSManaged public func removeFromItemsLists(_ values: NSSet)

}
