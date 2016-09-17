//
//  ViewController.swift
//  WaterEffectDemo
//
//  Created by lotawei on 16/9/17.
//  Copyright © 2016年 lotawei. All rights reserved.
//

//流水布局的精髓 在哪里  ？  在 layout中

import UIKit

class ViewController: UICollectionViewController , WaterFlowViewLayoutDelegate{
    let   reuseidentify = "reusecell"
    let    layout = LWFlowWaterLayout()
    
    init() {
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: reuseidentify)
         layout.delegate = self
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    func waterFlowViewLayout(waterFlowViewLayout: LWFlowWaterLayout, heightForWidth: CGFloat, atIndextPath: NSIndexPath) -> CGFloat {
        
        return CGFloat(100 + arc4random_uniform(80))
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   500
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseidentify, for: indexPath)
        cell.backgroundColor = UIColor.black
        
        return  cell
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let  cell = collectionView.cellForItem(at: indexPath)
        cell?.setNeedsLayout()
    }
   
    
    

}

