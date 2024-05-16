//
//  ThreeViewController.swift
//  JSONConvert
//
//  Created by 周明 on 2024/5/16.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let jsonString = """
        {
            "name": "John",
            "age": nil,
            "email": "john@example.com"
        }
        """
        print(jsonString)
        guard let data = jsonString.data(using: .utf8) else { return }

        guard let dict = try? JSONSerialization.jsonObject(with: data, options:[.mutableContainers] ) else { return }
        print(dict)
        
        guard let encodeData =  try? JSONSerialization.data(withJSONObject: dict) else { return }
        let str = String(data: encodeData, encoding: .utf8)!
        print(str)
        
        
    }


}
