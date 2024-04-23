//
//  ViewController.swift
//  ScrollViewPageDemo
//
//  Created by ming zhou on 2024/4/22.
//

import UIKit

class ViewController: UIViewController {

    var currentIndex: Int = 0
    var lastOffsetY: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 88)
        tableView.reloadData()
    }


    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        
        tableView.delegate = self
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.scrollsToTop = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let height = scrollView.frame.size.height
        var index: Int = 0
    
        // 上拉
        let pullUp: Bool =  scrollView.contentOffset.y > lastOffsetY
        let pullDown: Bool = scrollView.contentOffset.y < lastOffsetY
        if pullUp  {
            index = Int(floor(scrollView.contentOffset.y / height))
        }
        if pullDown {

            index = Int(ceil(scrollView.contentOffset.y / height))
        }
        index = clamp(index: index, scrollView: scrollView)

     
        if index != currentIndex {
            currentIndex = index
            print("😄" + "\(index)")
        }
        lastOffsetY = scrollView.contentOffset.y
    
    }
    
    private func  clamp(index: Int, scrollView: UIScrollView) -> Int{
        var result = index
        
        var maxIndex:Int = 0
        if scrollView.frame.size.height > 0 {
            maxIndex = Int(scrollView.contentSize.height / scrollView.frame.size.height)
        }
        if index <= 0 {
            result = 0
        }
        if index >= maxIndex {
            result = maxIndex
        }
        if result < 0 {
            print("😄" + "\(result)")

        }
        return result
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
