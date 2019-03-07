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
    var fileName : String = ""
    
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
        print("Save Button Pressed")
        let image = ImageView.image
        let imageData:Data = image!.pngData()! as Data
        
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        
        data = UserDefaults.standard.object(forKey: "savedImage") as! Data
        
        //Save data with tag to json file here
        let str = String("")
        
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        //Bundle.main.url(forResource: "clothing", withExtension: "json")
        
        //performSegue(withIdentifier: "uploadToMainMenu", sender: Any?.self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nextController = segue.destination as! MainMenuViewController
//        nextController.dataBuffer = data
//        nextController.tagBuffer = tag
//    }
}
