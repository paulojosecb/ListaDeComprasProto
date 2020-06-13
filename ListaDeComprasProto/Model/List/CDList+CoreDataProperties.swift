//
//  CDList+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData


extension CDList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDList> {
        return NSFetchRequest<CDList>(entityName: "CDList")
    }

    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?
    @NSManaged public var itemsLists: NSSet?

}

// MARK: Generated accessors for items
extension CDList {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: CDItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: CDItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

// MARK: Generated accessors for itemsLists
extension CDList {

    @objc(addItemsListsObject:)
    @NSManaged public func addToItemsLists(_ value: CDItemList)

    @objc(removeItemsListsObject:)
    @NSManaged public func removeFromItemsLists(_ value: CDItemList)

    @objc(addItemsLists:)
    @NSManaged public func addToItemsLists(_ values: NSSet)

    @objc(removeItemsLists:)
    @NSManaged public func removeFromItemsLists(_ values: NSSet)

}
