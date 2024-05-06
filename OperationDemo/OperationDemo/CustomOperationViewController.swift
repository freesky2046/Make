//
//  CustomOperationViewController.swift
//  OperationDemo
//
//  Created by 周明 on 2024/5/6.
//

import UIKit

class CustomOperationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let stackView = UIStackView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: 88))
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(createButton(title: "同步", sel: #selector(syncOperation)))
        stackView.addArrangedSubview(createButton(title: "异步", sel: #selector(asyncOperation)))
    }
    
    func createButton(title: String, sel: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: sel, for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        return button
    }
    
    @objc
    func syncOperation() {
        let operation: SyncOperation = SyncOperation()
        print("开始")
        operation.start()
        print("结束")
    }

    @objc
    func asyncOperation() {
        print("开始异步:\(Thread.current)")
        let asyncOperation1: AsyncOperation = AsyncOperation()
        asyncOperation1.url = "https://pic.rmb.bdstatic.com/bjh/50ce04404059a838cd9ac88bde7b574b90.jpeg@h_1280"
        let mainQueue = DispatchQueue.main
        asyncOperation1.completionBlock = {
            mainQueue.async {
                print(asyncOperation1.image ?? nil)
            }
        }
        
        let asyncOperation2: AsyncOperation = AsyncOperation()
        asyncOperation2.url = "https://static.jstv.com/img/2022/8/16/20228161660621024748_187.jpeg"
        asyncOperation2.completionBlock = {
            mainQueue.async {
                print(asyncOperation2.image ?? nil)
            }
        }
        let asyncOperation3: AsyncOperation = AsyncOperation()
        asyncOperation3.url = "https://static.jstv.com/img/2022/8/16/20228161660621024748_187.jpeg"
        asyncOperation3.completionBlock = {
            mainQueue.async {
                print(asyncOperation3.image ?? nil)
            }
        }
        print("停止异步")

        let queue = OperationQueue()
        queue.addOperations([asyncOperation1, asyncOperation2, asyncOperation3], waitUntilFinished: true)
    }

}
