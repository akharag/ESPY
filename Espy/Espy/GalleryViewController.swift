//
//  GalleryViewController.swift
//  Espy
//
//  Created by Alexander L Kharag on 3/4/19.
//  Copyright © 2019 Desislava Nacheva. All rights reserved.
//

import Foundation
import UIKit

class GalleryViewController : UIViewController {
    
    @IBOutlet weak var galleryImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        var loadItems = [Clothing]()
        var images = [UIImage]()
        print(loadItems.count)

        do{
            try loadItems.loadFromJSONFile(filename: "wardrobe")
            
        } catch let error {
            print("Error Occured Loading File: \(error)")
        }
        for i in 0...loadItems.count-1 {
            if let data = Data(base64Encoded: loadItems[i].image, options: .ignoreUnknownCharacters){
                images[i] = UIImage(data: data)!
            }
        }
        galleryImageView.image = images[0]
        
    }
    
}
