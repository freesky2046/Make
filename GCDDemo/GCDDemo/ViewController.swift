//
//  ViewController.swift
//  PersistenceDemo
//
//  Created by ming zhou on 2024/5/1.
//

import UIKit

class ViewController: UIViewController {
    var list:[[String]] = [
        ["1 同步提交任务到主队列：死锁",
        "2 同步提交任务到自定义串行队列",
        "3 同步提交任务到并行队列"],
        
        ["4 主线程异步主队列",
        "5  异步提交到串行队列",
        "6  异步提交到并行队列（自定义或预置）"],
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
        section == 0 ? "同步：不开线程" : "异步：有开线程的能力"
    }
    
    
}

