//
//  CDShoppingList+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData


extension CDShoppingList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDShoppingList> {
        return NSFetchRequest<CDShoppingList>(entityName: "CDShoppingList")
    }

    @NSManaged public var date: Date?
    @NSManaged public var finalTotal: Double
    @NSManaged internal var checkedOut: Bool
    @NSManaged public var cart: NSSet?

}

// MARK: Generated accessors for cart
extension CDShoppingList {

    @objc(addCartObject:)
    @NSManaged public func addToCart(_ value: CDItem)

    @objc(removeCartObject:)
    @NSManaged public func removeFromCart(_ value: CDItem)

    @objc(addCart:)
    @NSManaged public func addToCart(_ values: NSSet)

    @objc(removeCart:)
    @NSManaged public func removeFromCart(_ values: NSSet)

}
