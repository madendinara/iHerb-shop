//
//  Item.swift
//  ProjectIOS
//
//  Created by Dinara on 11/25/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import Foundation
import UIKit

class Item{
    var id: String!
    var categoryId: String!
    var name: String!
    var description: String!
    var price: Double!
    init() {}
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as? String
        categoryId = _dictionary[kCATEGORYID] as? String
        name = _dictionary[kNAME] as? String
        description = _dictionary[kDESCRIPTION] as? String
        price = _dictionary[kPRICE] as? Double
    }
    
    
    
    
    
}

