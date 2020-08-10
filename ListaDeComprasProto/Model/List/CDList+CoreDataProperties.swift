//
//  CDList+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 22/06/20.
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
    @NSManaged internal var cdItems: NSSet?
    @NSManaged internal var cdItemsLists: NSSet?

}

// MARK: Generated accessors for cdItems
extension CDList {

    @objc(addCdItemsObject:)
    @NSManaged internal func addToCdItems(_ value: CDItem)

    @objc(removeCdItemsObject:)
    @NSManaged internal func removeFromCdItems(_ value: CDItem)

    @objc(addCdItems:)
    @NSManaged internal func addToCdItems(_ values: NSSet)

    @objc(removeCdItems:)
    @NSManaged internal func removeFromCdItems(_ values: NSSet)

}

// MARK: Generated accessors for cdItemsLists
extension CDList {

    @objc(addCdItemsListsObject:)
    @NSManaged internal func addToCdItemsLists(_ value: CDItemList)

    @objc(removeCdItemsListsObject:)
    @NSManaged internal func removeFromCdItemsLists(_ value: CDItemList)

    @objc(addCdItemsLists:)
    @NSManaged internal func addToCdItemsLists(_ values: NSSet)

    @objc(removeCdItemsLists:)
    @NSManaged internal func removeFromCdItemsLists(_ values: NSSet)

}
