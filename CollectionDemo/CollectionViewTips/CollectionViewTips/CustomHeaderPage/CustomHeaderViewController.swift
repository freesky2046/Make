//
//  CustomHeaderViewController.swift
//  CollectionViewTips
//
//  Created by 周明 on 2024/4/5.
//

import UIKit

class CustomHeaderViewController: UIViewController {
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.headerReferenceSize =
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 88)
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
}


extension CustomHeaderViewController : UICollectionViewDelegateFlowLayout {
    colle
}


extension CustomHeaderViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath)
        }
        else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "footer", for: indexPath)
        }
    }
    
}
 
