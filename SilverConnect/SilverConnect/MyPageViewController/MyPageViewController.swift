//
//  FirstViewController.swift
//  SilverConnect
//
//  Created by suhseungju on 2023/06/30.
//

import UIKit
import Tabman
import Pageboy

class MyPageViewController: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!
    
    private var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabMan()
    }
    
    private func setupTabMan() {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        // 배경 회색 -> 흰색
        bar.backgroundView.style = .blur(style: .regular)
        // 간격
        bar.layout.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray4
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        }
        // 밑줄
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .top)
    }
}

extension MyPageViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "작성한 글")
        case 1:
            return TMBarItem(title: "참여한 모임")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
}
