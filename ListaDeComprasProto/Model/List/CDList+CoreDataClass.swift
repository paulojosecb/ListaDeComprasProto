//
//  CDList+CoreDataClass.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 22/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(CDList)
public class CDList: NSManagedObject {
    static let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}
