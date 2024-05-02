//
//  JSONEncoderViewController.swift
//  PersistenceDemo
//
//  Created by 周明 on 2024/5/2.
//

import UIKit

struct Product: Codable {
    var name: String
    var price: Double
}

class JSONEncoderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        useJSONEncoder()
    }
    
    func useJSONEncoder() {
        // write
        let product: Product = Product(name: "nike", price: 25.3)
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(product) else { return }
        guard let fileName = fileName() else { return }
        try? data.write(to: URL(fileURLWithPath: fileName))
        
        // read
        guard let data2 = try? Data(contentsOf: URL(fileURLWithPath: fileName)) else { return }
        let decoder = JSONDecoder()
            guard let product2 = try? decoder.decode(Product.self, from: data2) else { return }
        
        // print
        print("😄 \(product2.name)")
        print("😄 \(product2.price)")
    }

    
    func fileName() -> String? {
        guard let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else { return nil}
        let  dogPath = (cachePath as NSString).appendingPathComponent("productPath")
        if !FileManager.default.fileExists(atPath: dogPath) {
            try? FileManager.default.createDirectory(at: URL(fileURLWithPath: dogPath), withIntermediateDirectories: true)
        }
        let fileName =  (dogPath as NSString).appendingPathComponent("product")
        return fileName
    }
}
