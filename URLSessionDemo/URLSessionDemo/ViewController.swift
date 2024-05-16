//
//  ViewController.swift
//  PersistenceDemo
//
//  Created by ming zhou on 2024/5/1.
//

import UIKit

class ViewController: UIViewController {
    var list:[[String]] = [
        ["1 URLSessionDataTask:获取数据到内存",
         "2 URLSessionDownloadTask:下载数据到本地",
         "3 URLSessionUploadTask:上传本地数据到服务器"],
        ["1 default",
         "2 ephemeral",
         "3 background"],
        ["1 sessionDelegate"],
        ["1 基类Delegate",
         "2 taskDelegate",
         "3 uploadaDelegate"]
    ]
    
    var sectionList:[String] = [
        "1 URLSessionTask",
        "2 URLSessionConfiguration",
        "3 URLSessionDelegete",
        "4 URLSesstionTaskDelegate"
        
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isPagingEnabled = false
        tableView.showsVerticalScrollIndicator = false
        tableView.scrollsToTop = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let one = OneViewController()
                navigationController?.pushViewController(one, animated: true)
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
        
        if indexPath.section == 1 {
         
        }
        
        if indexPath.section == 2 {
            let sessionDelegateViewController = SessionDelegateViewController()
            navigationController?.pushViewController(sessionDelegateViewController, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(list[indexPath.section][indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionList[section]
    }

}

