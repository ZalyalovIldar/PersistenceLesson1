//
//  Post.swift
//  VKClone
//
//  Created by Петр on 04/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation

// Post model
class Post: NSObject, NSCoding {
    
    // Uniq post identifier
    @objc var id: String
    
    // Group title
    @objc var groupName: String
    
    // Group avatar (picture)
    @objc var groupAvatar: String
    
    // Date of news posting
    @objc var postDate: String
    
    // News text
    @objc var postText: String
    
    // Attached image
    @objc var postImageLink: String
    
    // How many likes
    @objc var likesCount: Int
    
    // How many comments
    @objc var commentsCount: Int
    
    // How many watchers
    @objc var viewsCount: Int
    
    
    init(id: String, groupName: String, groupAvatar: String, postDate: String, postText: String, postImageLink: String, likesCount: Int, commentsCount: Int, viewsCount: Int) {
        self.id = id
        self.groupName = groupName
        self.groupAvatar = groupAvatar
        self.postDate = postDate
        self.postText = postText
        self.postImageLink = postImageLink
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.viewsCount = viewsCount
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: #keyPath(Post.id))
        aCoder.encode(groupAvatar, forKey: #keyPath(Post.groupAvatar))
        aCoder.encode(groupName, forKey: #keyPath(Post.groupName))
        aCoder.encode(postDate, forKey: #keyPath(Post.postDate))
        aCoder.encode(postText, forKey: #keyPath(Post.postText))
        aCoder.encode(postImageLink, forKey: #keyPath(Post.postImageLink))
        aCoder.encode(likesCount, forKey: #keyPath(Post.likesCount))
        aCoder.encode(commentsCount, forKey: #keyPath(Post.commentsCount))
        aCoder.encode(viewsCount, forKey: #keyPath(Post.viewsCount))
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: #keyPath(Post.id)) as? String ?? ""
        groupName = aDecoder.decodeObject(forKey: #keyPath(Post.groupName)) as? String ?? ""
        groupAvatar = aDecoder.decodeObject(forKey: #keyPath(Post.groupAvatar)) as? String ?? ""
        postDate = aDecoder.decodeObject(forKey: #keyPath(Post.postDate)) as? String ?? ""
        postText = aDecoder.decodeObject(forKey: #keyPath(Post.postText)) as? String ?? ""
        postImageLink = aDecoder.decodeObject(forKey: #keyPath(Post.postImageLink)) as? String ?? ""
        likesCount = aDecoder.decodeInteger(forKey: #keyPath(Post.likesCount))
        commentsCount = aDecoder.decodeInteger(forKey: #keyPath(Post.commentsCount))
        viewsCount = aDecoder.decodeInteger(forKey: #keyPath(Post.viewsCount))
    }
}
