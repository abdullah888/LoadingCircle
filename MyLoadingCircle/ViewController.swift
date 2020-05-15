//
//  ViewController.swift
//  MyLoadingCircle
//
//  Created by abdullah on 22/09/1441 AH.
//  Copyright © 1441 abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var replicatorLayer: CAReplicatorLayer!
    var sourceLayer: CAShapeLayer! {
        didSet {
            sourceLayer.lineWidth = 1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        replicatorLayer = CAReplicatorLayer()
        sourceLayer = CAShapeLayer()
        
        self.view.layer.addSublayer(replicatorLayer)
      
        replicatorLayer.addSublayer(sourceLayer)
        
        
        startAnimation(delay: 0.1, replicates: 15)
    }


    override func viewWillLayoutSubviews() {
        
   
        replicatorLayer.frame = self.view.bounds
  
        replicatorLayer.position = self.view.center
        
        sourceLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        sourceLayer.cornerRadius = sourceLayer.frame.width / 2
        sourceLayer.backgroundColor = UIColor.white.cgColor
        sourceLayer.position = self.view.center
    
        sourceLayer.anchorPoint = CGPoint(x: 0.0, y: 5.0)
    }
    

    func startAnimation(delay: TimeInterval, replicates: Int) {
        
       
        replicatorLayer.instanceCount = replicates
    
        let angle = CGFloat(2.0 * .pi) / CGFloat(replicates)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1.0)
        replicatorLayer.instanceDelay = delay
        
        sourceLayer.opacity = 0
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = Double(replicates) * delay
        opacityAnimation.repeatCount = Float.infinity
        
        
        sourceLayer.add(opacityAnimation, forKey: "activityIndicator")
    }
    
}

