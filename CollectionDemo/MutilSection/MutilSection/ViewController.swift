//
//  ViewController.swift
//  MutilSection
//
//  Created by 周明 on 2024/4/4.
//

import UIKit

class ViewController: UIViewController {
    var dataList = [
        ["https://picsum.photos/id/1/200/300",
         "https://picsum.photos/id/2/200/300",
         "https://picsum.photos/id/3/200/300",
         "https://picsum.photos/id/4/200/300",
         "https://picsum.photos/id/5/200/300",
         "https://picsum.photos/id/6/200/300"],   
        
        ["https://picsum.photos/id/7/200/300",
         "https://picsum.photos/id/8/200/300",
         "https://picsum.photos/id/9/200/300",
         "https://picsum.photos/id/10/200/300",
         "https://picsum.photos/id/11/200/300",
         "https://picsum.photos/id/12/200/300"],
        
        ["https://picsum.photos/id/13/200/300",
         "https://picsum.photos/id/14/200/300",
         "https://picsum.photos/id/15/200/300",
         "https://picsum.photos/id/16/200/300",
         "https://picsum.photos/id/17/200/300",
         "https://picsum.photos/id/18/200/300"],
    ]
    
    lazy var collectionView = {
      let flowlayout = UICollectionViewFlowLayout()
      
      flowlayout.scrollDirection = .vertical
      let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowlayout)
      collectionView.contentInsetAdjustmentBehavior = .never
      
      return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let subDataList = dataList[section]
        return subDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         dataList.count
    }
    
    
}
