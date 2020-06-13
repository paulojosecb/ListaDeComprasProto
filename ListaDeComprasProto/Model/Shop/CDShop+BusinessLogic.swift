//
//  CDShop+BusinessLogic.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation
import CoreData

extension CDShop: Shop {
    
    func moveToCart(_ item: Item) throws {
        guard let item = item as? CDItem else {
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
    
}
