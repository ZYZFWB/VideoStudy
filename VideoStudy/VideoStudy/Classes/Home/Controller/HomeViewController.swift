//
//  HomeViewController.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/10.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //调用设置ui界面
        setUpUI()
    }

   
    
}

//MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setUpUI() {
        //1.设置导航栏
        setUpNavigationBar()
    }
    
    fileprivate func setUpNavigationBar() {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo"), for: .normal)
        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
    }
}
