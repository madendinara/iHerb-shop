//
//  ItemTableViewCell.swift
//  ProjectIOS
//
//  Created by Dinara on 12/3/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func generateCell(_ item: Item){
        itemNameLabel.text = item.name
        itemDescLabel.text = item.description
        itemPriceLabel.text = "\(item.price!)"
        
    }

}
