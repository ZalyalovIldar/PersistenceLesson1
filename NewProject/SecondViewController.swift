
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var infoScrollView: UIScrollView!
    @IBOutlet weak var phoneNumberUILabel: UILabel!
    @IBOutlet weak var vklinkUILabel: UILabel!
    @IBOutlet weak var statusUILabel: UILabel!
    @IBOutlet weak var textFieldStatusUITextField: UITextField!
    
    
    var numbersArray:[String] = ["89274635768", "89274656868", "89274735789", "89274098765", "89274101010"]
    var vkLinksArray:[String] = ["vk.com/catcat", "vk.com/lovecars", "vk.com/doc", "vk.com/white_cat"]
    
    override func viewDidLoad() {
        infoScrollView.contentSize.height = 1000
        super.viewDidLoad()
        randomize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func randomize() {
    
        phoneNumberUILabel.text = numbersArray[Int(arc4random_uniform(UInt32(numbersArray.count)))]
        vklinkUILabel.text = vkLinksArray[Int(arc4random_uniform(UInt32(vkLinksArray.count)))]
    
    }
}
