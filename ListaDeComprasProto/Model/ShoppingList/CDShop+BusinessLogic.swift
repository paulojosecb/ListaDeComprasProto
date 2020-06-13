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
    
    func moveToCart(_ item: Item) throws {
        guard let item = item as? CDItem else {
            throw CustomError(message: "")
        }
        
        if (!(items?.contains(item) ?? true)) {
            throw CustomError(message: "")
        }
        
        self.addToCart(item)
        self.removeFromItems(item)
        
        do {
            try self.managedObjectContext?.save()
        } catch _ {
            throw CustomError(message: "")
        }
    }
    
    func removeFromCart(_ item: Item) throws {
        guard let item = item as? CDItem else {
            throw CustomError(message: "")
        }
        
        self.removeFromCart(item)
        self.addToItems(item)
        
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
        guard let item = item as? CDItem else {
            throw CustomError(message: "")
        }
        
        if (cart?.contains(item) ?? false) {
            self.removeFromCart(item)
        }
        
        if (items?.contains(item) ?? false) {
            self.removeFromItems(item)
        }
        
        guard let itemListsArr = self.itemsLists?.allObjects as? [CDItemList],
            let itemList = itemListsArr.filter({ $0.item == item }).first else {
            throw CustomError(message: "")
        }

        
        self.removeFromItemsLists(itemList)
        managedObjectContext?.delete(itemList)
        
        do {
            try self.managedObjectContext?.save()
        } catch _ {
            throw CustomError(message: "")
        }
    }
    
}
