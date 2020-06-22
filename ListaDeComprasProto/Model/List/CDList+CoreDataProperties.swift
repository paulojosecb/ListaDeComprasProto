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
    @NSManaged internal func addToItems(_ value: CDItem)

    @objc(removeItemsObject:)
    @NSManaged internal func removeFromItems(_ value: CDItem)

    @objc(addItems:)
    @NSManaged internal func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged internal func removeFromItems(_ values: NSSet)

}

// MARK: Generated accessors for itemsLists
extension CDList {

    @objc(addItemsListsObject:)
    @NSManaged internal func addToItemsLists(_ value: CDItemList)

    @objc(removeItemsListsObject:)
    @NSManaged internal func removeFromItemsLists(_ value: CDItemList)

    @objc(addItemsLists:)
    @NSManaged internal func addToItemsLists(_ values: NSSet)

    @objc(removeItemsLists:)
    @NSManaged internal func removeFromItemsLists(_ values: NSSet)

}
