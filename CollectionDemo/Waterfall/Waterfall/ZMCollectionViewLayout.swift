//
//  ZMCollectionViewLayout.swift
//  Waterfall
//
//  Created by 周明 on 2024/4/4.
//

import UIKit

protocol ZMCollectionViewLayoutDataSource : NSObjectProtocol {
    
    /// 根据每一个分组返回每个分组中含有多少列数，有三个维度，section, column, row
    /// - Parameters:
    ///   - section: 当前的列号
    ///   - collectionView: collectionview
    ///   - layout: 布局对象
    /// - Returns: 列
    func numberOfColumnInSection(section:Int, collectionView:UICollectionView, layout:ZMCollectionViewLayout) -> Int
    
    
    /// 返回每一列的高度
    /// - Parameters:
    ///   - collectionView: collectionview
    ///   - layout: 布局
    ///   - height:item Height
    ///   - indexPath: indexPath
    /// - Returns: 列高
    func collectionView (collectionView: UICollectionView, layout: ZMCollectionViewLayout,
                         itemHeight height: CGFloat, heightForItemAt indexPath: IndexPath) -> CGFloat
    
}

class ZMCollectionViewLayout: UICollectionViewLayout {
    
    /// 每一个item的布局信息保存在数组里面
    /// 这里是一个二维数组
    var itemLayoutAttributes:[[UICollectionViewLayoutAttributes]] = []
    var contentHeight:CGFloat = 0.0
    
    /// 预先布局方法
    override func prepare() {
        super.prepare()
        
        let collectionView = self.collectionView
//        let contentInset = collectionView?.contentInset
//        let contentWidth = (collectionView?.bounds.size.width ?? 0) - (contentInset?.left ?? 0 ) - (contentInset?.right ?? 0)
        let numberOfSections = collectionView?.numberOfSections ?? 0
        let range = 0..<numberOfSections
        for section in range {
            var numberOfItems = collectionView?.numberOfItems(inSection: section)
            let attribute = UICollectionViewLayoutAttributes(forCellWith: <#T##IndexPath#>)
        }
        
    }
    
    /// collectionview 内容的尺寸
    override var collectionViewContentSize: CGSize {
        CGSize(width: 100, height: 100)
    }
    
    /// 返回可见范围内的所有布局
    /// - Parameter rect: 可见范围
    /// - Returns: 布局数组
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
    }
}
