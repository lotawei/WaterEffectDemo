//
//  UIImage+extion.swift
//  WaterEffectDemo
//
//  Created by lotawei on 16/9/17.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
var   arr = ["0.jpg","1.jpg","2.jpg","3.jpg"]
extension   UIImage{
    class func  randdomimage() ->UIImage {
        let   aimeg = UIImage(named:arr[randomValue()] )
        
        return   aimeg!
    }
    class  func randomValue()->NSInteger {
        return NSInteger(arc4random_uniform(UInt32(arr.count)))
    }
    //根据大小裁剪新图片
    class func  scaleImageForsize(sourceImage:UIImage,size:CGSize)  ->UIImage {
        var newImage:UIImage? = nil
        
        let imageSize = sourceImage.size
        
        let width = imageSize.width
        
        let height:CGFloat = imageSize.height
        
        let targetWidth:CGFloat = size.width
    
        let  targetHeight:CGFloat = size.height
        
        var scaleFactor:CGFloat = 0.0
        
        var scaledWidth:CGFloat = targetWidth;
        
        var scaledHeight:CGFloat = targetHeight;
        
        var thumbnailPoint = CGPoint(x:0.0,y:0.0)
        
        
        if(imageSize.equalTo(size) == true){
            
            
            let widthFactor = targetWidth / width;
            
            let heightFactor:CGFloat = CGFloat( targetHeight / height)
            
            
            if(widthFactor > heightFactor){
                
                scaleFactor = widthFactor
                
                
            }
                
            else{
                
                
                scaleFactor = heightFactor
                
            }
            
            scaledWidth = width * scaleFactor
            
            scaledHeight = height * scaleFactor
            
            
            if(widthFactor > heightFactor){
                
                
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
                
            }else if(widthFactor < heightFactor){
                
                
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
                
            }
            
        }
        
        
        UIGraphicsBeginImageContext(size)
        
        
        var thumbnailRect:CGRect = CGRect(x:0, y:0, width:0, height:0)
        
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        
        
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        if(newImage == nil){
            
           print("error")
            
        }
        
        
        UIGraphicsEndImageContext();
        
        return newImage!;
        
    }
    //按指定宽高比缩放
    class func imageCompressForWidtd(sourceImage:UIImage, defineWidth:CGFloat)->UIImage{
    
    
        var newImage:UIImage? = nil
        
       
        
        let imageSize = sourceImage.size
        
        let width = imageSize.width
        
        let height = imageSize.height
        
        let targetWidth:CGFloat = defineWidth
        
        let targetHeight:CGFloat = height / (width / targetWidth)
        
        let size = CGSize(width: targetWidth, height: targetHeight)
        var scaleFactor:CGFloat = 0.0;
        
        var scaledWidth = targetWidth;
        
        var scaledHeight = targetHeight;
        
        var thumbnailPoint = CGPoint(x:0.0, y:0.0);
    
        if(imageSize.equalTo(size) == false){
            

    
    
            let widthFactor:CGFloat = targetWidth / width;
    
    let heightFactor = targetHeight / height;
    
    
    if(widthFactor > heightFactor){
    
    scaleFactor = CGFloat(widthFactor)
    
    }
    
    else{
    
    scaleFactor = CGFloat(heightFactor);
    
    }
    
    scaledWidth = CGFloat( width * scaleFactor);
    
    scaledHeight = CGFloat( height * scaleFactor);
    
    
    if(widthFactor > heightFactor){
    
    
    thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
    
    
    }else if(widthFactor < heightFactor){
    
    
    thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
    
    }
    
    }
    
    
    UIGraphicsBeginImageContext(size);
    
    
        var thumbnailRect = CGRect(x:0,y:0,width:0,height:0);
    
    thumbnailRect.origin = thumbnailPoint;
    
    thumbnailRect.size.width = scaledWidth;
    
    thumbnailRect.size.height = scaledHeight;
    
    sourceImage.draw(in: thumbnailRect)
  
    
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    if(newImage == nil){
    
    
   print("erro")
    }
    
    UIGraphicsEndImageContext();
    
    return newImage!;
    
    }
}

