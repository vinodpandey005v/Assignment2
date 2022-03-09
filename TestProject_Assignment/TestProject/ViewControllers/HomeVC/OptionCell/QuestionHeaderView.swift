//
//  QuestionHeaderView.swift
//  TestProject
//
//  Created by Vinod on 28/04/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class QuestionHeaderView: UITableViewHeaderFooterView {

    //Use for show option
    @IBOutlet weak var questionNumberLbl: UILabel!
    
    //Use for Question
    @IBOutlet weak var questionLbl: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    /**
     * Function to use get Height of Header
     * @param None
     * @return : Height of Header
     **/
    class func getHeaderHeight() -> CGFloat {
        return 60.0
    }
    
    /**
     * Function to use to update Ui
     * @param indexPath index path
     * @param question:  question Model object
     * @return none
     **/
    func updateUI(section:Int, question:Question?) {
        self.setDefaultData()
        guard let questionMdl = question else {
            return
        }
        if let questionName = questionMdl.questionName {
            self.questionLbl.text = questionName
        }
        self.questionNumberLbl.text = "\(section + 1)."
//        self.backgroundColor = UIColor.lightGray
    }
    
    // Set default data for every cell
    func setDefaultData() {
        self.questionNumberLbl.text = ""
        self.questionLbl.text = ""
    }

}
