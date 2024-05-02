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

class Dog: NSCoding {
    var name: String = ""
    var age: Int = 0
    
    func encode(with coder: NSCoder) {
        // 即NSKeyedArchiver类型
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
    }
    
    
    required init?(coder: NSCoder) {
        if let name = coder.decodeObject(forKey: "name") as? String {
            self.name = name
        }else {
            self.name = ""
        }
        if let age = coder.decodeObject(forKey: "age") as? Int {
            self.age = age
        }else {
            self.age = 0
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

}

class UserDefaultViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        useJSONEncoder()
        
        
    }
    
    func useJSONEncoder() {
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
    
    func useNSKeyedArchiver() {
        let dog: Dog = Dog(name: "tom", age: 3)

        NSKeyedArchiver.archiveRootObject(dog, toFile: <#T##String#>)
        
        
    }
    
    

}
