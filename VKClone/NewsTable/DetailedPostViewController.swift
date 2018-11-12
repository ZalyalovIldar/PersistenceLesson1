//
//  DetialPostViewController.swift
//  VKClone
//
//  Created by Петр on 07/10/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import UIKit

class DetailedPostViewController: UIViewController {
    
    @IBOutlet weak var groupAvatarImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    var dataManager: DataManagerProtocol!
    var postId: String!
    var post: Post!
    
    @IBAction func didShareButtonPressed(_ sender: Any) {
        
        guard post.postText != "" else { return }
        let text = post.postText
        let vc = UIActivityViewController(activityItems: [text], applicationActivities: [])
        
        if let popoverController = vc.popoverPresentationController {
            
            popoverController.sourceView = self.view
            popoverController.sourceRect = self.view.bounds
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager = DataManager()
        post = dataManager.searchPost(by: postId)
        
        congigureDetailedPost()
    }
    
    
    /// Configures cell with given post
    func congigureDetailedPost() {
        
        groupAvatarImageView.image = UIImage(named: post.groupAvatar)
        groupNameLabel.text = post.groupName
        postDateLabel.text = post.postDate
        postTextLabel.text = post.postText
        postImageView.image = UIImage(named: post.postImageLink)
        likesCountLabel.text = String(post.likesCount)
        commentsCountLabel.text = String(post.commentsCount)
        viewsCountLabel.text = String(post.viewsCount)
        
        applyStyles()
    }
    
    /// Applies styles to view objects
    func applyStyles() {
        
        groupAvatarImageView.layer.cornerRadius = groupAvatarImageView.frame.width / 2
        groupAvatarImageView.clipsToBounds = true
    }

}
