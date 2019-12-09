//
//  ItemViewController.swift
//  ProjectIOS
//
//  Created by Dinara on 12/3/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import UIKit
import Photos
class ItemViewController: UIViewController {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var itemDescLabel: UITextView!
    
    var item: Item!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    func setupUI(){
        if item != nil{
            self.title = item.name
            itemNameLabel.text = item.name
            itemPriceLabel.text = "\(item.price!)"
            itemDescLabel.text = item.description
        }
    }
    
    @IBAction func saveImageToPhone(_ sender: Any) {
        
        let imageData = img.image!.pngData()
        let compresedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Saved", message: "Your image has been saved", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func shareImageToApps(_ sender: Any) {

        let activityController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("Completed!")
            } else {
                print("Canceled!!")
            }
        }
        present(activityController , animated: true) {
            print("Image Presented!")
        }
    }
    
}
