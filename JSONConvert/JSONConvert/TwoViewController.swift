//
//  TwoViewController.swift
//  JSONConvert
//
//  Created by 周明 on 2024/5/16.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonString = """
        {
            "name": "John",
            "age": 30,
            "email": "john@example.com"
        }
        """
        
        guard let data = jsonString.data(using: .utf8) else { return  }
        
        /// ---> Model
        let jsonDecoder = JSONDecoder()
        guard let model = try? jsonDecoder.decode(Model.self, from: data) else { return }
        print(model.name!)
        print("\(model.age!)")
        print("\(model.email!)")
        
        /// --- data
        
        let jsonEncoder = JSONEncoder()
        guard let encodeData = try? jsonEncoder.encode(model) else {
           return
        }
        print("成功")
    }
    

}


struct Model: Codable {
    var name: String?
    var age: Int?
    var email: String?
}
