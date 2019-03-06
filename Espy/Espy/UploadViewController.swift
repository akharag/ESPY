//
//  UploadViewController.swift
//  Espy
//
//  Created by Alexander L Kharag on 3/4/19.
//  Copyright © 2019 Desislava Nacheva. All rights reserved.
//

import Foundation
import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate {
    @IBOutlet weak var ImageView: UIImageView!
    var previewImage : UIImage?
    var tag : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageView.image = previewImage
    }
    
    @IBAction func TopPresed(_ sender: Any) {
        /*CHANGE TAG TO TOP*/
        let image = ImageView.image
        let imageData:NSData = image!.pngData()! as NSData
        
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        
        ImageView.image = UIImage(data: data as Data)
        
        
    }
    @IBAction func BottomPressed(_ sender: Any) {
        /*CHANGE TAG TO BOTTOM*/
    }
    @IBAction func ShoesPressed(_ sender: Any) {
        /*CHANGE TAG TO BOTTOM*/
    }
    /*It would be nice if the buttons changed colors to represent that it was pressed
     if another button was pressed, and if another button was pressed before the
     image is saved then the previous button will revert to it's previous color*/
    
    @IBAction func SavePressed(_ sender: Any) {
        /*SAVE IMAGE AND RETURN TO MAIN MENU*/
    }
    
    
}
