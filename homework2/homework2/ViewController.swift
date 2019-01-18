//
//  ViewController.swift
//  homework2
//
//  Created by itisioslab on 26.09.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = getRandomUser()
        
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        avatarImage.clipsToBounds = true
        self.title = user!.name
        avatarImage.image = #imageLiteral(resourceName: "ava2")
        nameLabel.text = "\(user?.name ?? "") \(user?.surname ?? "")"
        statusLabel.text = user?.status
        ageLabel.text = "\(user?.age ?? 0) лет, \(user?.city ?? "")"
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailInfo" {
            
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.newUser = user
            }
        }
        
    }
    
}

