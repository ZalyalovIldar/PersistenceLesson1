//
//  UserModel.swift
//  MultithreadingProject
//
//  Created by Тимур Бадретдинов on 17/11/2018.
//  Copyright © 2018 Ильдар Залялов. All rights reserved.
//
import UIKit
import Foundation

class PostModel: NSObject, NSCoding {

    @objc var postId: Int
    @objc var authorAvatar: UIImage
    @objc var postImage: UIImage
    @objc var authorName: String
    @objc var postDate: String
    @objc var postText: String
    
    init(postId: Int, authorAvatar: UIImage, postImage: UIImage, authorName: String, postDate: String, postText: String) {
        self.postId = postId
        self.authorAvatar = authorAvatar
        self.postImage = postImage
        self.authorName = authorName
        self.postDate = postDate
        self.postText = postText
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(postId, forKey: #keyPath(PostModel.postId))
        aCoder.encode(authorAvatar, forKey: #keyPath(PostModel.authorAvatar))
        aCoder.encode(postImage, forKey: #keyPath(PostModel.postImage))
        aCoder.encode(authorName, forKey: #keyPath(PostModel.authorName))
        aCoder.encode(postDate, forKey: #keyPath(PostModel.postDate))
        aCoder.encode(postText, forKey: #keyPath(PostModel.postText))
    }
    
    required init?(coder aDecoder: NSCoder) {
        postId = aDecoder.decodeInteger(forKey: #keyPath(PostModel.postId))
        authorAvatar = aDecoder.decodeObject(forKey: #keyPath(PostModel.authorAvatar)) as! UIImage
        postImage = aDecoder.decodeObject(forKey: #keyPath(PostModel.postImage)) as! UIImage
        authorName = aDecoder.decodeObject(forKey: #keyPath(PostModel.authorName)) as! String
        postDate = aDecoder.decodeObject(forKey: #keyPath(PostModel.postDate)) as! String
        postText = aDecoder.decodeObject(forKey: #keyPath(PostModel.postText)) as! String
    }
}
