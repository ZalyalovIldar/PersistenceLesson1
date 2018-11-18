//
//  Post.swift
//  NewProject
//
//  Created by Гузель on 04.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation
import UIKit

class Post: NSObject, NSCoding {

    /// id
    @objc var id: Int
    /// название группы
    @objc var name: String
    /// аватар группы
    @objc var avatar: UIImage
    /// описание поста
    @objc var textDescription: String?
    /// изображение, прикрепленное к посту
    @objc var someImage: UIImage?
    
    init(id: Int, name:String, avatar: UIImage, textDescription: String?, someImage: UIImage?) {
        self.id = id
        self.name = name
        self.avatar = avatar
        self.textDescription = textDescription
        self.someImage = someImage
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(id, forKey: #keyPath(Post.id))
        aCoder.encode(name, forKey: #keyPath(Post.name))
        aCoder.encode(avatar, forKey: #keyPath(Post.avatar))
        aCoder.encode(textDescription, forKey: #keyPath(Post.textDescription))
        aCoder.encode(someImage, forKey: #keyPath(Post.someImage))
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeInteger(forKey: #keyPath(Post.id))
        name = aDecoder.decodeObject(forKey: #keyPath(Post.name)) as? String ?? ""
        avatar = aDecoder.decodeObject(forKey: #keyPath(Post.avatar)) as? UIImage ?? UIImage()
        textDescription = aDecoder.decodeObject(forKey: #keyPath(Post.textDescription)) as? String ?? ""
        someImage = aDecoder.decodeObject(forKey: #keyPath(Post.someImage)) as? UIImage
    }
}
