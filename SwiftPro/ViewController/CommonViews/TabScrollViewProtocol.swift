//
//  TabScrollViewProtocol.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/02/21.
//

import UIKit

protocol TabSubScrollViewSyncable: class {
    var contentOffset: CGPoint { get set }
    var syncScrollContext: ScrollContextInfo? { get set }
    func syncContext()
}

protocol TabScrollViewSyncable: class {
    var scrollableContainer: TabSubScrollViewSyncable? { get }
}

protocol TabScrollViewViewControllerDelegate: class {
    func childViewController(atIndex index: Int) -> UIViewController & TabScrollViewSyncable
    func parentViewController() -> UIViewController
}

protocol TabScrollViewDelegate: class {
    var indexChangedClosure: ((Int,Bool) -> Void)? { get set }
    
    func defaultIndex(index: Int)
    func numberOfItems() -> Int
    func vcScrollViewDidScroll(_ scrollView: UIScrollView)
}
