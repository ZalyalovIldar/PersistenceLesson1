//
//  PostTableViewCell.swift
//  VKClone
//
//  Created by Петр on 04/10/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupAvatarImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    weak var parentViewController: UIViewController!

    // MARK: - Configure cell
  
    /// Fills current table cell with given post data
    ///
    /// - Parameters:
    ///   - post: given post
    ///   - parentVC: parent view controller
    func congigureCell(with post: Post, parentVC: UIViewController) {
        
        parentViewController = parentVC
        
        groupAvatarImageView.image = UIImage(named: post.groupAvatar)
        groupNameLabel.text = post.groupName
        postDateLabel.text = post.postDate
        postTextLabel.text = post.postText
        postImageView.image = UIImage(named: post.postImageLink)
        likeCountLabel.text = String(post.likesCount)
        commentsCountLabel.text = String(post.commentsCount)
        viewsCountLabel.text = String(post.viewsCount)
        
        applyStyles()
    }

    /// Applies styles to view objects
    func applyStyles() {
        
        groupAvatarImageView.layer.cornerRadius = groupAvatarImageView.frame.width / 2
        groupAvatarImageView.clipsToBounds = true
    }
    
    
    @IBAction func didShareButtonPressed(_ sender: Any) {
        
        guard let text = postTextLabel.text else { return }
        let vc = UIActivityViewController(activityItems: [text], applicationActivities: [])
        
        if let popoverController = vc.popoverPresentationController {
            
            popoverController.sourceView = parentViewController.view
            popoverController.sourceRect = parentViewController.view.bounds
        }
        
        parentViewController.present(vc, animated: true, completion: nil)
    }

}
