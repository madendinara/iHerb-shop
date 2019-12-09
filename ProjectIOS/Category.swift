//
//  Category.swift
//  ProjectIOS
//
//  Created by Dinara on 11/19/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import Foundation
import UIKit
class Category{
    var id: String
    var name: String
    
    init(_name: String) {
        id = ""
        name = _name
    }
    //downloading from firebase
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as! String
        name = _dictionary[kNAME] as! String
    }
}
//хехе

func downloadCategoriesFromFirebase(completion: @escaping  (_ categoryArray:  [Category]) -> Void) {
    var categoryArray: [Category] = []
    firebaseReferense(.Category).getDocuments{(snapshot, error) in
        guard let shapshot = snapshot else{
            completion(categoryArray)
            return
        }
        if !shapshot.isEmpty{
            for i in shapshot.documents{
                categoryArray.append(Category(_dictionary: i.data() as NSDictionary))

            }
        }
        completion(categoryArray)
        
    }
}
