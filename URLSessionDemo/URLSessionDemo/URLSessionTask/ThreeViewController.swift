//
//  ThreeViewController.swift
//  URLSessionDemo
//
//  Created by ming zhou on 2024/5/16.
//

import UIKit

extension ThreeViewController {
    static let url: URL = URL(string: "http://172.28.142.88:8080")!
}

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        upload()
    }
    
    func upload() {
        var request = URLRequest(url: Self.url)
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        let  directoryPath = (path as NSString).appendingPathComponent("subDirectory")
        let filePath = (directoryPath as NSString).appendingPathComponent("1.json")
        request.httpMethod = "POST"
        let task: URLSessionUploadTask = URLSession.shared.uploadTask(with: request, fromFile: URL(filePath:filePath))
        task.delegate = self
        task.resume()
    }



}


extension ThreeViewController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        // 处理上传进度
        let progress = Double(totalBytesSent) / Double(totalBytesExpectedToSend)
        print("Upload progress: \(progress * 100)%")
    }

//    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        if let error = error {
//            print("Upload failed: \(error.localizedDescription)")
//        } else {
//            print("Upload succeeded")
//        }
//    }
}
