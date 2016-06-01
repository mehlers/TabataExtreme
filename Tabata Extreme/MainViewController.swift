//
//  MainViewController.swift
//  Tabata Extreme
//
//  Created by Matthew Ehlers on 5/17/16.
//  Copyright © 2016 Matthew Ehlers. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var circleV: UIView!
    @IBOutlet var circleBackgroundV: UIView!
    @IBOutlet var exerciseV: UIView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    
    var circleView:CircleView!
    var circleBackgroundView:CircleBackgroundView!
    var exerciseView:ExerciseView!
    var circlePaused:Bool = false

    @IBAction func PlayButton(sender: AnyObject) {
        if (circlePaused) {
            circleView.resumeAnimation()
        } else {
            addCircleView()
            addExerciseView()
        }
        playButton.hidden = true
        pauseButton.hidden = false
    }
    @IBAction func PauseButton(sender: AnyObject) {
        circleView.pauseAnimation()
        playButton.hidden = false
        pauseButton.hidden = true
        circlePaused = true
    }
    @IBAction func StopResumeButton(sender: AnyObject) {
        circleView.pauseAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        // running addCircleView here because this is after auto layout has run
        //addCircleView()
        addCircleBackgroundView()
        pauseButton.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCircleBackgroundView() {
        // Create a new CircleView
        circleBackgroundView = CircleBackgroundView(frame: CGRectMake(0, 0, circleBackgroundV.frame.size.width, circleBackgroundV.frame.size.height))
        circleBackgroundV.addSubview(circleBackgroundView)
        
    }
    
    func addCircleView() {        
        // Create a new CircleView
        circleView = CircleView(frame: CGRectMake(0, 0, circleV.frame.size.width, circleV.frame.size.height))
        circleV.addSubview(circleView)
        
        // Animate the drawing of the circle over the course of 10 second
        circleView.animateCircle(10.0)
    }
    
    func addExerciseView() {
        // Create a new ExerciseView
        exerciseView = ExerciseView(frame: CGRectMake(0, 0, exerciseV.frame.size.width, exerciseV.frame.size.height))
        exerciseV.addSubview(exerciseView)
        
        // Animate the drawing of the circle over the course of 10 second
//        circleView.animateCircle(10.0)
    }

}
// commment
