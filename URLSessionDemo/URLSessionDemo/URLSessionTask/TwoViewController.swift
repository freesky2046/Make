//
//  TwoViewController.swift
//  URLSessionDemo
//
//  Created by ming zhou on 2024/5/16.
//

import UIKit


extension TwoViewController {
    static let url: URL = URL(string: "http://172.28.142.88:8080/1.json")!
}

struct Response: Codable {
    let code: Int?
    let msg: String?
}


class TwoViewController: UIViewController {

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
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        downloadTask()
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 16, y: 0, width: view.bounds.size.width - 32, height: view.bounds.size.height)
    }
    
    func downloadTask() {
        let request = URLRequest(url: Self.url)
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: request)
        downloadTask.delegate = self
        downloadTask.resume()
    }
    
}

extension TwoViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        let  directoryPath = (path as NSString).appendingPathComponent("subDirectory")
        if !FileManager.default.fileExists(atPath: path) {
           try? FileManager.default.createDirectory(at: URL(fileURLWithPath: path), withIntermediateDirectories: true)
        }
        try? FileManager.default.moveItem(at: location, to: URL(filePath: directoryPath))
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: directoryPath)) else { return }
        let str = String(data: data, encoding: .utf8)
        DispatchQueue.main.async {
            self.label.text = str
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("😄bytesWritten \(bytesWritten)\n totalBytesWritten \(totalBytesWritten)\n totalBytesExpectedToWrite \(totalBytesExpectedToWrite)")
        print("😄 下载进度: \(Double(totalBytesWritten)/Double(totalBytesExpectedToWrite))\n")
    }
}

