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
        
    }

}
