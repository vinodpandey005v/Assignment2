//
//  CorrectCell.swift
//  TestProject
//
//  Created by Vinod on 28/04/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class CorrectCell: UITableViewCell {

    //Use for show option
    @IBOutlet weak var correctOptionLbl: UILabel!
    
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
    func updateUI(indexPath:IndexPath, optionMdl:Option?) {
        
        self.correctOptionLbl.text = "Corect Answer: " 
        
        guard let option = optionMdl else {
            return
        }
        
        if let optionName = option.optionName {
            self.correctOptionLbl.text = "Corect Answer: " + optionName
        }
    }
    
}
