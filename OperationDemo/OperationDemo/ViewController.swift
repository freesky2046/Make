//
//  ViewController.swift
//  PersistenceDemo
//
//  Created by ming zhou on 2024/5/1.
//

import UIKit

class ViewController: UIViewController {
    var list:[String] = [
        "1 NSOperation分类",
        "2 独立使用NSOperation",
        "3 NSOperationQueue概述",
        "4 系统的NSOperation结合NSOperationQueue",
        "5 自定义的NSOperation结合NSOperationQueue",
        "6 NSOperation依赖",
        "7 NSOperation优先级"
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
        if indexPath.row == 0 {
            let operationViewController = NSOperationViewController()
            navigationController?.pushViewController(operationViewController, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(list[indexPath.row])"
        return cell
    }
}

