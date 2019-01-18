//
//  DetailViewController.swift
//  homework2
//
//  Created by itisioslab on 26.09.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var newUser: User!
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var moodLabel: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var familyStatusLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var linlLabel: UILabel!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var linkImage: UIImageView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var whereAndHowLongLabek: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var uniNameLabel: UILabel!
    @IBOutlet weak var uniFacultyLabel: UILabel!
    @IBOutlet weak var whenUniLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    
    @IBOutlet weak var giftImage1: UIImageView!
    @IBOutlet weak var giftImage2: UIImageView!
    @IBOutlet weak var giftImage3: UIImageView!
    @IBOutlet weak var giftImage4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFieldValues()

    }
    func setFieldValues() {
        
        avatarImage.image = #imageLiteral(resourceName: "ava1")
        nameLabel.text = "\(newUser?.name ?? "") \(newUser?.surname ?? "")"
        statusLabel.text = newUser?.status
        ageLabel.text = "\(newUser?.age ?? 0) лет"
        
        moodLabel.text = newUser.mood
        dateLabel.text = newUser.date
        educationLabel.text = newUser.school
        familyStatusLabel.text = newUser.familyStatus
        languagesLabel.text = newUser.languages
        
        phoneNumberLabel.text = newUser.phone
        cityLabel.text = newUser.city
        linlLabel.text = newUser.link
        
        companyNameLabel.text = newUser.companyName
        whereAndHowLongLabek.text = String(newUser.timeInUni)
        positionLabel.text = newUser.position
        
        uniNameLabel.text = newUser.university
        uniFacultyLabel.text = newUser.faculty
        whenUniLabel.text = String(newUser.timeInUni)
        schoolLabel.text = newUser.school
    
        
        
        phoneImage.image = #imageLiteral(resourceName: "phoneIcon")
        linkImage.image = #imageLiteral(resourceName: "vkIcon")
        cityImage.image = #imageLiteral(resourceName: "cityIcon")
        
        giftImage1.image = #imageLiteral(resourceName: "gift1")
        giftImage2.image = #imageLiteral(resourceName: "gift2")
        giftImage3.image = #imageLiteral(resourceName: "gift3")
        giftImage4.image = #imageLiteral(resourceName: "gift4")
        
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        avatarImage.clipsToBounds = true
        
        phoneImage.layer.cornerRadius = phoneImage.frame.width / 2
        phoneImage.clipsToBounds = true
        
        linkImage.layer.cornerRadius = linkImage.frame.width / 2
        linkImage.clipsToBounds = true
        
        cityImage.layer.cornerRadius = cityImage.frame.width / 2
        cityImage.clipsToBounds = true
    }
   
    
   
    

}
