//
//  CustomTableViewCell.swift
//  NewProject
//
//  Created by Гузель on 03.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var textOfPostLabel: UILabel!
    @IBOutlet weak var avatarOfGroupImageView: UIImageView!
    @IBOutlet weak var nameOfGroupLabel: UILabel!
    @IBOutlet weak var someImageView: UIImageView!
    weak var currentViewController: UIViewController!
    var viewControllerUtils: ViewControllerUtils!
    
    // MARK: - Методы -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Adding content and sharing -
    
    /// инициализация
    ///
    /// - Parameters:
    ///   - post: объект типа Post
    ///   - controller: контроллер типа UIViewController
    func addingContent(post:Post, controller:UIViewController) {
        
        textOfPostLabel.text = post.textDescription
        avatarOfGroupImageView.image = post.avatar
        nameOfGroupLabel.text = post.name
        someImageView.image = post.someImage
        currentViewController = controller
        
        viewControllerUtils = ViewControllerUtilsImplementation()
    }
    
    
    /// метод для шаринга с помощью UIActivityViewController
    ///
    /// - Parameter sender: any sender
    @IBAction func shareAction(_ sender: Any) {
        viewControllerUtils.shareAction(textOfPostLabel: textOfPostLabel, currentViewController: currentViewController)
    }
    
}
