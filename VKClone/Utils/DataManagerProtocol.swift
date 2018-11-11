//
//  DataProtocol.swift
//  VKClone
//
//  Created by Петр on 04/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    
    func obtainUser() -> User?
    func obtainData(completionBlock: @escaping ([Model]) -> Void)
    func syncSearchModel(id: String) -> Model?
    func asyncSearchModel(id: String, completionBlock: @escaping (Model?) -> Void)
    func syncAddModel(model: Model)
    func asyncAddModel(model: Model, completionBlock: @escaping () -> (Bool))
    func syncSaveModel(model: Model)
    func asyncSaveModel(model: Model, completionBlock: @escaping () -> (Bool))
}
