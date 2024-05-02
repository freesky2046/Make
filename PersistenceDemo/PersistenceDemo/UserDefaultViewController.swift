//
//  UserDefaultViewController.swift
//  PersistenceDemo
//
//  Created by 周明 on 2024/5/1.
//

import UIKit

struct User: Codable{
    var name: String
    var age: Int
}



class UserDefaultViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        useUserDefault()

    }
    
    func useUserDefault() {
        let user: User = User(name: "john", age: 18)
        let encoder: JSONEncoder = JSONEncoder()
        if let data = try? encoder.encode(user) {
            UserDefaults.standard.setValue(data, forKey: "user")
            let decoder: JSONDecoder = JSONDecoder()
            if let user2 = try? decoder.decode(User.self, from: data) {
                print(user2.name)
                print(user2.age)
            }
        }
    }
    

}
