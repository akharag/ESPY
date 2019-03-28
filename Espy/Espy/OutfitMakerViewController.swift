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
    
    var topIndex = 0
    var bottomIndex = 0
    var shoeIndex = 0
    var divisor:CGFloat!
    
    var topImages = [UIImage]()
    var bottomImages = [UIImage]()
    var shoeImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width / 2) / 0.61
        
        var loadItems = [Clothing]()
        
        
        do{
            loadItems = try loadFromJSONFile(filename: "wardrobe")
        } catch let error {
            print("Error Occured Loading File: \(error)")
        }
        if loadItems.count > 0{
            for i in 0...loadItems.count-1 {
                if let data = Data(base64Encoded: loadItems[i].image, options: .ignoreUnknownCharacters){
                    if loadItems[i].tag == "top"{
                        topImages.append(UIImage(data: data)!)
                    }else if loadItems[i].tag == "bottom"{
                        bottomImages.append(UIImage(data: data)!)
                    }else if loadItems[i].tag == "shoes"{
                        shoeImages.append(UIImage(data: data)!)
                    }else{
                        print("Image with unknown tag: \(loadItems[i].tag)")
                    }
                }
            }
        }
     
        if topImages.isEmpty {
            print("No TOP image found")
        }else{
            topImageView.image = topImages[0]
        }

        if bottomImages.isEmpty {
            print("No BOTTOM image found")
        }else{
            bottomImageView.image = bottomImages[0]
        }

        if shoeImages.isEmpty {
            print("No SHOES image found")
        }else{
            shoesImageView.image = shoeImages[0]
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
                               animations: {
                                card.center = CGPoint(x: self.view.center.x-400, y: self.view.center.y + -200)
                                card.alpha = 0
                })
                card.center = CGPoint(x: self.view.center.x, y: self.view.center.y + -230)
                card.transform = CGAffineTransform.identity
                card.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: card.frame.size.width * 0.2, height: card.frame.size.width * 0.2)
                //load next picture
                    //check if out of bounds
                if( topIndex + 1 < topImages.count ){
                    topIndex += 1
                    topImageView.image = topImages[topIndex]
                }else{
                    print("All Images used")
                    topIndex = 0
                    topImageView.image = topImages[0]
                }
                UIView.animate(withDuration: 0.2,
                               animations: {
                                card.frame = CGRect(x: self.view.center.x, y: self.view.center.y + -230, width: card.frame.size.width / 0.2, height: card.frame.size.width / 0.2)
                                card.alpha = 1
                                
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
                card.center = CGPoint(x: 0, y: self.view.center.y + 35)
                //load next picture
                //if()
                //topImageView.image =
                UIView.animate(withDuration: 0.2, animations: {card.alpha = 1})
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
