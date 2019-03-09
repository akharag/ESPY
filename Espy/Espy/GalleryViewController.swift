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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let clothingFile = try! [Clothing](filename: "wardrobe.json")
        print(clothingFile[0].tag)
    }
    
}
