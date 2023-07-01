//
//  PartyViewConroller.swift
//  SilverConnect
//
//  Created by 최준영 on 2023/06/30.
//

import UIKit

class PartyViewConroller: UIViewController, DataUpdateDelegate {
    enum BannerSelectState: String {
        case all
        case dine = "밥/카페"
        case learn = "배움"
        case exercise = "운동"
    }
    //BannerButtons
    @IBOutlet weak var allCat: UIButton!
    @IBOutlet weak var dineCat: UIButton!
    @IBOutlet weak var learnCat: UIButton!
    @IBOutlet weak var exerciseCat: UIButton!
    
    @IBOutlet weak var locationSelectButton: UIButton!
    //BannerLabels
    @IBOutlet weak var allCatLabel: UILabel!
    @IBOutlet weak var dineCatLabel: UILabel!
    @IBOutlet weak var learnCatLabel: UILabel!
    @IBOutlet weak var exerciseCatLabel: UILabel!
    
    //State
    private var bannerSelectState: BannerSelectState = .all
    
    var selectedGu: Gu?
    var selectedDong: Dong?
    
    //TableView
    lazy var tableView = UITableView(frame: .zero, style: .plain)
    
    private var showingData: [[PartyData]] = []
    
    private let sourceData: [PartyData] = [
        PartyData(title: "Hello1", category: .exercise, age: 70, state: .inactive, location: "신림동"),
        PartyData(title: "Hello2", category: .dine, age: 70, state: .inactive, location: "역사동"),
        PartyData(title: "Hello3", category: .learn, age: 70, state: .inactive, location: "무거동"),
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBanner()
        
        configureTableView()
    }
    
    
    // MARK: - 위치변경 버튼
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        if let targetVC = storyboard?.instantiateViewController(withIdentifier: "ApVC") as? APViewController {
            
            targetVC.delegate = self
            present(targetVC, animated: true)
        }
    }
    
    func updateView(gu: Gu, dong: Dong) {
        selectedGu = gu
        selectedDong = dong
        locationSelectButton.setTitle("서울 > \(gu.name) > \(dong.name)", for: .normal)
    }
    
    
    // MARK: - TableView
    func configureTableView() {
        view.addSubview(self.tableView)
        tableView.dataSource = self
        
        let result = view.subviews.first { v in
            v.restorationIdentifier == "bannerStack"
        }
        
        guard let bannerStack = result else { fatalError("배너뷰 불러오기 오류") }

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: bannerStack.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        
    }
    
    
    // MARK: - 배너
    func configureBanner() {
        let btnBackgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        
        //Buttons
        allCat.layer.cornerRadius = allCat.layer.bounds.width / 2
        allCat.clipsToBounds = true
        allCat.backgroundColor = btnBackgroundColor
        allCat.titleLabel?.text = ""
        if let image = UIImage(systemName: "list.bullet") {
            allCat.setImage(image, for: .normal)
            allCat.tintColor = .red
        }
        //전체를 기본옵션으로 선택
        changeButtonState(allCat)
            
        
        dineCat.layer.cornerRadius = dineCat.layer.bounds.width / 2
        dineCat.clipsToBounds = true
        dineCat.backgroundColor = btnBackgroundColor
        dineCat.titleLabel?.text = ""
        if let image = UIImage(systemName: "fork.knife") {
            dineCat.setImage(image, for: .normal)
            dineCat.tintColor = .gray
        }
        
        learnCat.layer.cornerRadius = learnCat.layer.bounds.width / 2
        learnCat.clipsToBounds = true
        learnCat.backgroundColor = btnBackgroundColor
        learnCat.titleLabel?.text = ""
        if let image = UIImage(systemName: "book.fill") {
            learnCat.setImage(image, for: .normal)
            learnCat.tintColor = .brown
        }
            
        exerciseCat.layer.cornerRadius = exerciseCat.layer.bounds.width / 2
        exerciseCat.clipsToBounds = true
        exerciseCat.backgroundColor = btnBackgroundColor
        exerciseCat.titleLabel?.text = ""
        if let image = UIImage(systemName: "figure.run") {
            exerciseCat.setImage(image, for: .normal)
            exerciseCat.tintColor = .systemIndigo
        }
        
        //Labels
        allCatLabel.text = "전체"
        dineCatLabel.text = "밥/카페"
        learnCatLabel.text = "배움"
        exerciseCatLabel.text = "운동"
    }


    func changeButtonState(_ btn: UIButton) {
        let tempButtonList: [(UIButton, UILabel, BannerSelectState)] = [(allCat, allCatLabel, .all), (learnCat, learnCatLabel, .learn), (exerciseCat, exerciseCatLabel, .exercise), (dineCat, dineCatLabel, .dine)]
        
        let accentColor = UIColor.orange
        
        tempButtonList.forEach { button, label, state in
            if button == btn {
                button.layer.borderColor = accentColor.cgColor
                button.layer.borderWidth = 2
                
                label.textColor = accentColor
                
                bannerSelectState = state
                
                showingData = [sourceData.filter { item in
                    if state == .all {
                        return true
                    } else {
                        return item.category.rawValue == state.rawValue
                    }
                }]
                
                tableView.reloadData()
                
            } else {
                button.layer.borderColor = UIColor.clear.cgColor
                button.layer.borderWidth = 0
                
                label.textColor = .black
            }
        }
 
    }
    
    @IBAction func allCatBtnTapped(_ sender: UIButton) {
        print("all")
        changeButtonState(sender)
    }
    
    @IBAction func dineBtnTapped(_ sender: UIButton) {
        print("dine")
        changeButtonState(sender)
    }
    
    @IBAction func learnBtnTapped(_ sender: UIButton) {
        print("learn")
        changeButtonState(sender)
    }
    
    @IBAction func exerciseBtnTapped(_ sender: UIButton) {
        print("exercise")
        changeButtonState(sender)
    }
}



// MARK: - TableViewDataSource
extension PartyViewConroller: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showingData[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = showingData[indexPath.section][indexPath.row]
        
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        
        content.text = cellData.title
        content.secondaryText = "\(cellData.state == .active ? "모집중" : "모집종료") | \(cellData.category.rawValue) | \(cellData.location)"
        content.secondaryTextProperties.color = .gray

        cell.contentConfiguration = content
        return cell
        
    }
    
}

