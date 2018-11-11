//
//  ViewController.swift
//  VKClone
//
//  Created by Петр on 03/10/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    let navigationBarColor =  UIColor(displayP3Red: 62/255, green: 102/255, blue: 142/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = navigationBarColor
        navigationController?.navigationBar.barStyle = UIBarStyle.blackOpaque
        navigationController?.navigationBar.tintColor = UIColor.white
    }


}

