//
//  File.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation

protocol ShoppingList {
    
    var subTotal: Double { get }
    
    func isItemOnCart(_ item: Item) throws -> Bool
    
    func checkout() throws
    
    func moveToCart(_ item: Item) throws
    func removeFromCart(_ item: Item) throws
    func removeFromShop(_ item: Item) throws
    

}
