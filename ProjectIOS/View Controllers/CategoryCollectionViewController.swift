//
//  CategoryCollectionViewController.swift
//  ProjectIOS
//
//  Created by Dinara on 11/19/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class CategoryCollectionViewController: UICollectionViewController {
    var categoryArray: [Category] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    }
    override func viewWillAppear(_ animated: Bool) {
        downloadCategories()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoryToItems"{
            let vc = segue.destination as! ItemsTableViewController
            vc.category  = sender as! Category
        }
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
    
    cell.generateCell(categoryArray[indexPath.row])
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "categoryToItems", sender: categoryArray[indexPath.row])
    }
    
    
    func downloadCategories(){
        downloadCategoriesFromFirebase{(allCategories) in
            self.categoryArray = allCategories
            self.collectionView.reloadData()
            
        }
    }
}
