//
//  CDShop+BusinessLogic.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation
import CoreData

extension CDShoppingList: ShoppingList {
    
    var subTotal: Double {
        get {
            return 0.0
        }
    }
        
    func moveToCart(_ item: Item) throws {
        guard !checkedOut else {
            throw CustomError(message: "")
        }
        
        let item = try self.convert(item)
        
        if (!(cdItems?.contains(item) ?? true)) {
            throw CustomError(message: "")
        }
        
        self.addToCart(item)
        self.removeFromCdItems(item)
        
        do {
            try self.managedObjectContext?.save()
        } catch _ {
            throw CustomError(message: "")
        }
    }
    
    func removeFromCart(_ item: Item) throws {
        guard !checkedOut else {
            throw CustomError(message: "")
        }
        
        let item = try self.convert(item)
        
        self.removeFromCart(item)
        self.addToCdItems(item)
        
        do {
            try self.managedObjectContext?.save()
        } catch _ {
            throw CustomError(message: "")
        }
    }
    
    //It's necessary to have this remove method for Shop because we cannot make
    //override methods in extensions and shop has a different businessLogic for
    //removing a item completly from the list
    func removeFromShop(_ item: Item) throws {
        guard !checkedOut else {
            throw CustomError(message: "")
        }
        
        let item = try self.convert(item)
        
        if (cart?.contains(item) ?? false) {
            self.removeFromCart(item)
        }
        
        if (cdItems?.contains(item) ?? false) {
            self.removeFromCdItems(item)
        }
        
        guard let itemListsArr = self.cdItemsLists?.allObjects as? [CDItemList],
            let itemList = itemListsArr.filter({ $0.item == item }).first else {
            throw CustomError(message: "")
        }

        
        self.removeFromCdItemsLists(itemList)
        managedObjectContext?.delete(itemList)
        
        do {
            try self.managedObjectContext?.save()
        } catch _ {
            throw CustomError(message: "")
        }
    }
    
    func isItemOnCart(_ item: Item) throws -> Bool {
        guard !checkedOut else {
            throw CustomError(message: "")
        }
        
        let item = try self.convert(item)
        return self.cart?.contains(item) ?? false
    }
    
    func checkout() throws {
        guard !checkedOut else {
            throw CustomError(message: "")
        }
        
        self.checkedOut = true
        self.finalTotal = self.subTotal
        self.date = Date()
    }
    
    private func convert(_ item: Item) throws -> CDItem {
        guard let item = item as? CDItem else {
            throw CustomError(message: "")
        }
        
        return item
    }
    
}
