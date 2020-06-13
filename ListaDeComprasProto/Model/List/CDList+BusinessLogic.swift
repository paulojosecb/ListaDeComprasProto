//
//  List+BusinessLogi.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation
import CoreData

extension CDList: List {

    func add(_ item: Item, quantity: Int, weight: Double = 0) throws {
        
        guard let item = item as? CDItem else {
            throw CustomError(message: "")
        }
        
        let itemList = CDItemList(context: self.managedObjectContext!)
        itemList.item = item
        itemList.list = self
        
        itemList.quantity = Int16(quantity)
        itemList.weight = weight
    
        self.addToItems(item)
        self.addToItemsLists(itemList)
        
        do {
            try managedObjectContext?.save()
        } catch let error {
            print(error)
        }
        
    }
    
    func remove(_ item: Item) throws {
        guard let item = item as? CDItem else {
            throw CustomError(message: "")
        }
    
        guard let itemListsArr = self.itemsLists?.allObjects as? [CDItemList],
            let itemList = itemListsArr.filter({ $0.item == item }).first else {
            throw CustomError(message: "")
        }
        
        self.removeFromItemsLists(itemList)
        self.removeFromItems(item)
        managedObjectContext?.delete(itemList)
        
        do {
            try managedObjectContext?.save()
        } catch let error {
            print(error)
        }
    
    }
    
}
