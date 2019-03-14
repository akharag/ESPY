//
//  OutfitMakerViewController.swift
//  Espy
//
//  Created by Alexander L Kharag on 3/13/19.
//  Copyright © 2019 Desislava Nacheva. All rights reserved.
//

import Foundation
import UIKit

class OutfitMakerViewerController: UIViewController{
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var shoesView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var shoesImageView: UIImageView!
    
    var i = 0
    var divisor:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width / 2) / 0.61
        
        var loadItems = [Clothing]()
        var images = [UIImage]()
        
        do{
            loadItems = try loadFromJSONFile(filename: "wardrobe")
        } catch let error {
            print("Error Occured Loading File: \(error)")
        }
        if loadItems.count > 0{
            for i in 0...loadItems.count-1 {
                if let data = Data(base64Encoded: loadItems[i].image, options: .ignoreUnknownCharacters){
                    images.append(UIImage(data: data)!)
                }
            }
        }
        while(i < wardrobeItems.count){
            if loadItems[i].tag == "top" {
                topImageView.image = images[i]
            } else if loadItems[i].tag == "bottom"{
                bottomImageView.image = images[i]
            } else if loadItems[i].tag == "shoes"{
                shoesImageView.image = images[i]
            }
            i += 1
        }
        
    }
    
    @IBAction func panTop(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x , y: view.center.y - 230)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        
        if sender.state == .ended{
            if card.center.x < 50{
                UIView.animate(withDuration: 0.2,
                               animations: {card.center = CGPoint(x: self.view.center.x-400, y: self.view.center.y + -200)
                                card.alpha = 0
                })
                
            }else if card.center.x > (view.frame.width - 50){
                UIView.animate(withDuration: 0.2,
                               animations: {card.center = CGPoint(x: self.view.center.x+400, y: self.view.center.y + -200)
                                card.alpha = 0
                })
            } else{
                UIView.animate(withDuration: 0.2, animations: {card.center = CGPoint(x: self.view.center.x, y: self.view.center.y + -230)
                    card.transform = CGAffineTransform.identity

                })

            }
        }
    }
    
    @IBAction func panBottom(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x , y: view.center.y)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        
        if sender.state == .ended{
            if card.center.x < 50{
                UIView.animate(withDuration: 0.2,
                               animations: {card.center = CGPoint(x: self.view.center.x-400, y: self.view.center.y + 35)
                                card.alpha = 0
                })
                
            }else if card.center.x > (view.frame.width - 50){
                UIView.animate(withDuration: 0.2,
                               animations: {card.center = CGPoint(x: self.view.center.x+400, y: self.view.center.y + 35)
                                card.alpha = 0
                })
            } else{
                UIView.animate(withDuration: 0.2, animations: {card.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 30)
                    card.transform = CGAffineTransform.identity
                    
                })
            }
        }
    }
    
    @IBAction func panShoes(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x , y: view.center.y + 295)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        
        if sender.state == .ended{
            if card.center.x < 50{
                UIView.animate(withDuration: 0.2,
                               animations: {card.center = CGPoint(x: self.view.center.x-400, y: self.view.center.y + 295)
                                card.alpha = 0
                })
                
            }else if card.center.x > (view.frame.width - 50){
                UIView.animate(withDuration: 0.2,
                               animations: {card.center = CGPoint(x: self.view.center.x+400, y: self.view.center.y + 295)
                                card.alpha = 0
                })
            } else{
                UIView.animate(withDuration: 0.2, animations: {card.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 290)
                    card.transform = CGAffineTransform.identity
                    
                })
                
            }
        }
    }
}
