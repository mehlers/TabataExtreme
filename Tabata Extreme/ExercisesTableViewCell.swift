//
//  ExercisesTableViewCell.swift
//  Tabata Extreme
//
//  Created by Matthew Ehlers on 5/20/16.
//  Copyright © 2016 Matthew Ehlers. All rights reserved.
//

import UIKit

class ExercisesTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var checkbox: CheckBoxView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(exercise:Exercise) {
        
        if(exercise.isSelected) {
            self.checkbox!.markAsChecked()
        }
        else {
            self.checkbox!.markAsUnChecked()
        }
        
        self.name?.text = exercise.name
        
        self.checkbox?.checkBoxChanged = {
            
            if(!exercise.isSelected) {
                self.checkbox!.markAsChecked()
                exercise.isSelected = true
            }
            else {
                self.checkbox!.markAsUnChecked()
                exercise.isSelected = false
            }
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
