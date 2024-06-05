//
//  ViewController.swift
//  FFF
//
//  Created by ming zhou on 2024/5/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let centerImageView = UIImageView()
        centerImageView.image = UIImage(named: "v")
        view.addSubview(centerImageView)
        centerImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(32.0)

        }
        
        
    }


}

