//
//  ExerciseView.swift
//  Tabata Extreme
//
//  Created by Matthew Ehlers on 5/22/16.
//  Copyright © 2016 Matthew Ehlers. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Fade in a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeIn(duration duration: NSTimeInterval = 1.0) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeOut(duration duration: NSTimeInterval = 1.0) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 0.0
        })
    }
    
}

class ExerciseView: UIView {
    
    var exercise1Image:UIImage!
    var exercise1ImageView:UIImageView!
    var exercise2Image:UIImage!
    var exercise2ImageView:UIImageView!

    // comment
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        exercise1Image = UIImage(named: "Situp1")
        exercise1ImageView = UIImageView(image: exercise1Image)
        exercise1ImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        exercise1ImageView.alpha = 0.0
        self.addSubview(exercise1ImageView)
        
        exercise2Image = UIImage(named: "Situp2")
        exercise2ImageView = UIImageView(image: exercise2Image)
        exercise2ImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        exercise2ImageView.alpha = 0.0
        self.addSubview(exercise2ImageView)
        
        flashExercise1ImageLabel()


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func flashExercise1ImageLabel() {
        UIView.animateWithDuration(0.0, delay: 0.0, options:
            UIViewAnimationOptions.AllowUserInteraction, animations: {
                let eImage = self.exercise1ImageView
                eImage.alpha = 1.0
            }, completion: { finished in
                self.unFlashExercise1ImageLabel()
        })
    }
    
    func unFlashExercise1ImageLabel() {
        UIView.animateWithDuration(0.3, delay: 1.0, options:
            UIViewAnimationOptions.AllowUserInteraction, animations: {
                let eImage = self.exercise1ImageView
                eImage.alpha = 0.0
            }, completion: { finished in
                self.flashExercise2ImageLabel()
        })
    }
    
    func flashExercise2ImageLabel() {
        UIView.animateWithDuration(0.0, delay: 0.0, options:
            UIViewAnimationOptions.AllowUserInteraction, animations: {
                let eImage = self.exercise2ImageView
                eImage.alpha = 1.0
            }, completion: { finished in
                self.unFlashExercise2ImageLabel()
        })
    }
    
    func unFlashExercise2ImageLabel() {
        UIView.animateWithDuration(0.3, delay: 1.0, options:
            UIViewAnimationOptions.AllowUserInteraction, animations: {
                let eImage = self.exercise2ImageView
                eImage.alpha = 0.0
            }, completion: { finished in
                self.flashExercise1ImageLabel()
        })
    }


}
