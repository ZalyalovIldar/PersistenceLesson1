//
//  DetailUserInfoViewController.swift
//  VKClone
//
//  Created by Петр on 04/10/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import UIKit

class DetailUserInfoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameSurnameLabel: UILabel!
    @IBOutlet weak var accountStatusLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var userStatusTextField: UITextField!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    
    @IBOutlet weak var activitiesLabel: UILabel!
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var instagramLabel: UILabel!
    @IBOutlet weak var facebookLabel: UILabel!
    
    var currentUser: User!
    
    let birthday = "25 июля 1998"
    let contentSize = 860

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize.height = CGFloat(contentSize)
        applyStyles()
        setFieldValues()
        
        userStatusTextField.delegate = self
    }
    
    // MARK: - Component styles and field's values
    
    /// Applies styles to view objects
    func applyStyles() {
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.clipsToBounds = true
    }
    
    /// Set values in view's fields
    func setFieldValues() {
        
        avatarImageView.image = UIImage(named: currentUser.avatar)!
        userNameSurnameLabel.text = "\(currentUser?.name ?? "") \(currentUser?.surname ?? "")"
        accountStatusLabel.text = currentUser?.pageStatus
        ageLabel.text = "\(currentUser?.age ?? 0) лет"
        
        userStatusTextField.text = currentUser.status
        birthdayLabel.text = birthday
        cityLabel.text = currentUser.city
        schoolLabel.text = currentUser.school
        activitiesLabel.text = currentUser.hobbies
        
        instagramLabel.text = currentUser.instagramLink
        vkLabel.text = currentUser.vkLink
        facebookLabel.text = currentUser.facebookLink

    }
}
