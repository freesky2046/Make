//
//  OneViewController.swift
//  URLSessionDemo
//
//  Created by ming zhou on 2024/5/15.
//

import UIKit

// URLSessionDataTask: 从服务器获取数据到内存中 适合比较小 拿到后就立马使用的
// URLSessionUploadTask: 上传硬盘中的文件到服务器，一般是HTTP POST 或 PUT方式
// URLSessionDownloadTask: 从远程服务器下载文件到临时文件位置。
// NSURLSessionStreamTask: 基于流的URL会话任务，提供了一个通过 NSURLSession 创建的 TCP/IP 连接接口。
 
extension OneViewController {
    static let url: URL = URL(string: "http://172.28.142.88:8080/1.json")!
}

class OneViewController: UIViewController {
    
    lazy var label: UILabel = {
       let label = UILabel()
       label.textColor = .red
       label.numberOfLines = 0
       return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .white
        
        dataTask()
        
    }
    
    //  1. URLSessionDataTask:写到内存
    func dataTask() {
        let request = URLRequest(url: Self.url)
        // 方式 1
        let session = URLSession.shared
   
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return  }
            /// 转为对象
            let decoder = JSONDecoder()
            let res = try? decoder.decode(Response.self, from: data)
            print("😄" + "code:\(res?.code ?? 0)")
            print("😄" + "msg:\(res?.msg ?? "")")
            
            /// 转为 json 字符串
            let string = String(data: data, encoding: .utf8)
            DispatchQueue.main.async {
                self.label.text = string
            }
            
        }
        task.resume()
    }
    
    // 2.URLSessionDownloadTask:下载到临时目录

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 16, y: 0, width: view.bounds.size.width - 32, height: view.bounds.size.height)
    }
    
}


