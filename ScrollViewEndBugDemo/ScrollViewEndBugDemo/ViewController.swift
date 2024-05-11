//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by 周明 on 2024/4/6.
//

import UIKit

class ViewController: UIViewController {

    var dataList: [String] = []
    var isScrolling: Bool = false {
        didSet {
            print("😄" + "isScroling:\(isScrolling)")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.isPagingEnabled = true
        tableView.dataSource = self
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        view.addSubview(tableView)
        for i in 0..<100 {
            dataList.append("\(i)")
        }
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isScrolling { // 此时还在滑动中，证明没有正确调用结束方法
            scrollEnd() // 补充遗漏的滑动结束
            isScrolling = false
        }
    }
    
    @objc func appDidEnterBackground() {
        if isScrolling { // 此时还在滑动中，证明没有正确调用结束方法
            scrollEnd() // 补充遗漏的滑动结束
            isScrolling = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        isScrolling = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("😄" + "scrollViewDidEndDragging")
        scrollEnd()
    }
    
     func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if(decelerate == false) {
            print("😄" + "scrollViewDidEndDragging")
            scrollEnd()
        }
    }
    
    private func scrollEnd() {
        isScrolling = false
        if let text = tableView.visibleCells.last?.textLabel?.text {
            print("😄" + "scrollEndAt:\(text)")
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
}

