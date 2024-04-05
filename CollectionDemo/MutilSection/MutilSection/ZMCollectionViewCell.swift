//
//  ZMCollectionViewCell.swift
//  MutilSection
//
//  Created by 周明 on 2024/4/4.
//

import UIKit

class ZMCollectionViewCell: UICollectionViewCell {
    
    var label : UILabel = UILabel(frame: CGRectZero)
    
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
