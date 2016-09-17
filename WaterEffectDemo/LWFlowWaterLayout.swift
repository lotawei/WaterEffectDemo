//
//  LWFlowWaterLayout.swift
//  WaterEffectDemo
//
//  Created by lotawei on 16/9/17.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

protocol WaterFlowViewLayoutDelegate:NSObjectProtocol {
    
    ///width是瀑布流每列的宽度
    func waterFlowViewLayout(waterFlowViewLayout:LWFlowWaterLayout,heightForWidth:CGFloat,atIndextPath:NSIndexPath)->CGFloat
}
 var  Margin:CGFloat =  8

class LWFlowWaterLayout: UICollectionViewLayout {
    //列
    var   columnCount:NSInteger = 3
    //最大item 的高度
    var  maxY:CGFloat =  0
    //item  宽度
    var  columWidth:CGFloat = 0
    //列间距
    var columnSpace:CGFloat = Margin
    //行间距
    var rowSpace:CGFloat = Margin
    //组边距
    var  setionInset:UIEdgeInsets = UIEdgeInsetsMake(Margin, Margin, Margin, Margin)
    //保存每一列高度的数组
    var   maxyDic = [NSInteger:CFloat]()
    //保存每一个item 的attributes
    var   attributesArray = [UICollectionViewLayoutAttributes]()
    weak  var  delegate:WaterFlowViewLayoutDelegate?
    //掉这个的时候会调用reloaddata()
   
    override func prepare() {
            //即将布局加载的时候需要啊属性弄好
        for  key   in  0..<columnCount{
            maxyDic[key]   = 0
        }
        //清空之前的布局属性
        attributesArray.removeAll()
        //清空最大列的y值
        maxY = 0
        //清空列宽
        columWidth = 0
        //计算每列的宽度 ，需要在布局之前计算好
        columWidth = (UIScreen.main.bounds.width - setionInset.left - setionInset.right - (CGFloat(columnCount) - 1)*columnSpace)/CGFloat(columnCount)
        //得到item的个数  ? _:0
        let   items = collectionView?.numberOfItems(inSection: 0) ?? 0
        for  i in  0..<NSInteger(items){
            //布局每个cell的frame
            let   layoutAttr = layoutAttributesForItem(at: IndexPath(item: i, section: 0))
            attributesArray.append(layoutAttr!)
            
        }
        setmaxY()
    }
    func   setmaxY()  {
        //遍历当前字典哪一列最长
        var   maxYcolumn =  0  //默认第一列最长
        for (key,value) in maxyDic {
            if value > maxyDic[maxYcolumn]! {
                maxYcolumn = key
            }
        }
        maxY = CGFloat( maxyDic[maxYcolumn]! ) + setionInset.bottom
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        assert(delegate != nil,"瀑布流必须实现代理");
        let   height =  delegate?.waterFlowViewLayout(waterFlowViewLayout: self, heightForWidth: columWidth, atIndextPath: indexPath as NSIndexPath)
        //这里要找到最短的一列
        var  minYColumn  = 0
        //
        for (key,value) in maxyDic{
            if value < maxyDic[minYColumn]! {
                minYColumn = key
            }
            
        }
        //最短的那列
        let   x = setionInset.left + CGFloat(minYColumn) * (columWidth + columnSpace)
        //最短 的y值是
        let y = CGFloat( maxyDic[minYColumn]!) + rowSpace
        //设置frame 的布局属性
        let  frame = CGRect(x: x, y: y, width: columWidth, height: height!)
        //更新最短的这列的最大y值
        maxyDic[minYColumn]! = CFloat(frame.maxY)
        //设置cell的布局属性
        let   layoutAttr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        layoutAttr.frame = frame
        return  layoutAttr
    }
    //预加载下一页数据
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return   attributesArray
    }
    //这个方法必须重写  自定义的瀑布流的时候
    override var collectionViewContentSize: CGSize{
        return  CGSize(width: columWidth, height: maxY)
    }
    
    
    
}
