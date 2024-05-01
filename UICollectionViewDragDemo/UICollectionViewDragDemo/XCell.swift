//
//  XCell.swift
//  UICollectionViewDragDemo
//
//  Created by ming zhou on 2024/4/23.
//

import UIKit

class XCell: UICollectionViewCell {
    lazy var label: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
}
