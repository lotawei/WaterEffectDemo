//
//  UIColor+extention.swift
//  WaterEffectDemo
//
//  Created by lotawei on 16/9/17.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import Foundation
import UIKit
extension  UIColor{
    class  func   randomColor()->UIColor{
         return UIColor(red: randomValue(), green: randomValue(), blue: randomValue(), alpha: 1)
    }
    class  func randomValue()->CGFloat {
        return CGFloat(arc4random_uniform(256))/255
    }
}
