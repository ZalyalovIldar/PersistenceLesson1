//
//  TableViewViewController.swift
//  homework2
//
//  Created by itisioslab on 03.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataManager: DataManagerProtocol!
    
    var newsArray : [News]!
    let idintifier = "detailSegue"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 300
        tableView.addSubview(refreshControl)
        
        dataManager = DataManager()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataManager.obtainData { (newsArray) in
            self.newsArray = newsArray
            self.tableView.reloadData()
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.configureCell(with: newsArray[indexPath.row].name, vc: self, model: newsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (newsArray?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier:idintifier, sender: newsArray[indexPath.row])
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        dataManager.obtainData { (newsArray) in
            self.newsArray = newsArray
            self.tableView.reloadData()
            refreshControl.endRefreshing()
        }
        
    
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue", let news = sender as? News {
            
            if let destinationVC = segue.destination as? NewsViewController {
                destinationVC.news = news
            }
        }
    }
    

}
