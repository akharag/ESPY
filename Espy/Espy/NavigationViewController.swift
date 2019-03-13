//
//  NavigationViewController.swift
//  Espy
//
//  Created by Alexander L Kharag on 3/4/19.
//  Copyright © 2019 Desislava Nacheva. All rights reserved.
//

import Foundation
import UIKit

class NavigationViewcontroller: UINavigationController{
    let arrayOfViewControllers = [MainMenuViewController(), UploadViewController(), GalleryViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
