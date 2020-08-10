//
//  CDList+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 10/08/20.
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
    @NSManaged public var recordID: String?
    @NSManaged public var recordData: Data?
    @NSManaged public var cdItems: NSSet?
    @NSManaged public var cdItemsLists: NSSet?

}

// MARK: Generated accessors for cdItems
extension CDList {

    @objc(addCdItemsObject:)
    @NSManaged public func addToCdItems(_ value: CDItem)

    @objc(removeCdItemsObject:)
    @NSManaged public func removeFromCdItems(_ value: CDItem)

    @objc(addCdItems:)
    @NSManaged public func addToCdItems(_ values: NSSet)

    @objc(removeCdItems:)
    @NSManaged public func removeFromCdItems(_ values: NSSet)

}

// MARK: Generated accessors for cdItemsLists
extension CDList {

    @objc(addCdItemsListsObject:)
    @NSManaged public func addToCdItemsLists(_ value: CDItemList)

    @objc(removeCdItemsListsObject:)
    @NSManaged public func removeFromCdItemsLists(_ value: CDItemList)

    @objc(addCdItemsLists:)
    @NSManaged public func addToCdItemsLists(_ values: NSSet)

    @objc(removeCdItemsLists:)
    @NSManaged public func removeFromCdItemsLists(_ values: NSSet)

}
