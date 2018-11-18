//
//  PostDetailViewController.swift
//  NewProject
//
//  Created by Гузель on 04.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameOfGroupLabel: UILabel!
    @IBOutlet weak var textOfPostLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    weak var mainViewController: NewsViewController!
    var viewControllerUtils: ViewControllerUtils!
    var selectedIndex:Int!
    
    // MARK: - Методы -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filling()
        viewControllerUtils = ViewControllerUtilsImplementation()
    }
    
    // MARK: - Adding content and sharing -
    
    /// заполнение данных из основного контроллера в новое окно детальной информации.
    func filling() {
        
        avatarImageView.image = mainViewController.somePostArray[selectedIndex].avatar
        nameOfGroupLabel.text = mainViewController.somePostArray[selectedIndex].name
        textOfPostLabel.text = mainViewController.somePostArray[selectedIndex].description
        contentImageView.image = mainViewController.somePostArray[selectedIndex].someImage
    }
    
    
    /// метод для шаринга с помощью UIActivityViewController
    ///
    /// - Parameter sender: any sender
    @IBAction func sharingAction(_ sender: Any) {
        
        viewControllerUtils.shareAction(textOfPostLabel: textOfPostLabel, currentViewController: mainViewController)
    }
}
