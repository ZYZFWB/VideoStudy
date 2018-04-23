//
//  CycleModel.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/12.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    @objc var title_name: String = ""
    @objc var pic_url: String = ""
    
    //MARK: - 自定义构造函数
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
