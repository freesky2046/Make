//
//  ViewController.swift
//  PersistenceDemo
//
//  Created by ming zhou on 2024/5/1.
//

import UIKit

class ViewController: UIViewController {
    var list:[String] = [
        "1 只添加 addSubview",
        "2 只添加 addChildVC",
        "3 添加 addSubview和 addChildVC"
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
            let one = OneViewController()
            navigationController?.pushViewController(one, animated: true)

        }
        if indexPath.row == 1 {
            let two = TwoViewController()
            navigationController?.pushViewController(two, animated: true)

        }
        if indexPath.row == 2 {

        
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

