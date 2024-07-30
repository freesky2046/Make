//
//  ViewController.swift
//  demoCollectionView
//
//  Created by ming zhou on 2024/7/13.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pageView)
        pageView.frame = view.bounds
        
//        view.addSubview(collectionView)
//        collectionView.frame = view.bounds
        
    }

    lazy var pageView: TYCyclePagerView = {
        let pageView = TYCyclePagerView(frame: .zero)
        pageView.dataSource = self
        pageView.isInfiniteLoop = true
        pageView.autoScrollInterval = 0
        pageView.register(TCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(TCollectionViewCell.self))
        return pageView
    }()
    

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .white
        
        collectionView.keyboardDismissMode = .onDrag
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(TCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(TCollectionViewCell.self))
 
        return collectionView
    }()

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageView.frame = view.bounds
//        collectionView.frame = view.bounds
    }

}


extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TCollectionViewCell.self), for: indexPath) as! TCollectionViewCell
//        if indexPath.row == 0 {
//            cell.backgroundColor = .red
//
//        }
//        if indexPath.row == 1 {
//            cell.backgroundColor = .blue
//        }
//        if indexPath.row == 2 {
//            cell.backgroundColor = .yellow
//        }
        cell.refresh(name: "1")
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(view.frame.size.width, view.frame.size.height)
    }
}


extension ViewController: TYCyclePagerViewDataSource {
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        let layout = TYCyclePagerViewLayout()
        layout.itemSize = pageView.bounds.size
        layout.layoutType = .normal
        return layout
    }
    
    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
       3
    }
    
    func pagerView(_ pageView: TYCyclePagerView, didEndDisplaying cell: UICollectionViewCell, for index: Int) {
//        let c = cell as? ArtifactFeedContentPageCell
//        c?.scrollView.setZoomScale(1, animated: false)
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TCollectionViewCell.self), for: index)  as! TCollectionViewCell
        cell.refresh(name: "1")
        return cell
    }
}



