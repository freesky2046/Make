//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by 周明 on 2024/4/6.
//

import UIKit

class ViewController: UIViewController {
    
    let dataList:[String] = [
        "Data⇄String",
        "Data⇄Model",
        "Data⇄Dict或Array"
    ]
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 88.0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let semaphoreVC = OneViewController()
            navigationController?.pushViewController(semaphoreVC, animated: true)
        }
        if indexPath.row == 1 {
            let two = TwoViewController()
            navigationController?.pushViewController(two, animated: true)
        }
        
        if indexPath.row == 2 {
            let three = ThreeViewController()
            navigationController?.pushViewController(three, animated: true)
        }

    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
}
