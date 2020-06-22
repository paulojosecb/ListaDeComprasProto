//
//  ListViewModel.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 22/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol ListsBusinessLogic {
    func createList(with name: String) throws
    func fetchLists() throws
    func deleteList(on index: Int) throws
}

enum ListsError: LocalizedError {
    case fetchingError
    case creatingError
    case deletingError

    var errorDescription: String? {
        switch self {
        case .fetchingError:
            return "Error fetching List"
        case .creatingError:
            return "Error creating List"
        case .deletingError:
            return "Error deleting List"
        }
    }
}

enum TableViewUpdate {
    case insert
    case delete
}


class ListViewModel: ListsBusinessLogic {
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let viewController: ListViewController
    
    var lists: [List] = []
    
    init(viewController: ListViewController) {
        self.viewController = viewController
    }
    
    public func fetchLists() throws {
        do {
            try CDList.fetchLists { (lists) in
                self.lists = lists
            }
            
            self.viewController.tableView.reloadData()
        } catch _ {
            throw ListsError.fetchingError
        }
    }
    
    public func deleteList(on index: Int) throws {
        try CDList.delete(self.lists[index], completion: { (lists) in
            self.lists = lists
            self.updateTableView(on: index, with: .delete)
        })
    }
    
    
    public func createList(with name: String) throws {
        try CDList.createList(name: name) { (lists) in
            self.lists = lists
            self.updateTableView(on: self.lists.count - 1, with: .insert)
        }
    }
    
    private func updateTableView(on index: Int, with action: TableViewUpdate) {
        let indexPath = IndexPath(row: index, section: 0)
        self.viewController.tableView.beginUpdates()
        
        if (action == .insert) {
            self.viewController.tableView.insertRows(at: [indexPath], with: .automatic)
        } else {
            self.viewController.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        self.viewController.tableView.endUpdates()
    }
    
}
