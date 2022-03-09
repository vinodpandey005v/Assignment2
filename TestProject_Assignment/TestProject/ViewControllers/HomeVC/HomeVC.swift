//
//  HomeVC.swift
//  TestProject
//
//  Created by Vinod on 28/04/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: - Outlets
    
    // Show data into tableView
    @IBOutlet weak var questionTableView: UITableView!
    
    // Submit buttion 
    @IBOutlet weak var submitButtion: UIButton!
    
    //MARK: - Variables
    
    //Use to store recive data model
    var questionArray: [Question]?
    var isSubmit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.getQuestionDataFromDataBase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func submitButtionAction(_ sender: Any) {
        
        guard let question = self.questionArray  else {
            return
        }
        
        if self.isSubmit == true {
            self.isSubmit = false
            for item in question {
                if let optionArray = item.optionMdlArray {
                    for option in optionArray {
                        option.isSelectedAnswer = false
                    }
                }
                
            }
            self.submitButtion.setTitle("SUBMIT", for: .normal)
        } else {
            self.submitButtion.setTitle("RETRY", for: .normal)
            self.isSubmit = true
        }
        self.questionTableView.reloadData()
    }
    func getQuestionDataFromDataBase() {
        
        self.title = "Test"
        // fatch Data from database
        self.questionArray = CoreDataBL.sharedCoreDataBL.fetchquestionsFromDataBase()
        
        if let queston = questionArray,  queston.count > 0 {
        } else {
            HardCodedModel().saveHardCodedQuestionOptionIntoDataBase()
            self.questionArray = CoreDataBL.sharedCoreDataBL.fetchquestionsFromDataBase()
        }
        for item in self.questionArray! {
            item.optionMdlArray = CoreDataBL.sharedCoreDataBL.fetchOptionsFromDataBase(questionId: item.questionId)
        }
        self.registerCells()
    }
    /**
     * Function use to register cells in tableview
     * @param none
     * @return none
     **/
    func registerCells() {
        self.questionTableView.register(UINib(nibName: "OptionCell", bundle: nil), forCellReuseIdentifier: "OptionCell")
        self.questionTableView.register(UINib(nibName: "CorrectCell", bundle: nil), forCellReuseIdentifier: "CorrectCell")
        
        self.questionTableView.register(UINib(nibName: "QuestionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "QuestionHeaderView")
        
        self.questionTableView.delegate = self
        self.questionTableView.dataSource = self
        self.questionTableView.reloadData()
    }

}

// MARK: - UITableView Delegate and datasource Methods
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        if let question = self.questionArray  {
            return question.count
        }
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        guard let question = self.questionArray else {
            return 0
        }
        
        if let options = question[section].optionMdlArray {
            if self.isSubmit == true {
                return options.count + 1
            }
            return options.count
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell") as! OptionCell
            
            guard let question = self.questionArray else {
                return cell
            }
            if let options = question[indexPath.section].optionMdlArray {
                if indexPath.row < options.count {
                    let optionModel = options[indexPath.row]
                    cell.updateUI(indexPath: indexPath, optionMdl: optionModel, isSubmited: self.isSubmit)
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectCell") as! CorrectCell
                    
                    for item in options {
                        if item.isCorrectAnswer == true {
                            cell.updateUI(indexPath: indexPath, optionMdl: item)
                            break
                        }
                    }
                    return cell
                }
            }
            return cell
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OptionCell.getCellHeight()
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tableHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "QuestionHeaderView") as! QuestionHeaderView
        if let question = self.questionArray {
            tableHeaderView.updateUI(section:section, question: question[section])
        }
        return tableHeaderView
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return QuestionHeaderView.getHeaderHeight()
    }
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let question = self.questionArray else {
            return
        }
        
        // In Retry mode
        if self.isSubmit == false {
            if let options = question[indexPath.section].optionMdlArray {
                for item in options {
                    if item.isSelectedAnswer == true {
                         item.isSelectedAnswer = false
                        break
                    }
                }
                let option = options[indexPath.row]
                option.isSelectedAnswer = true
                self.questionTableView.reloadData()
            }
        }
    }
}




