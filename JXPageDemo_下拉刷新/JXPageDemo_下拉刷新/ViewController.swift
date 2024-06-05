//
//  ViewController.swift
//  JXPageDemo_下拉刷新
//
//  Created by ming zhou on 2024/6/3.
//

import UIKit
import JXPagingView
import JXSegmentedView

extension JXPagingListContainerView: JXSegmentedViewListContainer {}


class ViewController: UIViewController {
    
    lazy var segmentedView: JXSegmentedView = {
        let segmentedView = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 66))
        return segmentedView
    }()
    lazy var headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100))
       headerView.backgroundColor = .purple
        return headerView
    }()
    lazy var pagingView: JXPagingView = {
        let pagingView = JXPagingView(delegate: self, listContainerType: .scrollView)
        return pagingView
    }()
    var dataSource: JXSegmentedTitleDataSource = JXSegmentedTitleDataSource()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(pagingView)
        dataSource.titles = ["1", "2", "3"]
        segmentedView.dataSource = dataSource
        segmentedView.listContainer = pagingView.listContainerView
        //pagingView.listContainerView
//        segmentedView.listContainer = pagingView.listContainerView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pagingView.frame = view.bounds
    }


}

extension ViewController: JXPagingViewDelegate {
    /// tableHeaderView的高度，因为内部需要比对判断，只能是整型数
    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
         100
    }
    /// 返回tableHeaderView
    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        return  headerView
    }
    /// 返回悬浮HeaderView的高度，因为内部需要比对判断，只能是整型数
    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int {
        return Int(segmentedView.frame.size.height)
    }
    /// 返回悬浮HeaderView
    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView {
        return segmentedView
    }
    /// 返回列表的数量
    func numberOfLists(in pagingView: JXPagingView) -> Int {
        dataSource.titles.count
    }
    /// 根据index初始化一个对应列表实例，需要是遵从`JXPagerViewListViewDelegate`协议的对象。
    /// 如果列表是用自定义UIView封装的，就让自定义UIView遵从`JXPagerViewListViewDelegate`协议，该方法返回自定义UIView即可。
    /// 如果列表是用自定义UIViewController封装的，就让自定义UIViewController遵从`JXPagerViewListViewDelegate`协议，该方法返回自定义UIViewController即可。
    ///
    /// - Parameters:
    ///   - pagingView: pagingView description
    ///   - index: 新生成的列表实例
    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate {
        let vc = ListViewController()
        return vc
    }


}

