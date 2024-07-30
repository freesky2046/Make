//
//  TCollectionViewCell.swift
//  demoCollectionView
//
//  Created by ming zhou on 2024/7/13.
//

import UIKit

class TCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(scrollView)
        scrollView.backgroundColor = .black.withAlphaComponent(0.4)
        self.scrollView.frame = CGRectMake(0, 0, UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        scrollView.delegate = self
        scrollView.addSubview(imageView)
//        scrollView.alwaysBounceVertical = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refresh(name: String) {
        
        self.imageView.image = UIImage(named: "1")
        resize()
    }
    
    func resize() {
        self.imageView.sizeToFit()
        self.imageView.center = CGPoint(x: UIScreen.main.bounds.size.width * 0.5, y:  UIScreen.main.bounds.size.height * 0.5)
      
        //self.imageView.frame = CGRectMake(self.frame.size.width * 0.5 - self.imageView.image!.size.width * 0.5, self.frame.size.height * 0.5 - self.imageView.image!.size.height * 0.5, self.imageView.image!.size.width, self.imageView.image!.size.height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}


extension TCollectionViewCell: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let offsetX: CGFloat = max((scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5, 0.0);
        let offsetY: CGFloat = max((scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5, 0.0);
        imageView.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY  )
    }
}
