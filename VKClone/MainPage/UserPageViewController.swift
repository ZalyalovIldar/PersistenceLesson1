
//
//  UserPageViewController.swift
//  VKClone
//
//  Created by Петр on 04/10/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import UIKit

class UserPageViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameSurnameLabel: UILabel!
    @IBOutlet weak var accountStatusLabel: UILabel!
    @IBOutlet weak var userAgeAndCityLabel: UILabel!
    
    @IBOutlet weak var detailInfoButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    var user: User!
    var dataManager: DataManagerProtocol!
    
    let detailInfoSegueID = "detailUserInfo"
    let moscowCity = "Москва"
    let cornerRadius = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager = DataManager()
        user = dataManager.obtainUser()
        applyStyles()
    }
    
    // MARK: - View's styles
    
    /// Applies styles to view objects
    func applyStyles() {
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.clipsToBounds = true
        editButton.layer.cornerRadius = CGFloat(cornerRadius)
        
        avatarImageView.image = UIImage(named: user!.avatar)!
        userNameSurnameLabel.text = "\(user?.name ?? "") \(user?.surname ?? "")"
        accountStatusLabel.text = user?.pageStatus
        userAgeAndCityLabel.text = "\(user?.age ?? 0) лет, \(user?.city ?? moscowCity)"
    }
    
    
    // MARK: - Navigation
    
    /// Throws current user to DetailUserInfoViewController
    ///
    /// - Parameters:
    ///   - segue: future seque
    ///   - sender: sender
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == detailInfoSegueID {
            
            if let destinationVC = segue.destination as? DetailUserInfoViewController {
                destinationVC.currentUser = user
            }
        }
    }
    
    // MARK: - Add new model (post)
    
    @IBAction func addNewModel(_ sender: Any) {
        
        let newModel = Generator().generateRandomModel()
        
        dataManager.asyncAddModel(model: newModel) { () -> (Bool) in
                print("Model \(newModel.id) was added")
                return true
        }
        
    }
    
}
