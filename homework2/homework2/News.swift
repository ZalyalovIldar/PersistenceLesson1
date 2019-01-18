//
//  News.swift
//  homework2
//
//  Created by itisioslab on 06.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import Foundation
import UIKit

class News: NSObject, NSCoding {
    
    // Uniq post identifier
    @objc var surname: String
    
    // Group title
    @objc var name: String
    
    // Group avatar (picture)
    @objc var avatar: String
    
    // Date of news posting
    @objc var date: String
    
    // News text
    @objc var text: String
    
    // Attached image
    @objc var imageInNews: String
    
    // How many likes
    @objc var like: Int
    
    // How many comments
    @objc var comment: Int
    
    init(surname: String, name: String, avatar: String, date: String, text: String, imageInNews: String, like: Int, comment: Int) {
        self.surname = surname
        self.name = name
        self.avatar = avatar
        self.date = date
        self.text = text
        self.imageInNews = imageInNews
        self.like = like
        self.comment = comment
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(surname, forKey: #keyPath(News.surname))
        aCoder.encode(avatar, forKey: #keyPath(News.avatar))
        aCoder.encode(name, forKey: #keyPath(News.name))
        aCoder.encode(date, forKey: #keyPath(News.date))
        aCoder.encode(text, forKey: #keyPath(News.text))
        aCoder.encode(imageInNews, forKey: #keyPath(News.imageInNews))
        aCoder.encode(like, forKey: #keyPath(News.like))
        aCoder.encode(comment, forKey: #keyPath(News.comment))
    }
    
    required init?(coder aDecoder: NSCoder) {
        surname = aDecoder.decodeObject(forKey: #keyPath(News.surname)) as? String ?? ""
        name = aDecoder.decodeObject(forKey: #keyPath(News.name)) as? String ?? ""
        avatar = aDecoder.decodeObject(forKey: #keyPath(News.avatar)) as? String ?? ""
        date = aDecoder.decodeObject(forKey: #keyPath(News.date)) as? String ?? ""
        text = aDecoder.decodeObject(forKey: #keyPath(News.text)) as? String ?? ""
        imageInNews = aDecoder.decodeObject(forKey: #keyPath(News.imageInNews)) as? String ?? ""
        like = aDecoder.decodeInteger(forKey: #keyPath(News.like))
        comment = aDecoder.decodeInteger(forKey: #keyPath(News.comment))
    }
}


