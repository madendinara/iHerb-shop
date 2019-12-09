//
//  CategoryCollectionViewCell.swift
//  ProjectIOS
//
//  Created by Dinara on 11/19/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    func generateCell(_ category: Category){
            categoryNameLabel.text = category.name
    }
}
