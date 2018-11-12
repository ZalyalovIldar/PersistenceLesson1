//
//  DataProtocol.swift
//  VKClone
//
//  Created by Петр on 04/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation

// Protocol for working with data
protocol DataManagerProtocol {
    
    /// Returns current user
    ///
    /// - Returns: current user
    func obtainUser() -> User?
    
    /// Returns current posts
    ///
    /// - Parameter completionBlock: block for returning posts
    func obtainData(completionBlock: @escaping ([Post]) -> Void)
    
    /// Search post by given id
    ///
    /// - Parameter id: identificator
    /// - Returns: post with given id
    func searchPost(by id: String) -> Post?
    
    /// Async version of searching post by given id
    ///
    /// - Parameter id: identificator
    ///   - completionBlock: for returning post with given id
    func asyncSearchPost(by id: String, completionBlock: @escaping (Post?) -> Void)
    
    /// Add new post
    ///
    /// - Parameter post: new post
    func addPost(_ post: Post)
    
    /// Async version of adding post
    ///
    /// - Parameters:
    ///   - post: new post
    ///   - completionBlock: for returning result of operation
    func asyncAddPost(_ post: Post, completionBlock: @escaping (Bool) -> Void)
    
    /// Save updated post
    ///
    /// - Parameter post: post with changes
    func saveAndUpdatePost(_ post: Post)
    
    /// Async version of saving of updated post
    ///
    /// - Parameters:
    ///   - post: post with changes
    ///   - completionBlock: for returing result of operations
    func asyncSaveAndUpdatePost(_ post: Post, completionBlock: @escaping (Bool) -> Void)
    
    /// Save given data in UserDefaults
    /// - Parameters:
    ///   - data: given data
    ///   - dataKey: identificator in memory
    func saveChangesInUserDefaults(data: Any, dataKey: String)
}
