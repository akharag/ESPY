//
//  UploadViewController.swift
//  Espy
//
//  Created by Alexander L Kharag on 3/4/19.
//  Copyright © 2019 Desislava Nacheva. All rights reserved.
//

import Foundation
import UIKit
//https://www.youtube.com/watch?v=PWgRz4jqICI

class UploadViewController: UIViewController, UIImagePickerControllerDelegate {
    @IBOutlet weak var ImageView: UIImageView!
    var previewImage : UIImage?
    var data = Data()
    var tag : String = ""
    var fileName : String = "wardrobe.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageView.image = previewImage
    }
    
    @IBAction func TopPresed(_ sender: Any) {
        /*CHANGE TAG TO TOP*/
        tag = "top"
    }
    @IBAction func BottomPressed(_ sender: Any) {
        /*CHANGE TAG TO BOTTOM*/
        tag = "bottom"
    }
    @IBAction func ShoesPressed(_ sender: Any) {
        /*CHANGE TAG TO BOTTOM*/
        tag = "shoes"
    }
    /*It would be nice if the buttons changed colors to represent that it was pressed
     if another button was pressed, and if another button was pressed before the
     image is saved then the previous button will revert to it's previous color*/
    
    @IBAction func SavePressed(_ sender: Any) {
        /*SAVE IMAGE AND RETURN TO MAIN MENU*/
        if tag != ""{
            let image = ImageView.image
            //convert image to string
            let imageData = image!.jpegData(compressionQuality: 0.01)! as Data
            let imageString = imageData.base64EncodedString(options: .endLineWithLineFeed)
            //save clothing item to wardrobe
            let newClothing = Clothing(inputTag: tag, inputImage: imageString)
            wardrobeItems.append(newClothing)
            //save clothing item to file
            saveToJSON(clothingArr: wardrobeItems, filename: "wardrobe")
            
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
        else{
            print("no tag chosen")
        }
    }
}
