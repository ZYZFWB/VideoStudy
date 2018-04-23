//
//  ClassGroupsModel.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/12.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

class ClassGroupsModel: NSObject {
    
    //组中的课程分类子类数据json数据
    @objc var childen_groups: [[String : Any]]?
    {
        didSet {
            guard let childen_groups = childen_groups else { return }
            for dict in childen_groups {
                childenGroups.append(ClassGroupsModel(dict: dict))
//                guard let class_group = dict["class_group"] as? [[String : Any]] else {continue}
//
//                for di in class_group {
//                    classGroups.append(ClassModel(dict: di))
//                }
                
            }
        }
    }
    //组中的课程分类子类数据json数据
    @objc var parent_group: [String : Any]?
    {
        didSet {
            guard let parent_group = parent_group else {return}
            parentGroup = ClassGroupsModel(dict: parent_group)
        }
    }
    
    //其他属性
    @objc var name: String = ""
    @objc var cate_level: String = ""
    
    
    //转变后的课程子分类
    lazy var childenGroups: [ClassGroupsModel] = []
    //转变后的课程父分类
    lazy var parentGroup: ClassGroupsModel = ClassGroupsModel()
    
    //转变后的课程数据
    lazy var classGroups: [ClassModel] = []
    
    override init() {
        
    }
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
