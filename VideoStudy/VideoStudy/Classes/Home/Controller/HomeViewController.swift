//
//  HomeViewController.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/10.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

let kItemMargin: CGFloat = 10
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4
let kHeaderViewH: CGFloat = 50

private let kCycleViewH: CGFloat = kScreenW * 3 / 8

let kNormalCellID = "kNormalCellID"
let kHeaderViewID = "kHeaderViewID"

class HomeViewController: UIViewController {

    //MARK:- 懒加载属性
    fileprivate lazy var homeViewModel: HomeViewModel = HomeViewModel()
    
    //创建CollectionView，可以滚动
    fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
        //1.创建布局
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        collectionView.register(UINib(nibName: "NormalCVCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "HeaderCRView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
    }()
    
    //创建HomeCycleView轮播
    fileprivate lazy var homeCycleView: HomeCycleView = {[unowned self] in
        let homeCycleView = HomeCycleView.homeCycleView()
        homeCycleView.frame = CGRect(x: 0, y: -kCycleViewH, width: kScreenW, height: kCycleViewH)
        return homeCycleView
    }()
    
    //MARK: - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()

        //调用设置ui界面
        setUpUI()
        
        //加载数据
        loadData()
    }

    //MARK:- 设置UI界面
    fileprivate func setUpUI() {
        //1.设置导航栏
        setUpNavigationBar()
        
        view.addSubview(collectionView)
        //轮播添加到collectionView，可以跟着一起滚动
        collectionView.addSubview(homeCycleView)
        
        //设置collectionView内边距,这样就可以显示后来加入的homeCycleView
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate func setUpNavigationBar() {
        
        //设置左侧logo图片
        let btnLogoItem = UIBarButtonItem(image: UIImage(named: "logo"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = btnLogoItem
        
        //设置右侧搜索按钮
        let btnSearchItem = UIBarButtonItem(image: UIImage(named: "search_s"), style: .plain, target: self, action: nil)
        btnSearchItem.tintColor = UIColor(red: 225/255, green: 101/255, blue: 49/255, alpha: 1)
        navigationItem.rightBarButtonItem = btnSearchItem
        
        //设置中间标题
        navigationItem.title = "学习网"
    }
   
    //MARK: - 加载数据
    fileprivate func loadData() {
        //homeCycleView.cycleModels
    }
}


//MARK:- 实现数据源
extension HomeViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! NormalCVCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        
        return headerView
    }
}

//MARK:- 代理
extension HomeViewController : UICollectionViewDelegate {
    
}
