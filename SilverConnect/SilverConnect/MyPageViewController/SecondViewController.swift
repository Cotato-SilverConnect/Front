//
//  SecondViewController.swift
//  SilverConnect
//
//  Created by suhseungju on 2023/06/30.
//

import UIKit

class SecondViewController: UIViewController {

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

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SecondTableViewCell = tableMain.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell

        cell.state_custom.text = stateData[indexPath.row]
        cell.title_custom.text = titleData[indexPath.row]
        cell.age_custom.text = ageData[indexPath.row]
        cell.date_custom.text = dateData[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableMain.deselectRow(at: indexPath, animated: true)
        
//        print("Click Cell Number: " + String(indexPath.row))
//        let alert = UIAlertController(title: "Cell Selected", message: "You have selected cell #\(indexPath.row)", preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//
//        alert.addAction(okAction)
//
//        self.present(alert, animated: true, completion: nil)
//
//        // Cell 선택 효과를 없애는 코드
//        tableView.deselectRow(at: indexPath, animated: true)
        // 사용자가 cell을 선택했을 때 alert를 띄우는 코드
                let alert = UIAlertController(title: titleData[indexPath.row], message: "You have selected", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "취소하기", style: .cancel, handler: nil)
                let rateAction = UIAlertAction(title: "평가하기", style: .default) { action in
                    print("평가하기 action triggered")
                    // 여기에 평가하기 액션에 대한 동작을 추가합니다.
                }
                let seePostAction = UIAlertAction(title: "게시글 보기", style: .default) { action in
                    print("게시글 보기 action triggered")
                    // 여기에 게시글 보기 액션에 대한 동작을 추가합니다.
                }
                
                alert.addAction(cancelAction)
                alert.addAction(rateAction)
                alert.addAction(seePostAction)
                
                self.present(alert, animated: true, completion: nil)
                
                // Cell 선택 효과를 없애는 코드
                tableView.deselectRow(at: indexPath, animated: true)
    }
}



