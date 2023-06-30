
import UIKit

class WriteViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var ageList: [String] = ["60대", "70대", "80대", "90대", "100대"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var selectAge: UITextField!
    @IBOutlet weak var WriteBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        selectAge.delegate = self
        selectAge.inputView = pickerView // 텍스트 필드의 입력뷰 -> 피커 뷰로 설정
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return ageList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return ageList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectAge.text = ageList[row]
        selectAge.resignFirstResponder() // 키보드 숨김
    }
}
