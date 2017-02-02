//
//  LoadingTableView.swift
//  loadingIndicator
//
//  Created by Yuhsuan on 02/02/2017.
//  Copyright © 2017 cgua. All rights reserved.
//

import UIKit

class LoadingTableView: UITableView {

    let loading_image = UIImage(named: "yes-circle-png")
    
    var loading_image_view: UIImageView
    
    required init(coder aDecoder: NSCoder) {
        
        loading_image_view = UIImageView(image: loading_image)
        
        super.init(coder: aDecoder)!
        
        addSubview(loading_image_view)
        
        adjustSizeOfLoadingIndicator()
        
    }
    
    func showLoadingIndicator() {
        
        loading_image_view.isHidden = false
        
        self.bringSubview(toFront: loading_image_view)
        
        startRefreshing()
        
    }
    
    func hideLoadingIndicator() {
        
        loading_image_view.isHidden = true
        
        stopRefreshing()
        
    }
    
    override func reloadData() {
        
        super.reloadData()
        
        self.bringSubview(toFront: loading_image_view)
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        adjustSizeOfLoadingIndicator()
        
    }
    
    private func adjustSizeOfLoadingIndicator() {
        
        let loading_image_size = loading_image!.size
        
        loading_image_view.frame = CGRect(x: frame.width/2 - loading_image_size.width/2, y: frame.height/2-loading_image_size.height/2, width:  loading_image_size.width, height: loading_image_size.height)
    
    }
    
    private func startRefreshing() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z") // keypath 值可以選擇路徑是移動、旋轉
        
        animation.isRemovedOnCompletion = false
        
        animation.toValue = M_PI * 2.0 //終止角度
        
        animation.duration = 0.8 //動畫持續時間
        
        animation.isCumulative = true
        
        animation.repeatCount = Float.infinity //重複次數
        
        loading_image_view.layer.add(animation, forKey: "rotationAnimation")
        
    }
    
    private func stopRefreshing() {
        
        loading_image_view.layer.removeAllAnimations()
        
    }

}
