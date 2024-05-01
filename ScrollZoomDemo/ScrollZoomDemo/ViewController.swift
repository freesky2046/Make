//
//  ViewController.swift
//  ScrollZoomDemo
//
//  Created by ming zhou on 2024/4/24.
//

import UIKit

class ViewController: UIViewController {

    var cleanScreenClousre: (() -> Void)?
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupGesture()
    }

    
    func setupUI() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 400))
        scrollView.layer.borderColor = UIColor.red.cgColor
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3
        scrollView.contentSize = scrollView.frame.size
        scrollView.layer.borderWidth = 2.0
        view.addSubview(scrollView)
        self.scrollView = scrollView
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "1")
        let width = imageView.image?.size.width ?? scrollView.bounds.size.width
        let height = imageView.image?.size.height ?? scrollView.bounds.height
        let ratio = width / height
        let scrollViewRatio = scrollView.frame.size.width / scrollView.frame.size.height
        if ratio > scrollViewRatio { /// 这个时候放缩到容器等宽,高度上下留白
            let imageViewWidth = scrollView.frame.size.width
            let imageViewHeight = imageViewWidth / ratio
            let ySpace = scrollView.frame.size.height - imageViewHeight
            let y = ySpace * 0.5
            imageView.frame = CGRect(x: 0, y: y, width: imageViewWidth, height: imageViewHeight)
        }
        else { // 这个时候放缩到容器等高，宽度左右留白
            let imageViewHeight = scrollView.frame.size.height
            let imageViewWidth = imageViewHeight * ratio
            let xSpace = scrollView.frame.size.width - imageViewWidth
            let x = xSpace * 0.5
            imageView.frame = CGRect(x: x, y: 0, width: imageViewWidth, height: imageViewHeight)
        }
        scrollView.addSubview(imageView)
        self.imageView = imageView
    }

    func setupGesture() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction(_:)))
        doubleTap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTap)
     
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        scrollView.addGestureRecognizer(tap)
        tap.require(toFail: doubleTap)
    }
    
    @objc
    func doubleTapAction(_ gesture: UITapGestureRecognizer) {
        if (scrollView.zoomScale > 1) {
            scrollView.setZoomScale(1, animated: true)
        } else {
            let location = gesture.location(in: imageView)
            let xSize = scrollView.frame.width / scrollView.maximumZoomScale
            let ySize = scrollView.frame.height / scrollView.maximumZoomScale
            scrollView.zoom(to: CGRect(x: location.x - xSize / 2, y: location.y - ySize / 2, width: xSize, height: ySize), animated: true)
        }
    }
    
    @objc
    func tapAction() {
        cleanScreenClousre?()
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("😄" + "scrollViewDidScroll")
//        print("😄 imageView.frame: " + "\(imageView.frame)")

    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let offsetX: CGFloat = max((scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5, 0.0);
        let offsetY: CGFloat = max((scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5, 0.0);
        imageView.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY)
    }
}
