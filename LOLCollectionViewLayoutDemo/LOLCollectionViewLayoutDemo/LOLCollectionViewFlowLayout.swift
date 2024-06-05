//
//  LOLCollectionViewFlowLayout.swift
//  LOLCollectionViewLayoutDemo
//
//  Created by ming zhou on 2024/5/22.
//

import UIKit


class LOLCollectionViewFlowLayout: UICollectionViewLayout {
    
    var verticalItemSpace: CGFloat = 80.0 // 元素行间距
    var horizonlItemSpace: CGFloat = 40.0  // 元素列间距
    var maxCountPerLine: Int = 4          // 每一行最大的元素个数
    var contentInsetLeft: CGFloat = 0.0  //
    var contentInsetRight: CGFloat = 0.0
    var contentInsetTop: CGFloat = 2.0
    
    
    private(set) var width: CGFloat = 0.0
    private(set) var height: CGFloat = 0.0
    private var layoutAttributesArray:[UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        super.prepare()
        configLayout()
    }
    
    func configLayout() {
        layoutAttributesArray.removeAll()
        let count = collectionView?.numberOfItems(inSection: 0) ?? 0
        var lastLayoutAttributes: UICollectionViewLayoutAttributes? = nil
        for i in 0..<count {
            let layoutAttributes: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: i, section: 0))
            let itemSize = self.calculateItemSize()
            if i == 0 {
                layoutAttributes.frame = CGRect(x: -self.contentInsetLeft, y: -self.contentInsetTop, width: itemSize.width, height: itemSize.height)
            }
            else {
                var shouldAlignNextLine: Bool = false
                
                /// 计算是否要换一行
                let right = lastLayoutAttributes!.frame.size.width + lastLayoutAttributes!.frame.origin.x + horizonlItemSpace + itemSize.width
                let totalWidth = self.contentInsetLeft + maxCountPerLine * itemSize.width + (maxCountPerLine - 1) * horizonlItemSpace + self.contentInsetRight
                if right > totalWidth {
                    shouldAlignNextLine = true
                }
                if shouldAlignNextLine == false  {
                    layoutAttributes.frame = CGRectMake(x: lastLayoutAttributes!.frame.size.width + lastLayoutAttributes!.frame.origin.x + horizonlItemSpace , lastLayoutAttributes?.frame.origin.y, itemSize.width, itemSize.height)
                }
                else {
                    layoutAttributes.frame =  CGRect(x: - self.contentInsetLeft, y: - self.contentInsetTop + lastLayoutAttributes?.frame.maxY + self.verticalItemSpace, width: itemSize.width, height: itemSize.height)
                }
            }
            layoutAttributesArray.append(layoutAttributes)
            lastLayoutAttributes = layoutAttributes
        }
    }
    // 当collectionView bounds改变时，是否重新布局
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
         return true
    }
    
    // 返回collectionView的最终大小
    override var collectionViewContentSize: CGSize {
         return calculateContentSize()
    }
    
    // 滑动时会时时调用此方法， 返回当前可见的 collectionView 的布局信息
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var result: [UICollectionViewLayoutAttributes] = []
        for layoutAttributes in layoutAttributesArray {
            if CGRectIntersectsRect(rect, layoutAttributes.frame) {
                result.append(layoutAttributes)
            }
        }
        return result
    }
    
    // 最终滑动的contentOffset, proposedContentOffset是预期滑动停止的位置
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
    }
}

extension LOLCollectionViewFlowLayout {
    private func calculateContentSize() -> CGSize {
        let itemCount = self.collectionView?.numberOfItems(inSection: 0)
        let spaceCount = itemCount
    }
    
    private func calculateItemSize() -> CGSize {
        let collectionViewWidth = collectionView?.bounds.size.width ?? 0
        let collectionViewHeight = collectionView?.bounds.size.height ?? 0
        let itemWidth = collectionViewWidth / 3.0
        let itemHeight = (collectionViewHeight - 2 * verticalItemSpace) / 2.0
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

