//
//  SearchViewController.swift
//  ProjectIOS
//
//  Created by Dinara on 12/4/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import UIKit
import LTMorphingLabel

class SearchViewController: UIViewController {
    
    @IBOutlet weak var field: UITextField!
    
    
    
    @IBOutlet weak var txt: LTMorphingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        txt.morphingEffect = .burn
        
        
    }
    
    @IBAction func btn(_ sender: Any) {
        txt.text = field.text
    }
    
    
}
