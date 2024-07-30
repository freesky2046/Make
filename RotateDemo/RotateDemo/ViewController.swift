//
//  ViewController.swift
//  RotateDemo
//
//  Created by ming zhou on 2024/7/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }


    @IBAction func btnAction(_ sender: Any) {
//        let landscapViewController = LandscapeViewController()
//        landscapViewController.modalPresentationStyle = .fullScreen
//        present(landscapViewController, animated: true)
         let detail = PushDetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)

    }
    

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let screenorientation = UIDevice.current.orientation
        print(screenorientation.rawValue)
    }
    
}


