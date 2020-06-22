//
//  ViewController.swift
//  ListaDeComprasProto
//
//  Created by Paulo José on 13/06/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var viewModel: ListViewModel?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ListViewModel(viewController: self)
        
        do {
            try self.viewModel?.fetchLists()
        } catch let error {
            print(error)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func didTapAdd() {
        self.presentAddAlertController()
    }
    
    @IBAction func didTapDetails() {
        
    }
    
    private func presentAddAlertController() {
        var textField: UITextField!
        
        let alertController = UIAlertController(title: "What is the name of this list?", message: "", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        
        alertController.addTextField { (txtField) in
            textField = txtField
        }
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            do {
                 try self.viewModel!.createList(with: textField.text ?? "")
            } catch _ {
                print(ListsError.deletingError.errorDescription)
            }
           
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel!.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        
        cell.textLabel?.text = self.viewModel!.lists[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            do {
                try self.viewModel!.deleteList(on: indexPath.row)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}

