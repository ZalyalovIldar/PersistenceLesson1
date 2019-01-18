//
//  NewsViewController.swift
//  homework2
//
//  Created by itisioslab on 06.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    var news:News!
    var dataManager: DataManagerProtocol!
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var imageInNews: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var likeCountLabel: UILabel!

    @IBOutlet weak var commentCountLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        avatarImage.image = UIImage(named: news.avatar)
        nameLabel.text = "\(news.name ) \(news.surname )"
        dateLabel.text = news.date
        imageInNews.image = UIImage(named: news.imageInNews)
        likeCountLabel.text = String(news.like)
        commentCountLabel.text = String(news.comment)
        
        
        dataManager = DataManager()
    }

    
    @IBAction func shareTextButton(_ sender: Any) {
        let text = "This is some text that I want to share."
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)

    }
    
}
