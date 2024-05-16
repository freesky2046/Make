//
//  ViewController.swift
//  ScrollViewLifeCycleDemo
//
//  Created by ming zhou on 2024/5/15.
//

import UIKit

class ViewController: UIViewController {
    var dataList: [String] = {
        var dataList: [String] = []
        for i in 0..<1000 {
            dataList.append("\(i)")
        }
        return dataList
    }()
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isPagingEnabled = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         UIScreen.main.bounds.size.height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 不能用这个，当前这个cell 可见，会把播放器加到另外一个露出一部分的 cell 那里去
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("😄" + "didEndDisplaying:\(indexPath.row)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEnd()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scrollViewDidEnd()
        }
    }
    
    func scrollViewDidEnd() {
        let cell = tableView.visibleCells.last!
        let indexPath = tableView.indexPath(for: cell)
        print("😄" + "进入新的刷新:\(indexPath!.row)")
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 不能用这个，会提前预计加载。
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
}
