//
//  TableViewCell.swift
//  homework2
//
//  Created by itisioslab on 03.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
 
    @IBOutlet weak var imageInNews: UIImageView!
   
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var commentCountLabel: UILabel!
   
    @IBOutlet weak var newsText: UILabel!
    
    var vc: UIViewController?
    var model: News!
    
    func configureCell(with text:String, vc:TableViewViewController, model:News ) {
        
        dateLabel.text = text
        self.vc = vc
        self.model = model
        
        avatarImage.image = UIImage(named: model.avatar)
        nameLabel.text = "\(model.name ?? "") \(model.surname ?? "")"
        dateLabel.text = model.date
        imageInNews.image = UIImage(named: model.imageInNews)
        likeCountLabel.text = String(model.like)
        commentCountLabel.text = String(model.comment)
        newsText.text = model.text
        
    }

    
    
    @IBAction func shareTextButton(_ sender: Any) {
        let text = nameLabel
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        vc?.present(activityViewController, animated: true, completion: nil)
    }
    
}
