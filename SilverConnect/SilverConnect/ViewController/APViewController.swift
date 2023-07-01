//
//  APViewController.swift
//  SilverConnect
//
//  Created by 최준영 on 2023/07/01.
//

import UIKit

class APViewController: UIViewController {
    enum ButtonState {
        case select
        case submit
    }
    

    @IBOutlet weak var guPicker: UIPickerView!
    @IBOutlet weak var dongPicker: UIPickerView!
    @IBOutlet weak var selectButton: UIButton!
    
    weak var delegate: DataUpdateDelegate?
    
    
    private var state: ButtonState = .select
    
    //Local data
    private var dongData: [Dong] = []
    private var guData: [Gu] = []
    
    private var dongDataSource: [Dong]?
    
    private var selectedGu: Gu?
    private var selectedDong: Dong?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        loadLocalData()
        
    }
    
    
    
    func configureUI() {
        guPicker.isHidden = false
        dongPicker.isHidden = true
        
        guPicker.delegate = self
        dongPicker.delegate = self
        
        selectButton.layer.cornerRadius = selectButton.layer.bounds.height / 2
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if state == .select {
            if let dsc = dongDataSource, let sd = selectedGu {
                dongData = dsc.filter { element in
                    element.gu_id == sd.gu_id
                }
                
                guPicker.isHidden = true
                dongPicker.isHidden = false
            }
            state = .submit
        } else {
            if let targetVC = storyboard?.instantiateViewController(withIdentifier: "partyVC") as? PartyViewConroller {
                delegate?.updateView(gu: selectedGu!, dong: selectedDong!)
                dismiss(animated: true)
            }
        }
    }
    func transitionView() {
        
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UIView.transition(with: view, duration: 0.5, options: transitionOptions, animations: {}, completion: nil)
    }
    
    // MARK: - Load data
    func loadLocalData() {
        
        if let temp: [Gu] = FileLoader.shared.loadData(fileName: .gu) {
            guData = temp
        }
        
        if let temp: [Dong] = FileLoader.shared.loadData(fileName: .dong) {
            dongDataSource = temp
        }
        
    }
    
}

extension APViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == guPicker {
            return guData.count
        }
        else if pickerView == dongPicker {
            return dongData.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == guPicker {
            selectedGu = guData[row]
        }
        else if pickerView == dongPicker {
            selectedDong = dongData[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == guPicker {
            return guData[row].name
        }
        else if pickerView == dongPicker {
            return dongData[row].name
        }
        
        return nil
    }
}


protocol DataUpdateDelegate: AnyObject {
    func updateView(gu: Gu, dong: Dong)
}
