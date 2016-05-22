//
//  ExercisesViewController.swift
//  Tabata Extreme
//
//  Created by Matthew Ehlers on 5/20/16.
//  Copyright © 2016 Matthew Ehlers. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let exerciseNames = ["PUSH-UPS", "SIT-UPS", "SQUATS", "V-SIT", "AIR BIKE", "MOUNTAIN CLIMBER", "LUNGE", "PLANK", "REVERSE CRUNCH"]
    
    let exercises = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

        // Do any additional setup after loading the view.
    }
    
    func setup() {
        
        for (var i = 0; i < 9; i += 1) {
            
            let exercise = Exercise()
            exercise.name = exerciseNames[i]
            
            exercises.addObject(exercise)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ExercisesTableViewCell", forIndexPath: indexPath) as! ExercisesTableViewCell
        tableView.backgroundColor = UIColor.clearColor()
//        tableView.backgroundView = UIImageView(image: UIImage(named: "PauseMenu.png"))
        cell.backgroundColor = UIColor.clearColor()
//        cell.textLabel?.text = myarray[indexPath.item]
//        let imageName = "RedGear"
//        let image = UIImage(named: imageName)
//        let newImage = resizeImage(image!, toTheSize: CGSizeMake(40, 40))
//        let cellImageLayer: CALayer? = cell.imageView!.layer
//        cellImageLayer!.cornerRadius = cellImageLayer!.frame.size.width / 2
//        cellImageLayer!.masksToBounds = true
//        cell.imageView!.image = newImage
        
        let exercise = exercises[indexPath.row] as! Exercise
        
        cell.configure(exercise)
        return cell
    }
    
    //called when user taps on any row
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // get the cell and text of the tapped row
        //let cell = tableView.cellForRowAtIndexPath(indexPath)
        //let text = cell!.textLabel?.text
        
        //var checkedSymptom:Bool
        
    }
    
    // In this case I returning 140.0. You can change this value depending of your cell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
//
//    // creates the look of separation between each cell
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        cell.contentView.backgroundColor = UIColor.clearColor()
//        
//        let whiteRoundedView : UIView = UIView(frame: CGRectMake(0, 10, self.view.frame.size.width, 120))
//        
//        whiteRoundedView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
//        whiteRoundedView.layer.masksToBounds = false
//        whiteRoundedView.layer.cornerRadius = 2.0
//        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
//        whiteRoundedView.layer.shadowOpacity = 0.2
//        
//        cell.contentView.addSubview(whiteRoundedView)
//        cell.contentView.sendSubviewToBack(whiteRoundedView)
//    }
//    
//    func resizeImage(image:UIImage, toTheSize size:CGSize) -> UIImage{
//        let scale = CGFloat(max(size.width/image.size.width, size.height/image.size.height))
//        let width:CGFloat = image.size.width * scale
//        let height:CGFloat = image.size.height * scale
//        
//        let rr:CGRect = CGRectMake(0, 0, width, height)
//        
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        image.drawInRect(rr)
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage
//    }


    
}
