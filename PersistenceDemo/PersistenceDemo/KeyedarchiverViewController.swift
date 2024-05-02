//
//  KeyedarchiverViewController.swift
//  PersistenceDemo
//
//  Created by 周明 on 2024/5/2.
//

import UIKit

class Dog: NSObject, NSSecureCoding {
    var name: String = ""
    var age: String = ""
    
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
        if let age = coder.decodeObject(forKey: "age") as? String {
            self.age = age
        }else {
            self.age = "0"
        }
    }
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
    static var supportsSecureCoding: Bool { true }
}

class KeyedarchiverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        useNSKeyedArchiverAndDataCache()
        
    }
    
    
    func useNSKeyedArchiverCache() {
        // ⚠️ 'archiveRootObject(_:toFile:)' was deprecated in iOS 12.0
    }
    
    func useNSKeyedArchiverAndDataCache() {
        let dog: Dog = Dog(name: "tom", age: "3")
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: dog, requiringSecureCoding: true) else { return }
        guard let fileName = fileName() else { return }
        
        try? data.write(to: URL(fileURLWithPath: fileName))
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: fileName)) else { return }
        guard let dog2 = try? NSKeyedUnarchiver.unarchivedObject(ofClass: Dog.self, from: data) else { return }
        print("😄" + "\(dog2.name)")
        print("😄" + "\(dog2.age)")

    }
    
    func fileName() -> String? {
        guard let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else { return nil}
        let  dogPath = (cachePath as NSString).appendingPathComponent("dogPath")
        if !FileManager.default.fileExists(atPath: dogPath) {
            try? FileManager.default.createDirectory(at: URL(fileURLWithPath: dogPath), withIntermediateDirectories: true)
        }
        let fileName =  (dogPath as NSString).appendingPathComponent("dogFile")
        return fileName
    }

}
