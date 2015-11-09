//
//  ViewController.swift
//  SwiftEasingAnimation
//
//  Created by FrankLiu on 15/11/9.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "keyFrameAnimation", userInfo: nil, repeats: true)
        
        timer.fire()

    }
    
    func keyFrameAnimation() {
    
        frameValueAnimation()
        pointValueAnimation()
        sizeValueAnimation()
    }
    
    /**
     关键帧动画例子
     */
    func frameValueAnimation() {
    
        // 创建easing
        let easingValue = EasingValue(withFunction: .ElasticEaseInOut, frameCount: 120)
        
        // 创建关键帧动画
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        keyFrameAnimation.values = easingValue.frameValueWith(fromValue: 0, toValue: M_PI)
        keyFrameAnimation.duration = 4
        
        // 创建layer + 执行动画
        let layer = CALayer()
        layer.frame = CGRect(x: 60, y: 60, width: 100, height: 100)
        layer.borderWidth = 1
//        layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
        layer.addAnimation(keyFrameAnimation, forKey: nil)
        view.layer.addSublayer(layer)
    }
    
    /**
     关键帧点动画例子
     */
    func pointValueAnimation() {
    
        // 创建layer
        let layer = CALayer()
        layer.frame = CGRect(x: 60, y: 60, width: 100, height: 100)
        layer.borderWidth = 1
        
        // 创建easing
         let easingValue = ComplexEasingValue(withFunctionA: .LinearInterpolation, FunctionB: .BounceEaseOut, frameCount: 120)
        
        // 创建关键帧动画
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        keyFrameAnimation.values = easingValue.pointValueWith(fromPoint: layer.position, toPoint: view.center)
        keyFrameAnimation.duration = 2
//        layer.position = view.center
        
        // 执行动画
        layer.addAnimation(keyFrameAnimation, forKey: nil)
        view.layer.addSublayer(layer)
    }
    
    /**
     关键帧尺寸动画例子
     */
    func sizeValueAnimation() {
    
        // 创建layer
        let layer = CALayer()
        layer.frame = CGRect(x: 60, y: 60, width: 100, height: 100)
        layer.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5).CGColor
        
        // 创建easing
        let easingValue = EasingValue(withFunction: .ElasticEaseInOut, frameCount: 120)
        
        // 创建关键帧动画
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds.size")
        keyFrameAnimation.values = easingValue.sizeValueWith(fromSize: layer.bounds.size, toSize: CGSize(width: 150, height: 150))
        keyFrameAnimation.duration = 4
//        layer.bounds.size = CGSize(width: 150, height: 150)
        
        // 执行动画
        layer.addAnimation(keyFrameAnimation, forKey: nil)
        view.layer.addSublayer(layer)
    }


}

