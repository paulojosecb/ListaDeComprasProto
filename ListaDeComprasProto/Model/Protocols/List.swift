//
//  List.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation

protocol List {
    func add(_ item: Item, quantity: Int, weight: Double) throws
    func remove(_ item: Item) throws
    
    func quantityOf(_ item: Item) throws -> Int
    func totalPriceOf(_ item: Double) throws -> Double
}
