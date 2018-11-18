//
//  DataManager.swift
//  NewProject
//
//  Created by Гузель on 04.11.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//


protocol DataManager {
    
    /// Асинхронное добавление поста
    ///
    /// - Parameters:
    ///   - post: объект Post
    ///   - completion: блок - обработчик, связанное значение - bool (cтатус результата выполнения задачи)
    /// - Returns:
    func addAsync(post: Post, completion: @escaping (Bool) -> Void)
    
    
    /// Cинхронное добавление поста
    ///
    /// - Parameter post: объект Post
    /// - Returns: cтатус результата выполнения задачи
    func addSync(post: Post) -> Bool
    
    
    /// Асинхронное удаление поста
    ///
    /// - Parameters:
    ///   - id: id поста который нужно удалить
    ///   - completion: блок - обработчик, связанное значение - bool (cтатус результата выполнения задачи)
    /// - Returns:
    func removeAsync(by id: Int, completion: @escaping (Bool) -> Void)
    
    
    /// Синхронное удаление поста
    ///
    /// - Parameter id: id поста который нужно удалить
    /// - Returns: cтатус результата выполнения задачи
    func removeSync(by id: Int) -> Bool
    
    
    /// Асинхронный поиск поста
    ///
    /// - Parameters:
    ///   - id: id поста который нужно найти
    ///   - completion: блок - обработчик, связанное значение - Post? (Опциональный результат поиска поста)
    /// - Returns:
    func searchAsync(by id: Int, completion: @escaping (Post?) -> Void)
    
    
    /// Синхронный поиск поста
    ///
    /// - Parameter id: id поста который нужно найти
    /// - Returns: Опциональный результат поиска поста - Post?
    func searchSync(by id: Int) -> Post?

    /// Асинхронное получение всех постов
    ///
    /// - Parameter completion: блок - обработчик, связанное значение - [Post] (Массив всех постов)
    /// - Returns:
    func allPostsAsync(completion: @escaping ([Post]) -> Void)
    
    
    /// Синхронное получение всех постов
    ///
    /// - Returns: Массив всех постов
    func allPostsSync() -> [Post]
    
    
}
