
//
//  DataManagerProtocol.swift
//  homework2
//
//  Created by itisioslab on 18.01.2019.
//  Copyright © 2019 FirstGroupCompany. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    
    
    func obtainData(completionBlock: @escaping ([News]) -> Void)
    
    func addNews(_ news:News)
    
    func saveNews(_ news:News)
    
}
