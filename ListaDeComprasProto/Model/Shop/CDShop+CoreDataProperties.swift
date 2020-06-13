//
//  CDShop+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData


extension CDShop {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDShop> {
        return NSFetchRequest<CDShop>(entityName: "CDShop")
    }

    @NSManaged public var date: Date?
    @NSManaged public var finalTotal: Double
    @NSManaged public var checkedOut: Bool
    @NSManaged public var cart: NSSet?

}

// MARK: Generated accessors for cart
extension CDShop {

    @objc(addCartObject:)
    @NSManaged public func addToCart(_ value: CDItem)

    @objc(removeCartObject:)
    @NSManaged public func removeFromCart(_ value: CDItem)

    @objc(addCart:)
    @NSManaged public func addToCart(_ values: NSSet)

    @objc(removeCart:)
    @NSManaged public func removeFromCart(_ values: NSSet)

}
