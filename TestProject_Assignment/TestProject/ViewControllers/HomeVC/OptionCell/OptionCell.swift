//
//  OptionCell.swift
//  TestProject
//
//  Created by Vinod on 28/04/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {

    //Use for show option
    @IBOutlet weak var optionLbl: UILabel!
    
    //Use for show readio buttion
    @IBOutlet weak var optionSelectedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.selectionStyle = .none
    }
    
    /**
     * Function to use get Height of cell
     * @param None
     * @return : Height of cell
     **/
    class func getCellHeight() -> CGFloat {
        return 40.0
    }
    
    /**
     * Function to use to update Ui
     * @param indexPath index path
     * @param userMdl:  user Model object
     * @return none
     **/
    func updateUI(indexPath:IndexPath, optionMdl:Option?,isSubmited:Bool) {
        self.setDefaultData()
        guard let option = optionMdl else {
            return
        }
        
        if let optionName = option.optionName {
            self.optionLbl.text = optionName
        }
        
        if option.isSelectedAnswer == true {
            self.optionSelectedImageView.image = UIImage(named: "quotation_screen_selected_icon")
            self.backgroundColor = Colors.selectedCellColorBackgroundColor
        }
        
        if isSubmited == true {
            if option.isSelectedAnswer == true, option.isCorrectAnswer == true {
                self.backgroundColor = UIColor.green
            } else if option.isSelectedAnswer == true {
                self.backgroundColor = UIColor.red
            } else {
                self.backgroundColor = UIColor.white
            }
        }
        
    }
    
    // Set default data for every cell
    func setDefaultData() {
        self.backgroundColor = UIColor.white
        self.optionSelectedImageView.image = UIImage(named: "quotation_screen_unselected_icon")
        self.optionLbl.text = ""
    }
    
}
