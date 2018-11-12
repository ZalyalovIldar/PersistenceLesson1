//
//  DataManager.swift
//  VKClone
//
//  Created by Петр on 04/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation

final class DataManager: DataManagerProtocol {
    
    var delay: Double = 2
    
    // MARK: - Data keys
    
    static let postsDataKey = "Posts"
    static let userDataKey = "User"
    
    
    // MARK: - Operation queues
    
    private lazy var searchOperationQueue: OperationQueue = {
        
        let queue = OperationQueue()
        queue.name = "Search operation queue"
        
        return queue
    }()
    
    private lazy var addOperationQueue: OperationQueue = {
        
        let queue = OperationQueue()
        queue.name = "Add operation queue"
        
        return queue
    }()
    
    private lazy var saveOperationQueue: OperationQueue = {
        
        let queue = OperationQueue()
        queue.name = "Save operation queue"
        
        return queue
    }()
    
    
    // MARK: - Constructor
    
    init() {
        
        if UserDefaults.standard.object(forKey: DataManager.postsDataKey) == nil {
            let currentPosts = Generator().generateAndSaveRandomPosts()
            saveChangesInUserDefaults(data: currentPosts, dataKey: DataManager.postsDataKey)
        }
        
        if UserDefaults.standard.object(forKey: DataManager.userDataKey) == nil {
            let currentUser = Generator().generateAndSaveRandomUser()
            saveChangesInUserDefaults(data: currentUser, dataKey: DataManager.userDataKey)
        }
    }
    
    
    // MARK: - Obtain user and posts
    
    /// Returns current user
    ///
    /// - Returns: current user
    func obtainUser() -> User? {
        
        if let currentUserData = UserDefaults.standard.data(forKey: DataManager.userDataKey) {
            
            guard let currentUser = NSKeyedUnarchiver.unarchiveObject(with: currentUserData) as? User
                else { return nil }
            
            return currentUser
        }
    
        return nil
    }
    
    /// Returns current posts
    ///
    /// - Parameter completionBlock: block for returning posts
    func obtainData(completionBlock: @escaping ([Post]) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            if let currentPostsData = UserDefaults.standard.data(forKey: DataManager.postsDataKey) {
                
                guard let currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post]
                else { return completionBlock([]) }
                
                completionBlock(currentPosts)
            }
        }
    }
    
    
    // MARK: - Search post
    
    /// Search post by given id
    ///
    /// - Parameter id: identificator
    /// - Returns: post with given id
    func searchPost(by id: String) -> Post? {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: DataManager.postsDataKey) {
            
            guard let currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post]
                else { return nil }
            
            let result = currentPosts.filter{ post in post.id == id }
            
            if result.count != 0 {
                return result.first
            }
            
            return nil
        }
        
        return nil
    }
    
    /// Async version of searching post by given id
    ///
    /// - Parameter id: identificator
    ///   - completionBlock: for returning post with given id
    func asyncSearchPost(by id: String, completionBlock: @escaping (Post?) -> Void) {
        searchOperationQueue.addOperation {

            if let currentPostsData = UserDefaults.standard.data(forKey: DataManager.postsDataKey) {
                
                guard let currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post]
                    else { return completionBlock(nil) }
                
                completionBlock(currentPosts.filter{ post in post.id == id}[0])
            }
        }
    }
    

    // MARK: - Add post
    
    /// Add new post
    ///
    /// - Parameter post: new post
    func addPost(_ post: Post) {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: DataManager.postsDataKey) {
            
            guard var currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post] else { return }
            
            // add to top of list
            var newPosts: [Post] = [post]
            newPosts += currentPosts
            currentPosts = newPosts
            
            // save in UserDefaults
            saveChangesInUserDefaults(data: currentPosts, dataKey: DataManager.postsDataKey)
        }
    }
    
    /// Async version of adding post
    ///
    /// - Parameters:
    ///   - post: new post
    ///   - completionBlock: for returning result of operation
    func asyncAddPost(_ post: Post, completionBlock: @escaping (Bool) -> ()) {
        addOperationQueue.addOperation {
            
            self.addPost(post)
            completionBlock(true)
        }
    }
    
    
    // MARK: - Save post
    
    /// Save updated post
    ///
    /// - Parameter post: post with changes
    func saveAndUpdatePost(_ post: Post) {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: DataManager.postsDataKey) {
            
            guard var currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post]
                else { return }
            
            // find post and save changes locally
            let index = currentPosts.firstIndex { (oldPost) -> Bool in
                oldPost.id == post.id
            }
            
            if index == -1 {
                currentPosts.insert(post, at: currentPosts.count)
            }
            else {
                currentPosts.remove(at: index!)
                currentPosts.insert(post, at: index!)
            }
            
            // save changes in UserDefaults
            saveChangesInUserDefaults(data: currentPosts, dataKey: DataManager.postsDataKey)
        }
    }
    
    /// Async version of saving of updated post
    ///
    /// - Parameters:
    ///   - post: post with changes
    ///   - completionBlock: for returing result of operations
    func asyncSaveAndUpdatePost(_ post: Post, completionBlock: @escaping (Bool) -> ()) {
        saveOperationQueue.addOperation {
            
            self.saveAndUpdatePost(post)
            completionBlock(true)
        }
    }
    
    
    // MARK: - Save in UserDefaults
    
    /// Save data by key in UserDefaults
    ///
    /// - Parameters:
    ///   - data: given data
    ///   - dataKey: given key
    func saveChangesInUserDefaults(data: Any, dataKey: String) {
        
        let archiver = NSKeyedArchiver.archivedData(withRootObject: data)
        UserDefaults.standard.set(archiver, forKey: dataKey)
        UserDefaults.standard.synchronize()
    }
    
}
