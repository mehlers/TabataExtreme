//
//  CircleBackgroundView.swift
//  Tabata Extreme
//
//  Created by Matthew Ehlers on 5/30/16.
//  Copyright © 2016 Matthew Ehlers. All rights reserved.
//

import UIKit

class CircleBackgroundView: UIView {

    var topGearImage:UIImage!
    var topGearImageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        topGearImage = UIImage(named: "CircleBackground")
        topGearImageView = UIImageView(image: topGearImage)
        topGearImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        self.addSubview(topGearImageView)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
