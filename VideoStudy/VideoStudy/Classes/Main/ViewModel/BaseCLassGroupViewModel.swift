//
//  BaseCLassGroupViewModel.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/11.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

class BaseCLassGroupViewModel {

    lazy var classGroups: [ClassGroupsModel] = []
    
    func loadClassGroupData(urlString: String, paramers: [String : Any]? = nil, finishCallback: @escaping () -> ()) {
        NetworkTools.requestData(urlString: urlString, method: .get, paramters: paramers) { (result) in
            guard let resultDict = result as? [String : Any] else {return}
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            let group = ClassGroupsModel()
            for dict in dataArray {
                group.childenGroups.append(ClassGroupsModel(dict: dict))
            }
            self.classGroups.append(group)
            
        }
        finishCallback()
    }
}
