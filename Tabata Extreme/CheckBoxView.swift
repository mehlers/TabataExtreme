//
//  CheckBoxView.swift
//  Tabata Extreme
//
//  Created by Matthew Ehlers on 5/20/16.
//  Copyright © 2016 Matthew Ehlers. All rights reserved.
//

import UIKit

class CheckBoxView: UIView {

    var isChecked:Bool
    var checkBoxImageView:UIImageView
    var checkBoxChanged :() -> () = { }
    
    required init(coder aDecoder: NSCoder) {
        
        self.isChecked = false
        self.checkBoxImageView = UIImageView(image: nil)
        
        super.init(coder: aDecoder)!
        
        setup()
    }
    
    func setup() {
        
        // make a border
        self.layer.borderWidth = 1.0
        self.userInteractionEnabled = true
        
        self.checkBoxImageView.frame = CGRectMake(2, 2, 25, 25)
        self.addSubview(self.checkBoxImageView)
        
        let selector:Selector = #selector(CheckBoxView.checkBoxTapped)
        
        //register tab recognizers
        let tapRecognizer = UITapGestureRecognizer(target: self, action: selector)
        
        self.addGestureRecognizer(tapRecognizer)
    }
    
    func checkBoxTapped() {
        
        self.checkBoxChanged()
    }
    
    func markAsChecked() {
        
        self.checkBoxImageView.image = UIImage(named: "small-check")
    }
    
    func markAsUnChecked() {
        
        self.checkBoxImageView.image = nil
    }
    
}
