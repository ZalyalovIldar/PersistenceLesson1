//
//  DataManager.swift
//  VKClone
//
//  Created by Петр on 04/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation

final class DataManager: DataManagerProtocol {
    
    static let modelsDataKey = "Models"
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
        
        if UserDefaults.standard.object(forKey: DataManager.modelsDataKey) == nil {
            Generator().generateAndSaveRandomModels()
        }
        
        if UserDefaults.standard.object(forKey: DataManager.userDataKey) == nil {
            Generator().generateAndSaveRandomUser()
        }
    }
    
    
    // MARK: - Obtain user and models
    
    func obtainUser() -> User? {
        
        if let currentUserData = UserDefaults.standard.data(forKey: DataManager.userDataKey) {
            
            guard let currentUser = NSKeyedUnarchiver.unarchiveObject(with: currentUserData) as? User
                else { return nil }
            
            return currentUser
        }
    
        return nil
    }
    
    func obtainData(completionBlock: @escaping ([Model]) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let currentModelsData = UserDefaults.standard.data(forKey: DataManager.modelsDataKey) {
                
                guard let currentModels = NSKeyedUnarchiver.unarchiveObject(with: currentModelsData) as? [Model]
                else { return completionBlock([]) }
                
                completionBlock(currentModels)
            }
        }
    }
    
    
    // MARK: - Search model
    
    func syncSearchModel(id: String) -> Model? {
        
        if let currentModelsData = UserDefaults.standard.data(forKey: DataManager.modelsDataKey) {
            
            guard let currentModels = NSKeyedUnarchiver.unarchiveObject(with: currentModelsData) as? [Model]
                else { return nil }
            
            return currentModels.filter{ model in model.id == id}[0]
        }
        
        return nil
    }
    
    func asyncSearchModel(id: String, completionBlock: @escaping (Model?) -> Void) {
        searchOperationQueue.addOperation {

            if let currentModelsData = UserDefaults.standard.data(forKey: DataManager.modelsDataKey) {
                
                guard let currentModels = NSKeyedUnarchiver.unarchiveObject(with: currentModelsData) as? [Model]
                    else { return completionBlock(nil) }
                
                completionBlock(currentModels.filter{ model in model.id == id}[0])
            }
        }
    }
    

    // MARK: - Add model
    
    func syncAddModel(model: Model) {
        
        if let currentModelsData = UserDefaults.standard.data(forKey: DataManager.modelsDataKey) {
            
            guard var currentModels = NSKeyedUnarchiver.unarchiveObject(with: currentModelsData) as? [Model] else { return }
            
            // add to top of list
            var newModels: [Model] = [model]
            newModels += currentModels
            currentModels = newModels
            
            // save in UserDefaults
            let archiver = NSKeyedArchiver.archivedData(withRootObject: currentModels)
            UserDefaults.standard.set(archiver, forKey: DataManager.modelsDataKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    func asyncAddModel(model: Model, completionBlock: @escaping () -> (Bool)) {
        addOperationQueue.addOperation {
            
            if let currentModelsData = UserDefaults.standard.data(forKey: DataManager.modelsDataKey) {
                
                guard var currentModels = NSKeyedUnarchiver.unarchiveObject(with: currentModelsData) as? [Model] else { return }
                
                // add to top of list
                var newModels: [Model] = [model]
                newModels += currentModels
                currentModels = newModels
                
                // save in UserDefaults
                let archiver = NSKeyedArchiver.archivedData(withRootObject: currentModels)
                UserDefaults.standard.set(archiver, forKey: DataManager.modelsDataKey)
                UserDefaults.standard.synchronize()
                
                completionBlock()
            }
        }
    }
    
    
    // MARK: - Save model
    
    func syncSaveModel(model: Model) {
        
        if let currentModelsData = UserDefaults.standard.data(forKey: DataManager.modelsDataKey) {
            
            guard var currentModels = NSKeyedUnarchiver.unarchiveObject(with: currentModelsData) as? [Model]
                else { return }
            
            // find model and save changes locally
            let index = currentModels.firstIndex { (oldModel) -> Bool in
                oldModel.id == model.id
            }
            currentModels.insert(model, at: index ?? currentModels.count)
            
            // save changes in UserDefaults
            let archiver = NSKeyedArchiver.archivedData(withRootObject: currentModelsData)
            UserDefaults.standard.set(archiver, forKey: DataManager.modelsDataKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    func asyncSaveModel(model: Model, completionBlock: @escaping () -> (Bool)) {
        saveOperationQueue.addOperation {
            
            if let currentModelsData = UserDefaults.standard.data(forKey: DataManager.modelsDataKey) {
                
                guard var currentModels = NSKeyedUnarchiver.unarchiveObject(with: currentModelsData) as? [Model]
                    else { return }
                
                // find model and save changes locally
                let index = currentModels.firstIndex { (oldModel) -> Bool in
                    oldModel.id == model.id
                }
                currentModels.insert(model, at: index ?? currentModels.count)
                
                // save changes in UserDefaults
                let archiver = NSKeyedArchiver.archivedData(withRootObject: currentModelsData)
                UserDefaults.standard.set(archiver, forKey: DataManager.modelsDataKey)
                UserDefaults.standard.synchronize()
                
                completionBlock()
            }
        }
    }
    
}
