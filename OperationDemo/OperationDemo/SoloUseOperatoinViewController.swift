//
//  SoloUseOperatoinViewController.swift
//  OperationDemo
//
//  Created by 周明 on 2024/5/6.
//

import UIKit

class SoloUseOperatoinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 100)
        
        stackView.addArrangedSubview(createButton(title: "block 添加一次操作", action: #selector(useBlockOperation)))
        stackView.addArrangedSubview(createButton(title: "block 添加多次操作", action: #selector(useBlockAddOperation)))
        stackView.addArrangedSubview(createButton(title: "自定义 operation", action: #selector(useCustomOperation)))
        
    }
    
    func createButton(title: String, action:Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }
    
    
    @objc
    func useBlockOperation() {
        print("使用前\(Thread.current)")
        let blockOperation = BlockOperation {
            self.mockTimeOperation()
            print("单独使用 blockOperation\(Thread.current)")
        }
        
        blockOperation.start()
        print("使用后")
    }
    
    @objc
    func useBlockAddOperation() {
        print("使用前\(Thread.current)")
        let blockOperation = BlockOperation {
            self.mockTimeOperation()
            print("单独使用 blockOperation\(Thread.current)")
        }
        blockOperation.addExecutionBlock {
            self.mockTimeOperation()
            print("追加使用 blockOperation1\(Thread.current)")
        }
        blockOperation.addExecutionBlock {
            self.mockTimeOperation()
            print("追加使用 blockOperation2\(Thread.current)")
        }
        blockOperation.start()
        print("使用后")
    }
    
    @objc
    func useCustomOperation() {
        print("使用前\(Thread.current)")
        let blockOperation = BlockOperation {
            self.mockTimeOperation()
            print("单独使用 blockOperation\(Thread.current)")
        }
        blockOperation.start()
        print("使用后")
    }
    
    /// 一个耗时的操作
    func mockTimeOperation() {
        var j = 0
        for i in 0..<1000000 {
            j += i * 2
        }
    }

}
