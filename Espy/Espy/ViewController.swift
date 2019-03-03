//
//  ViewController.swift
//  Espy
//
//  Created by Desislava Nacheva on 3/2/19.
//  Copyright © 2019 Desislava Nacheva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //this is supposed to be the function to take a photo. It does not save the images 
    @IBAction func CameraAction(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.sourceType = .camera
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        picker.dismiss(animated: true, completion: nil)
        
        //Save image
        let img = UIImage()
        let data = img.pngData()
        UserDefaults.standard.set(data, forKey: "myImageKey")
        UserDefaults.standard.synchronize()
        NSLog("Image stored?")
        viewDidLoad()
        
        
    }
    

}

