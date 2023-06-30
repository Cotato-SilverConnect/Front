import UIKit

class ReadViewController: UIViewController {
    
    @IBOutlet weak var readTitle: UILabel!
    @IBOutlet weak var readContents: UILabel!
    @IBOutlet weak var readAge: UILabel!
    @IBOutlet weak var readDate: UILabel!
    @IBOutlet weak var readSegment: UILabel!
    @IBOutlet weak var readCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedTitle = UserDefaults.standard.string(forKey: "writtenTitle") ?? ""
        let storedContents = UserDefaults.standard.string(forKey: "writtenContents") ?? ""
        let storedAge = UserDefaults.standard.string(forKey: "selectedAge") ?? ""
        let storedDate = UserDefaults.standard.string(forKey: "SelectedDate") ?? ""
        let storedSegment = UserDefaults.standard.string(forKey: "SelectedSegmentTitle") ?? ""
        let storedCount = UserDefaults.standard.string(forKey: "writtenCount") ?? ""
        
        readTitle.text = storedTitle
        readContents.text = storedContents
        readAge.text = storedAge
        readDate.text = storedDate
        readSegment.text = storedSegment
        readCount.text = storedCount
    }
}
