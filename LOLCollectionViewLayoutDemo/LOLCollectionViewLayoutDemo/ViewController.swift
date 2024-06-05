//
//  ViewController.swift
//  LOLCollectionViewLayoutDemo
//
//  Created by ming zhou on 2024/5/22.
//

import UIKit




class ViewController: UIViewController {


    private lazy var collectionView: UICollectionView = {
        let layout: LOLCollectionViewFlowLayout = LOLCollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .white
        collectionView.keyboardDismissMode = .onDrag
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DMCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(DMCollectionViewCell<##>.self))
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(DMCollectionViewCell<##>.self), for: indexPath)
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {

}

