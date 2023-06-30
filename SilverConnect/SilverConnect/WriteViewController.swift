
import UIKit

class WriteViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var ageList: [String] = ["60대", "70대", "80대", "90대", "100대"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var selectAge: UITextField!
    @IBOutlet weak var WriteTitle: UITextField!
    @IBOutlet weak var WriteContents: UITextField!
    @IBOutlet weak var count: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        selectAge.delegate = self
        selectAge.inputView = pickerView // 텍스트 필드의 입력뷰 -> 피커 뷰로 설정
        
        // 저장된 값을 불러옵니다.
        let storedAge = UserDefaults.standard.string(forKey: "selectedAge")
       selectAge.text = storedAge

        let storedTitle = UserDefaults.standard.string(forKey: "writtenTitle")
       WriteTitle.text = storedTitle

        let storedContents = UserDefaults.standard.string(forKey: "writtenContents")
       WriteContents.text = storedContents
        
        let storedCount = UserDefaults.standard.string(forKey: "writtenCount")
        count.text = storedCount
        
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
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
            let selectedAge = ageList[row]
            selectAge.text = selectedAge
            selectAge.resignFirstResponder() // 키보드 숨김
            
            // 선택한 값을 저장합니다.
            UserDefaults.standard.set(selectedAge, forKey: "selectedAge")
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
            // datePicker에서 선택된 날짜를 UserDefaults에 저장
            let selectedDate = sender.date
            UserDefaults.standard.set(selectedDate, forKey: "SelectedDate")
    }
    
    @IBAction func WriteBtnTapped(_ sender: UIButton) {
        let date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let dateString = dateFormatter.string(from: date)
        
        let selectedSegmentTitle = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        
        // 버튼을 누르면 입력한 제목, 내용, 세그먼트 제목, 날짜 및 수를 저장합니다.
        UserDefaults.standard.set(WriteTitle.text, forKey: "writtenTitle")
        UserDefaults.standard.set(WriteContents.text, forKey: "writtenContents")
        UserDefaults.standard.set(selectedSegmentTitle, forKey: "SelectedSegmentTitle")
        UserDefaults.standard.set(dateString, forKey: "SelectedDate")
        UserDefaults.standard.set(count.text, forKey: "writtenCount")
        
        // ReadViewController로 이동합니다.
        self.performSegue(withIdentifier: "ReadViewController", sender: self)
    }
}
