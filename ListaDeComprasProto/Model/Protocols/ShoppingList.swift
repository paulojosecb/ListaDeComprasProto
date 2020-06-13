//
//  File.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation

protocol ShoppingList {
    
    func moveToCart(_ item: Item) throws
    func removeFromCart(_ item: Item) throws
    func removeFromShop(_ item: Item) throws 
    
}
