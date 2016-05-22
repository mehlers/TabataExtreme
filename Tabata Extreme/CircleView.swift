//
//  CircleView.swift
//  Tabata Extreme
//
//  Created by Matthew Ehlers on 5/18/16.
//  Copyright © 2016 Matthew Ehlers. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var circleLayer: CAShapeLayer!
    var loadingLabel: UILabel!
    
    var topGearImage:UIImage!
    var topGearImageView:UIImageView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        topGearImage = UIImage(named: "gearFrame5")
        topGearImageView = UIImageView(image: topGearImage)
        topGearImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        self.addSubview(topGearImageView)
        
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2.0, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = UIColor.redColor().CGColor
        circleLayer.lineWidth = 5.0;
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
        
        loadingLabel = UILabel(frame: CGRectMake(frame.size.width / 2.0, frame.size.height / 2.0, 50, 60))
        loadingLabel.backgroundColor = UIColor.clearColor()
        
        loadingLabel.textColor = UIColor.grayColor()
        loadingLabel.font = UIFont(name: "helvetica", size: 18.0)
        
        loadingLabel.text = "20"
        loadingLabel.textAlignment = NSTextAlignment.Center
        
        self.addSubview(loadingLabel)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateCircle(duration: NSTimeInterval) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = 1.0
        
        animation.setValue("shake", forKey: "animationID")
        animation.delegate = self

        
        // Do the actual animation
        circleLayer.addAnimation(animation, forKey: "animateCircle")
    }
    
    func pauseAnimation(){
        let pausedTime = circleLayer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        circleLayer.speed = 0.0
        circleLayer.timeOffset = pausedTime
    }
    
    func resumeAnimation(){
        let pausedTime = circleLayer.timeOffset
        circleLayer.speed = 1.0
        circleLayer.timeOffset = 0.0
        circleLayer.beginTime = 0.0
        let timeSincePause = circleLayer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pausedTime
        circleLayer.beginTime = timeSincePause
    }
    
    // check to see if animation has finished
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        // Unwrap the optional value for the key "animationID" then
        // if it's equal to the same value as the relevant animation,
        // execute the relevant code
        if let animationID: AnyObject = anim.valueForKey("animationID") {
            if animationID as! NSString == "shake" {
                print("animation has stopped")
            }
        }
    }
    
}
