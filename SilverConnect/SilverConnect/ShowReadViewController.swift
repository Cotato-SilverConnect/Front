import UIKit

class ReadViewController: UIViewController {
    
    @IBOutlet weak var readTitle: UILabel!
    @IBOutlet weak var readContents: UILabel!
    @IBOutlet weak var readAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedTitle = UserDefaults.standard.string(forKey: "writtenTitle") ?? ""
        let storedContents = UserDefaults.standard.string(forKey: "writtenContents") ?? ""
        let storedAge = UserDefaults.standard.string(forKey: "selectedAge") ?? ""
        
        readTitle.text = storedTitle
        readContents.text = storedContents
        readAge.text = storedAge
    }
}
