//
//  FirstViewController.swift
//  SilverConnect
//
//  Created by suhseungju on 2023/06/30.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableMain: UITableView!
    let stateData = ["모집완료", "모집중", "모집중"]
    let titleData = ["임영웅 콘서트 같이 가실 분 구해요", "뜨개질 같이 하실 분 구해요", "베이킹 같이 하실 분 구해요"]
    let ageData = ["나이 상관 없음", "60대", "나이 상관 없음"]
    let dateData = ["02월 02일 일요일", "01월 23일 금요일", "07월 01일 토요일"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableMain.delegate = self
        tableMain.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 오른쪽에 만들기
        let edit = UIContextualAction(style: .normal, title: "수정") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                    print("수정 클릭")
                    success(true)
                }
        edit.backgroundColor = .systemPink
                
                
        let del = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("삭제 클릭")
            success(true)
        }
        del.backgroundColor = .systemTeal
        
        //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
        return UISwipeActionsConfiguration(actions:[edit, del])
    }

}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FirstTableViewCell = tableMain.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as! FirstTableViewCell

        cell.state_custom.text = stateData[indexPath.row]
        cell.title_custom.text = titleData[indexPath.row]
        cell.age_custom.text = ageData[indexPath.row]
        cell.date_custom.text = dateData[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableMain.deselectRow(at: indexPath, animated: true)
        
        print("Click Cell Number: " + String(indexPath.row))
    }
}


