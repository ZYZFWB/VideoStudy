//
//  CycleCVCell.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/12.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit

class CycleCVCell: UICollectionViewCell {

    //MARK: - 控件属性
    @IBOutlet weak var picImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - 定义模型属性
    var cycleModel: CycleModel? {
        didSet {
            //let iconURl = URL(string: cycleModel!.pic_url)
            //picImage.image = UIImage(named: (cycleModel?.pic_url)!)
            //picImage.kf.setImage(with: iconURl)
            titleLabel.text = cycleModel?.title_name
        }
    }
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
