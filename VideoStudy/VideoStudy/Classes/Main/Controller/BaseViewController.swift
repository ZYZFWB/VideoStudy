//
//  BaseViewController.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/11.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

//let kItemMargin: CGFloat = 10
//let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
//let kNormalItemH = kNormalItemW * 3 / 4
//let kHeaderViewH: CGFloat = 50
//
//let kNormalCellID = "kNormalCellID"
//let kHeaderViewID = "kHeaderViewID"

class BaseViewController: UIViewController {

    lazy var collectionView: UICollectionView = {[unowned self] in
       //1.创建布局
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        collectionView.register(UINib(nibName: "NormalCVCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "HeaderCRView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    func setUpUI() {
        view.addSubview(collectionView)
    }
    

}

//MARK:- 实现数据源
extension BaseViewController : UICollectionViewDataSource {
    
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
extension BaseViewController : UICollectionViewDelegate {
   
}
