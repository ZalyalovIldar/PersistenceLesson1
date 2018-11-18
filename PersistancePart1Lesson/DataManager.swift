//
//  DataManager.swift
//  MultithreadingProject
//
//  Created by Тимур Бадретдинов on 17/11/2018.
//  Copyright © 2018 Ильдар Залялов. All rights reserved.
//

import UIKit

class DataManager: PostDataProtocol  {
    
    static var postKey = "key_post"
    
    // MARK: - Operation queues
    private lazy var getPostOperationQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Search queue"
        
        return queue
    }()
    
    private lazy var addOperationQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Add post queue"
        return queue
    }()
    
    private lazy var getAllPostsOperationQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Get all posts queue"
        return queue
    }()

    // MARK: - Realization of methods
    func getPostSync(by id: Int) -> Post? {
        let postsArray = (self.getAllPostsSync().filter{ post in post.postId == id})
        return postsArray.first
    }
    
    func getPostAsync(by id: Int, completionBlock: @escaping (Post?) -> Void) {
        getPostOperationQueue.addOperation{ [weak self] in
            guard let strongSelf = self else { return }
            completionBlock(strongSelf.getPostSync(by: id))
        }
    }
    
    func addPostSync(post: Post) {
        var allPosts:[Post] = self.getAllPostsSync()
        allPosts.append(post)
        let archiver = NSKeyedArchiver.archivedData(withRootObject: allPosts)
        UserDefaults.standard.set(archiver, forKey: DataManager.postKey)
        UserDefaults.standard.synchronize()
    }
    
    func addPostAsync(post: Post, completionBlock: @escaping (Bool) -> Void) {
        addOperationQueue.addOperation {
            self.addPostSync(post: post)
            completionBlock(true)
        }
    }
    
    func getAllPostsSync() -> [Post] {
        if let posts = UserDefaults.standard.data(forKey: DataManager.postKey){
            guard let myposts = NSKeyedUnarchiver.unarchiveObject(with: posts) as? [Post] else {return []}
            return myposts
        }
        return []
    }
    
    func getAllPostsAsync(completionBlock: @escaping ([Post]) -> Void) {
        getAllPostsOperationQueue.addOperation{ [weak self] in
            guard let strongSelf = self else { return }
            completionBlock(strongSelf.getAllPostsSync())
        }
    }
    
    func getCount() -> Int {
        if let posts = UserDefaults.standard.data(forKey: DataManager.postKey){
            guard let posts = NSKeyedUnarchiver.unarchiveObject(with: posts) as? [Post] else {return 0}
            return posts.count
        }
        return 0
    }
}
