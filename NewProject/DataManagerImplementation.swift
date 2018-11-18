//
//  DataManagerImplementation.swift
//  NewProject
//
//  Created by Гузель on 04.11.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

class DataManagerImplementation: DataManager {
    
    let key = "Post"
    
    lazy var additingOperationQueue: OperationQueue = {
        let queue =  OperationQueue()
        queue.name = "com.DataManagerImplemetion.additingOperationQueue"
        return queue
    }()
    
    lazy var removingOperationQueue: OperationQueue = {
        let queue =  OperationQueue()
        queue.name = "com.DataManagerImplemetion.removingOperationQueue"
        return queue
    }()
    
    lazy var searchingOperationQueue: OperationQueue = {
        let queue =  OperationQueue()
        queue.name = "com.DataManagerImplemetion.searchingOperationQueue"
        return queue
    }()
    
    init() {
        
        if UserDefaults.standard.object(forKey: key) == nil {
            fillData()
        }
    }
    
    /// Заполнение массива
    func fillData() {
        let post1 = Post(id: 0, name: "Kitty", avatar: #imageLiteral(resourceName: "kitty"), textDescription: nil, someImage: #imageLiteral(resourceName: "kitty"))
        let post2 = Post(id: 1, name: "My paper", avatar: #imageLiteral(resourceName: "avatar"), textDescription: "SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE ", someImage: #imageLiteral(resourceName: "paper"))
        let post3 = Post(id: 2, name: "Chill", avatar: #imageLiteral(resourceName: "avatar"), textDescription: "October calendar", someImage: #imageLiteral(resourceName: "calendarw"))
        archiveToData(data: [post1, post2, post3], key: key)
    }
    
    func addAsync(post: Post, completion:  @escaping (Bool) -> Void) {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: key) {
            
            guard var currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post] else { return }
            
            additingOperationQueue.addOperation  { [weak self] in
                guard let key = self?.key else {
                    completion(false)
                    return
                }
                currentPosts.append(post)
                //архивирование и добавление в UserDefaults
                self?.archiveToData(data: currentPosts, key: key)
                completion(true)
            }
        }
    }
   
    func addSync(post: Post) -> Bool {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: key) {
            
            guard var currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post] else { return false }
            currentPosts.append(post)
            //архивирование и добавление в UserDefaults
            archiveToData(data: currentPosts, key: key)
        } else {
            //todo
        }
       return false
    }
    
    func removeAsync(by id: Int, completion: @escaping (Bool) -> Void) {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: key) {
            
            guard var currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post] else { return }
            removingOperationQueue.addOperation { [weak self] in
                guard let key = self?.key else {
                    completion(false)
                    return
                }
                if let i = currentPosts.index(where: { $0.id == id }) {
                    currentPosts.remove(at: i)
                    //архивирование и добавление в UserDefaults
                    self?.archiveToData(data: currentPosts, key: key)
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
        
    }

    func removeSync(by id: Int) -> Bool {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: key) {
            
            guard var currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post] else { return false }
                if let i = currentPosts.index(where: { $0.id == id }) {
                    currentPosts.remove(at: i)
                    //архивирование и добавление в UserDefaults
                    archiveToData(data: currentPosts, key: key)
                    return true
                } else {
                    //архивирование и добавление в UserDefaults
                    archiveToData(data: currentPosts, key: key)
                    return false
                }
        }
        return true
    }
    
    func searchAsync(by id: Int, completion: @escaping (Post?) -> Void) {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: key) {
            
            guard let currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post] else { return }
            searchingOperationQueue.addOperation {
                if let post = currentPosts.first(where: {$0.id == id}) {
                    completion(post)
                } else {
                    completion(nil)
                }
                
            }
        }
    }

    func searchSync(by id: Int) -> Post? {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: key) {
            
            guard let currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post] else { return nil }
            if let post = currentPosts.first(where: {$0.id == id}) {
                return post
            } else {
                return nil
            }
        }
        return nil
    }
    
    func allPostsSync() -> [Post] {
        
        if let currentPostsData = UserDefaults.standard.data(forKey: key) {
            
            guard let currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post] else { return [] }
            return currentPosts
        } else {
            return []
        }
    }
    
    func allPostsAsync(completion: @escaping ([Post]) -> Void) {
        
        searchingOperationQueue.addOperation { [weak self] in
            guard let key = self?.key else {
                completion([])
                return
            }
            if let currentPostsData = UserDefaults.standard.data(forKey: key) {
                
                guard let currentPosts = NSKeyedUnarchiver.unarchiveObject(with: currentPostsData) as? [Post]
                    else { return completion([]) }
                completion(currentPosts)
            }
        }
    }
    
    
    /// Архивирование и сохрание данных в UserDefaults
    ///
    /// - Parameters:
    ///   - data: Данные которы нужно сохранить
    ///   - key: Ключ по которому сохранятся данные
    func archiveToData(data: Any, key: String){

        let archiver = NSKeyedArchiver.archivedData(withRootObject: data)
        UserDefaults.standard.set(archiver, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
