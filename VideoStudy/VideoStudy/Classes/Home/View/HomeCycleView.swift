//
//  HomeCycleView.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/11.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class HomeCycleView: UIView {

    //MARK: - 定义属性
    var cycleTime: Timer?
    var cycleModels: [CycleModel]? {
        didSet {
            //1.刷新数据
            collectionView.reloadData()
            
            //2.设置pageController个数
            pageControl.numberOfPages = 3
            
            //3.默认滚到中间某一个位置
            //let indexPath = IndexPath(item: (cycleModels?.count ?? 0)*10, section: 0)
            //collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
            
            
        }
    }
    
    //MARK:- 控件属性
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置该控件不随着父控件拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        
        //注册cell
        collectionView.register(UINib(nibName: "CycleCVCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
        
        
    }
    
    //设置collectionView里面的layout和布局（其他在xib设置）
    override func layoutSubviews() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        
    }
}

//MARK:- 提供一个快速创建View类方法
extension HomeCycleView {
    class func homeCycleView() -> HomeCycleView {
        return Bundle.main.loadNibNamed("HomeCycleView", owner: nil, options: nil)?.first as! HomeCycleView
    }
}

//MARK:- 遵守UiCollectionView的数据源(view的要在xib右键数据源拉到view)
extension HomeCycleView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return (cycleModels?.count ?? 0) * 10000
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CycleCVCell
        //cell.cycleModel = self.cycleModels?[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
}

//MARK: - uicollectionview代理协议
extension HomeCycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetx = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        print("offsetx:\(scrollView.contentOffset.x)")
        print("width:\(scrollView.bounds.width)")
        pageControl.currentPage = Int(offsetx / scrollView.bounds.width)
    }
}
