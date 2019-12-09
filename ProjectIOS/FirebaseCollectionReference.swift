//
//  FirebaseCollectionReference.swift
//  ProjectIOS
//
//  Created by Dinara on 11/19/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference:String{
    case Category = "category"
    case Items = "items"    
}
func firebaseReferense(_ collectionReference: FCollectionReference) -> CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}

