//
//  CoreDataBL.swift
//  TestProject
//
//  Created by Vinod on 28/04/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit
import CoreData

class CoreDataBL: NSObject {

    //MARK: -  Variable
    
    // Create singleton class object
    static let sharedCoreDataBL = CoreDataBL()
    
    //MARK: -  Variable
    private override init() {
        super.init()
    }
    
    
    func getManageObject(entityName:String)  -> (NSManagedObject,NSManagedObjectContext)? {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return nil
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: entityName,
                                       in: managedContext)!
        
        let manageObj = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
        return (manageObj,managedContext)
        
    }
    /**
     * Function use to save data into core database
     * @param optionId: option id
     * @param optionName: option name
     * @param isCorrectAnswer: correct answer or not flag
     * @return none
     **/
    func saveOption(optionId: Int16,optionName:String,isCorrectAnswer:Bool,questionId:Int16){
        
        guard let dataBaseObj =
            self.getManageObject(entityName:"Option" ) else {
                return
        }
        
         let managedContext = dataBaseObj.1
        let option = dataBaseObj.0
        
        // 3
        option.setValue(optionId, forKeyPath: "optionId")
        option.setValue(questionId, forKeyPath: "questionId")
        option.setValue(optionName, forKeyPath: "optionName")
        option.setValue(isCorrectAnswer, forKeyPath: "isCorrectAnswer")
        
        do {
            // 4
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    /**
     * Function use to save data into core database
     * @param questionId: question id
     * @param questionName: question name
     * @param optionData: option model array
     * @return none
     **/
    func saveQuestion(questionId: Int16,questionName:String) {
        
        guard let dataBaseObj =
            self.getManageObject(entityName:"Question" ) else {
                return
        }
        
        let managedContext = dataBaseObj.1
        let question = dataBaseObj.0
        
        // 3
        question.setValue(questionId, forKeyPath: "questionId")
        question.setValue(questionName, forKeyPath: "questionName")

        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    /**
     * Function use to get all questions
     * @param none
     * @return none
     **/
    func fetchquestionsFromDataBase() -> [Question]? {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return nil
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        //var request = NSFetchRequest<NSFetchRequestResult>()
        let fetchRequest:NSFetchRequest<Question> = Question.fetchRequest()
        
        
        var questionObjArray:[Question] = []
        
        // 4 Fetch API call
        do{
            questionObjArray =  try managedContext.fetch(fetchRequest)
            return questionObjArray
        } catch {
            return nil
        }
    }
    
    /**
     * Function use to get all questions
     * @param none
     * @return none
     **/
    func fetchOptionsFromDataBase(questionId:Int16) -> [Option]? {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return nil
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        //var request = NSFetchRequest<NSFetchRequestResult>()
        let fetchRequest:NSFetchRequest<Option> = Option.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "questionId = %d",questionId)

        
        var option:[Option] = []
        
        // 4 Fetch API call
        do{
            option =  try managedContext.fetch(fetchRequest)
            return option
        } catch {
            return nil
        }
    }
}
