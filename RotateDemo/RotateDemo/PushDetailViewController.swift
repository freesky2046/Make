//
//  DetailViewController.swift
//  RotateDemo
//
//  Created by ming zhou on 2024/7/22.
//

import UIKit

class PushDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 440))
        label.text = "详情"
        view.addSubview(label)
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 120, width: 44, height: 44)
        btn.backgroundColor = .blue
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self,
                                              selector: #selector(deviceOrientationDidChange(_:)),
                                              name: UIDevice.orientationDidChangeNotification,
                                              object: nil)

  
    }
    
    @objc func deviceOrientationDidChange(_ notification: Notification) {
        // 处理屏幕旋转的逻辑
        let orientation = UIDevice.current.orientation
        print(orientation)

    }
    
    @objc
    func btnAction (){
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        toLandScape()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let screenorientation = UIDevice.current.orientation
        print(screenorientation.rawValue)
    }
    
    func toLandScape() {
        if #available(iOS 16.0, *) {
            // setNeedsUpdateOfSupportedInterfaceOrientations is a method of UIViewController
            self.setNeedsUpdateOfSupportedInterfaceOrientations()
            
            guard let scence = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            
            let geometryPreferencesIOS = UIWindowScene.GeometryPreferences.iOS(interfaceOrientations: .landscape)
            scence.requestGeometryUpdate(geometryPreferencesIOS)
        }
    }
    
    func toPortrait() {
        if #available(iOS 16.0, *) {
            // setNeedsUpdateOfSupportedInterfaceOrientations is a method of UIViewController
            self.setNeedsUpdateOfSupportedInterfaceOrientations()

            guard let scence = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }


            let geometryPreferencesIOS = UIWindowScene.GeometryPreferences.iOS(interfaceOrientations: .landscapeLeft)
            scence.requestGeometryUpdate(geometryPreferencesIOS)

        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        toPortrait()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
}
