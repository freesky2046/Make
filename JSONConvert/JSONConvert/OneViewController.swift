//
//  OneViewController.swift
//  JSONConvert
//
//  Created by 周明 on 2024/5/16.
//

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonString = """
        {
            "name": "John",
            "age": 30,
            "email": "john@example.com"
        }
        """
        
        let data = jsonString.data(using: .utf8)
        
        let decodeStr = String(data: data!, encoding: .utf8)
        print(decodeStr ?? "")
    }
    
}
