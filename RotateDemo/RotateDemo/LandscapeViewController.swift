//
//  LandscapeViewController.swift
//  RotateDemo
//
//  Created by ming zhou on 2024/7/16.
//

import UIKit

class LandscapeViewController: UIViewController {

    var label: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: 44, height: 44))
        label.text = "1111"
        view.addSubview(label)
        self.label = label
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("😄" + "viewDidLayoutSubviews")

        self.label.center = CGPoint(x: view.frame.size.width * 0.5, y: view.frame.size.height * 0.5)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    
//    - (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//        return UIInterfaceOrientationLandscapeRight;
//    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        print("😄" + "supportedInterfaceOrientations")

        return .allButUpsideDown
    }
    
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        .landscapeRight
//    }
}
