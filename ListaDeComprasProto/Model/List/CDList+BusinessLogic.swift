//
//  List+BusinessLogi.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension CDList: List {

    static func fetchLists(completion: @escaping ([List]) -> Void) throws {
        do {
            guard let lists = try CDList.managedContext.fetch(CDList.fetchRequest()) as? [List] else {
                throw ListsError.fetchingError
            }
            completion(lists)
        } catch _ {
            throw ListsError.fetchingError
        }
        
    }

    static func createList(name: String, completion: @escaping ([List]) -> ()) throws {
        let list = CDList(context: CDList.managedContext)
        list.name = name
        
        do {
            try CDList.managedContext.save()
            try CDList.fetchLists(completion: completion)
        } catch {
            throw ListsError.creatingError
        }
    }
    
    static func delete(_ list: List, completion: @escaping ([List]) -> Void) throws {
        do {
            guard let cdList = list as? CDList else {
                throw ListsError.deletingError
            }
            
            managedContext.delete(cdList)
            try CDList.managedContext.save()
            try CDList.fetchLists(completion: completion)
            
        } catch _ {
            throw ListsError.deletingError
        }
    }
    
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
    
    func quantityOf(_ item: Item) throws -> Int {
        guard let item = item as? CDItem else {
            throw CustomError(message: "")
        }
        
        guard let itemListsArr = self.itemsLists?.allObjects as? [CDItemList],
            let itemList = itemListsArr.filter({ $0.item == item }).first else {
            throw CustomError(message: "")
        }
        
        return Int(itemList.quantity)
    }
    
    func totalPriceOf(_ item: Item) throws -> Double {
        guard let item = item as? CDItem else {
            throw CustomError(message: "")
        }
        
        guard let itemListsArr = self.itemsLists?.allObjects as? [CDItemList],
            let itemList = itemListsArr.filter({ $0.item == item }).first else {
            throw CustomError(message: "")
        }
        
        if (item.isPackage) {
            return item.pricePerUnit * Double(itemList.quantity)
        } else {
            return item.pricePerUnit * itemList.weight
        }
    }
    
}
