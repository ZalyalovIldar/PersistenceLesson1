

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var statusUILabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var cityYearsOldUILabel: UILabel!
    @IBOutlet weak var infoUIButton: UIButton!
    //user's photos
    @IBOutlet weak var photo1UIImageView: UIImageView!
    @IBOutlet weak var photo2UIImageView: UIImageView!
    @IBOutlet weak var photo3UIImageView: UIImageView!
    @IBOutlet weak var photo4UIImageView: UIImageView!
    @IBOutlet weak var firstScrollView: UIScrollView!
    @IBOutlet weak var secondScrollView: UIScrollView!
    
    
    
    var userNamesArray:[String] = ["Amelia Dammer", "Alina Rathner", "Elis Mark", "Marie Zoline"]
    var currentStatusArray:[String] = ["Online •", "Online(phone) •", "Offline", "last seen 40 minutes ago"]
    var photosArray:[UIImage] = [#imageLiteral(resourceName: "girl1"), #imageLiteral(resourceName: "girl3"), #imageLiteral(resourceName: "girl4"), #imageLiteral(resourceName: "girl5")]
    var photos2Array:[UIImage] = [#imageLiteral(resourceName: "girl1"), #imageLiteral(resourceName: "girl3"), #imageLiteral(resourceName: "girl4"), #imageLiteral(resourceName: "girl5"), #imageLiteral(resourceName: "img"), #imageLiteral(resourceName: "iii")]
    var yearsOldCityArray:[String] = ["18 years old, NY", "23 years old, Boston", "19 years old, Moskow", "19 years old, Kazan"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.clipsToBounds = true
        firstScrollView.contentSize.height = 1600
        secondScrollView.contentSize.width = 720
        random()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
    }

    func random() {
        profileImageView.image = photosArray[Int(arc4random_uniform(UInt32(photosArray.count)))]
        nameUILabel.text = userNamesArray[Int(arc4random_uniform(UInt32(userNamesArray.count)))]
        statusUILabel.text = currentStatusArray[Int(arc4random_uniform(UInt32(currentStatusArray.count)))]
        cityYearsOldUILabel.text =  yearsOldCityArray[Int(arc4random_uniform(UInt32(yearsOldCityArray.count)))]
        photo1UIImageView.image = photos2Array[Int(arc4random_uniform(UInt32(photos2Array.count)))]
        photo2UIImageView.image = photos2Array[Int(arc4random_uniform(UInt32(photos2Array.count)))]
        photo3UIImageView.image = photos2Array[Int(arc4random_uniform(UInt32(photos2Array.count)))]
        photo4UIImageView.image = photos2Array[Int(arc4random_uniform(UInt32(photos2Array.count)))]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

