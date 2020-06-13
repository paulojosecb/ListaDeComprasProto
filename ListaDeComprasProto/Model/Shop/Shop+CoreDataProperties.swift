//
//  Shop+CoreDataProperties.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData


extension Shop {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shop> {
        return NSFetchRequest<Shop>(entityName: "Shop")
    }

    @NSManaged public var date: Date?
    @NSManaged public var finalTotal: Double
    @NSManaged public var checkedOut: Bool
    @NSManaged public var cart: NSSet?
    
}

// MARK: Generated accessors for cart
extension Shop {

    @objc(addCartObject:)
    @NSManaged public func addToCart(_ value: Item)

    @objc(removeCartObject:)
    @NSManaged public func removeFromCart(_ value: Item)

    @objc(addCart:)
    @NSManaged public func addToCart(_ values: NSSet)

    @objc(removeCart:)
    @NSManaged public func removeFromCart(_ values: NSSet)

}
