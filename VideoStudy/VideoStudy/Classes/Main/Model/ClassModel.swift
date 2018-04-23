//
//  Classes.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/12.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

class ClassModel: NSObject {
    @objc var class_id: Int = 0
    @objc var name: String = ""
    @objc var icon_url: String = ""
    @objc var summary: String = ""
    @objc var teacher: String = ""
    @objc var price: Float = 0.0
    @objc var createdDate: String = ""
    
    @objc var parent_group: [String : Any]?
    {
        didSet {
            guard let parent_group = parent_group else {return}
            parentGroup = ClassGroupsModel(dict: parent_group)
        }
    }
    
    lazy var  parentGroup: ClassGroupsModel = ClassGroupsModel()
    
    override init() {
        
    }
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
