//
//  Model.swift
//  VKClone
//
//  Created by Петр on 04/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation

/// - Parameters:
///   - groupName: group title
//    - groupAvatar: group avatar
//    - postDate: date of news posting
//    - postText: news text
//    - postImageLink: attached image
//    - likesCount: how many likes
//    - commentsCount: how many comments
//    - viewsCount: how many watchers
class Model: NSObject, NSCoding {
    
    @objc var id: String
    @objc var groupName: String
    @objc var groupAvatar: String
    @objc var postDate: String
    @objc var postText: String
    @objc var postImageLink: String
    @objc var likesCount: Int
    @objc var commentsCount: Int
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
        aCoder.encode(id, forKey: #keyPath(Model.id))
        aCoder.encode(groupAvatar, forKey: #keyPath(Model.groupAvatar))
        aCoder.encode(groupName, forKey: #keyPath(Model.groupName))
        aCoder.encode(postDate, forKey: #keyPath(Model.postDate))
        aCoder.encode(postText, forKey: #keyPath(Model.postText))
        aCoder.encode(postImageLink, forKey: #keyPath(Model.postImageLink))
        aCoder.encode(likesCount, forKey: #keyPath(Model.likesCount))
        aCoder.encode(commentsCount, forKey: #keyPath(Model.commentsCount))
        aCoder.encode(viewsCount, forKey: #keyPath(Model.viewsCount))
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: #keyPath(Model.id)) as? String ?? ""
        groupName = aDecoder.decodeObject(forKey: #keyPath(Model.groupName)) as? String ?? ""
        groupAvatar = aDecoder.decodeObject(forKey: #keyPath(Model.groupAvatar)) as? String ?? ""
        postDate = aDecoder.decodeObject(forKey: #keyPath(Model.postDate)) as? String ?? ""
        postText = aDecoder.decodeObject(forKey: #keyPath(Model.postText)) as? String ?? ""
        postImageLink = aDecoder.decodeObject(forKey: #keyPath(Model.postImageLink)) as? String ?? ""
        likesCount = aDecoder.decodeInteger(forKey: #keyPath(Model.likesCount))
        commentsCount = aDecoder.decodeInteger(forKey: #keyPath(Model.commentsCount))
        viewsCount = aDecoder.decodeInteger(forKey: #keyPath(Model.viewsCount))
    }
}
