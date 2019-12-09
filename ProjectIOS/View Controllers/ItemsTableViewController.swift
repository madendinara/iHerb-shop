//
//  ItemsTableViewController.swift
//  ProjectIOS
//
//  Created by Dinara on 11/25/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    var category: Category?
    var itemArray: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        self.title = category?.name
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if category != nil{
            loadItems()
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showItemView(itemArray[indexPath.row])
    }
    func showItemView(_ item: Item){
        let itemVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemView") as! ItemViewController
        itemVC.item = item
        self.navigationController?.pushViewController(itemVC, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell
        cell.generateCell(itemArray[indexPath.row])


        return cell
    }
    func loadItemsFromFirebase(_ categoryId: String, completion: @escaping (_ itemArray: [Item]) -> Void){
        var itemArray: [Item] = []
        firebaseReferense(.Items).whereField(kCATEGORYID, isEqualTo: categoryId).getDocuments{(snapshot, error) in
            guard let snapshot = snapshot else{
                completion(itemArray)
                return
            }
            if !snapshot.isEmpty{
                for i in snapshot.documents{
                    itemArray.append(Item(_dictionary: i.data() as NSDictionary))
                }
            }
            
            completion(itemArray)
        }
    }
    private func loadItems(){
            
        loadItemsFromFirebase(category!.id){ (allItems) in
            self.itemArray = allItems
            self.tableView.reloadData()
        }
    }
    

   
}

