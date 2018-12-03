//
//  MainViewController.swift
//  testPara
//
//  Created by Александр Арсенюк on 01.10.2018.
//  Copyright © 2018 Александр Арсенюк. All rights reserved.
//

import UIKit
import Foundation

class Post:NSObject, NSCoding{
   
    
    @objc var imagePost: UIImage
    @objc var textPost: String
     init(imagePost: UIImage, textPost: String) {
        self.imagePost = imagePost
        self.textPost = textPost
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(imagePost, forKey: #keyPath(Post.imagePost))
        aCoder.encode(textPost, forKey: #keyPath(Post.textPost))
    }
    
    required init?(coder aDecoder: NSCoder) {
        imagePost = aDecoder.decodeObject(forKey: #keyPath(Post.imagePost)) as! UIImage
        textPost = aDecoder.decodeObject(forKey: #keyPath(Post.textPost)) as! String
    }
}


    var dataManager: Data!

    var sum = dataManager.ObtainRandomPhoto()



class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {
    
    var photo = #imageLiteral(resourceName: "post3")
    
    /// реализация pulltoupdate
    lazy var refresher: UIRefreshControl = {
        let refreshConrol = UIRefreshControl()
        refreshConrol.tintColor = .black
        refreshConrol.addTarget(self, action: #selector(requestData), for: .valueChanged)
        
        return refreshConrol
    }()
    var dataArray: [Post] = []
    
    
    @IBOutlet weak var tableView: UITableView!

    /// Сохранение данных и их печать
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func saveDataButton(_ sender: Any) {
        dataManager.asyncSaveData { [unowned self](postArray) in
            self.dataArray=postArray
            
           
            let pending = UIAlertController(title: "Successful saving", message: "Your data was saved. Search it in console", preferredStyle: .alert)
            let indicator = UIActivityIndicatorView()
            pending.view.addSubview(indicator)
            indicator.isUserInteractionEnabled = false
            self.present(pending, animated: true, completion: nil)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            pending.addAction(ok)
        }
    }
    
    @IBAction func searchButton(_ sender: Any) {
        dataManager.asyncSearchData(str: "2") { [unowned self](postArray) in
            self.dataArray=postArray
        }
    }
    /// То что просиходит при свайпе вниз(обновление данных)
   
    @objc func requestData() {
        let count = dataArray.count
        for _ in 0..<dataArray.count
        {
            dataArray.remove(at: 0)
             tableView.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
            print(dataArray.count)
        }
        for _ in 0..<count
        {
            
            dataArray.append(Post(imagePost:dataManager.ObtainRandomPhoto() , textPost: dataManager.ObtainRandomName()))
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.top)
        }
 
        tableView.reloadData()
        self.refresher.endRefreshing()
       
    }
    
    /// Добавить ячейку
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func addButtonPressed(_ sender: Any) {
        dataArray.append(Post(imagePost: dataManager.ObtainRandomPhoto(), textPost: dataManager.ObtainRandomName()))
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.top)
        tableView.endUpdates()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager=DataStorage()
        navigationItem.rightBarButtonItem = editButtonItem
        tableView.estimatedRowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refresher
        readData()
        dataManager.asyncObtainData { [unowned self](postArray) in
            self.dataArray = postArray
            let archiver = NSKeyedArchiver.archivedData(withRootObject: self.dataArray )
            UserDefaults.standard.set(archiver, forKey: "key")
            UserDefaults.standard.synchronize()
            DispatchQueue.main.async {
                self.tableView.reloadData()
           
        }
    }
        
        
}
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        
        if let curArrData = UserDefaults.standard.data(forKey: "key") {
            guard let curArr = NSKeyedUnarchiver.unarchiveObject(with: curArrData) as? [Post] else {return}
            
            for i in curArr
            {
                print("___________________________________________________")
                print(i)
                print("___________________________________________________")
            }
            
        }
     
    }
    func readData() {
        if let dataFile = Bundle.main.path(forResource: "testprop", ofType: "plist") {
            let dataDict = NSDictionary (contentsOfFile: dataFile)
            print("Data \(String(describing: dataDict))")
        }
    }
    
    /// Кол-во ячеек в секции
    ///
    /// - Parameters:
    ///   - tableView: Наша таблица
    ///   - section: Секция
    /// - Returns: Кол-во равное массиву постов
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataArray.count
    }
    
    /// Конфиг ячейки
    ///
    /// - Parameters:
    ///   - tableView: Наша таблица
    ///   - indexPath: Индекс настраевомемой ячейки
    /// - Returns: Ячейку возвращаем отредактируемую
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.configureCell(with:dataManager.ObtainRandomPhoto() , nameString: dataManager.ObtainRandomName(), delegate: self)
        return cell
        
    }
    /// Связь вьюх
    ///
    /// - Parameters:
    ///   - segue: идентификатор
    ///   - sender: <#sender description#>
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue", let model = sender as? Post {
            let destinationController = segue.destination as! ViewController
            destinationController.model = model
        }
    }
    /// Нажатие кнопки, открытие новой вьюхи
    func didPressInfoButton() {
       
        let model = Post(imagePost:dataManager.ObtainRandomPhoto() , textPost: dataManager.ObtainRandomName())
        
        
        performSegue(withIdentifier: "detailSegue", sender: model)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
     /// Возможность редактирование
     ///
     /// - Parameters:
     ///   - tableView: наша таблица
     ///   - indexPath: Индекс редактируемой ячейки
     /// - Returns: Разрешаем редактирование
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    /// Удаляем ячейку
    ///
    /// - Parameters:
    ///   - tableView: Наша таблица
    ///   - editingStyle: доступ редактирование
    ///   - indexPath: Индекс удаляемой ячейки
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    /// Возможность двигать ячейки
    ///
    /// - Parameters:
    ///   - tableView: Наша таблица
    ///   - sourceIndexPath: Индекс ячейки откуда двигаем
    ///   - destinationIndexPath: Индекс ячейки куда двигаем
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
}



