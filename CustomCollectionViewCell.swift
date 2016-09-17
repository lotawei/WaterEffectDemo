//
//  CustomCollectionViewCell.swift
//  WaterEffectDemo
//
//  Created by lotawei on 16/9/17.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
   lazy var   iamgeview:UIImageView  = {
        let   aimage  =  UIImageView()
        aimage.contentMode = .scaleAspectFill
    
        aimage.clipsToBounds = true
        return   aimage
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.iamgeview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
          layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2.0
           let  image = UIImage.randdomimage()
//
//           let  size = contentView.bounds.size
//        let  min = size.width > size.height ? size.width:size.height
//            let   sizeimage = UIImage.imageCompressForWidtd(sourceImage: image, defineWidth: min)
            self.iamgeview.frame = contentView.bounds
            self.iamgeview.image = image
            self.iamgeview.contentMode = .scaleToFill
            self.iamgeview.clipsToBounds = true

        
    }
    
    
}
