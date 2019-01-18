//
//  DataManager.swift
//  homework2
//
//  Created by itisioslab on 18.01.2019.
//  Copyright © 2019 FirstGroupCompany. All rights reserved.
//

import Foundation

class DataManager: DataManagerProtocol {
    
    static let newsDataKey = "News"
    
    init() {
        
        if UserDefaults.standard.object(forKey: DataManager.newsDataKey) == nil {
            let currentNews = Randomizer().getAndSaveRandomNews()
            saveChangesInUserDefaults(data: currentNews, dataKey: DataManager.newsDataKey)
        }
    }
    
    func saveChangesInUserDefaults(data: Any, dataKey: String) {
        
        let archiver = NSKeyedArchiver.archivedData(withRootObject: data)
        UserDefaults.standard.set(archiver, forKey: dataKey)
        UserDefaults.standard.synchronize()
    }
    
    func obtainData(completionBlock: @escaping ([News]) -> Void) {
        
        if let currentNewsData = UserDefaults.standard.data(forKey: DataManager.newsDataKey) {
            
            guard let currentNews = NSKeyedUnarchiver.unarchiveObject(with: currentNewsData) as? [News]
                else { return completionBlock([]) }
            
            completionBlock(currentNews)
        }
    }
    
    func addNews(_ news: News) {
        if let currentNewsData = UserDefaults.standard.data(forKey: DataManager.newsDataKey) {
            
            guard var currentNews = NSKeyedUnarchiver.unarchiveObject(with: currentNewsData) as? [News] else { return }
            
            // add to top of list
            var newNews: [News] = [news]
            newNews += currentNews
            currentNews = newNews
             saveChangesInUserDefaults(data: currentNews, dataKey: DataManager.newsDataKey)
        }
        
    }
        
    func saveNews(_ news: News) {
        
            if let currentNewsData = UserDefaults.standard.data(forKey: DataManager.newsDataKey) {
                
                guard var currentNews = NSKeyedUnarchiver.unarchiveObject(with: currentNewsData) as? [News]
                    else { return }
                
                saveChangesInUserDefaults(data: currentNews, dataKey: DataManager.newsDataKey)
            }

    
    

}
}

