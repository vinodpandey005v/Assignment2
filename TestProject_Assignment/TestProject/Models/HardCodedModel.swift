//
//  HardCodedModel.swift
//  TestProject
//
//  Created by Vinod on 28/04/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class HardCodedModel: NSObject {

    override init() {
         super.init()
    }
    
    // Save harcoded questions and option in coredatabase
    
    func saveHardCodedQuestionOptionIntoDataBase() {
        for index in 1...10 {
            
            var qName = ""
            if index == 1 {
                qName = "Who is PM of India?"
                for optionIndex in 1...4 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "Amit shah"
                    } else if optionIndex == 2 {
                        oName = "Narender Modi"
                        correctAnswer = true
                    } else if optionIndex == 3 {
                        oName = "Rahul Gandhi"
                    } else if optionIndex == 4 {
                        oName = "Rajnath"
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
                
            } else if index == 2 {
                qName = "Who is first PM of India?"
                for optionIndex in 1...4 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "Indra gandhi"
                    } else if optionIndex == 2 {
                        oName = "Mahatama gandi"
                    } else if optionIndex == 3 {
                        oName = "Soniya gandi"
                    } else if optionIndex == 4 {
                        oName = "Nehru"
                        correctAnswer = true
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else if index == 3 {
                qName = "Where is capital of India?"
                for optionIndex in 1...4 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "New delhi"
                        correctAnswer = true
                    } else if optionIndex == 2 {
                        oName = "Mumbai"
                    } else if optionIndex == 3 {
                        oName = "Kolkota"
                    } else if optionIndex == 4 {
                        oName = "Patna"
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else if index == 4 {
                qName = "Independent day fo India?"
                for optionIndex in 1...3 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "26 Jan"
                    } else if optionIndex == 2 {
                        oName = "15 August"
                        correctAnswer = true
                    } else if optionIndex == 3 {
                        oName = "1 Octuber"
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else if index == 5 {
                qName = "Apple supported language?"
                for optionIndex in 1...4 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "PHP"
                    } else if optionIndex == 2 {
                        oName = "JAVA"
                    } else if optionIndex == 3 {
                        oName = "Node"
                    } else if optionIndex == 4 {
                        oName = "Swift"
                        correctAnswer = true
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else if index == 6 {
                qName = "Which language is international language?"
                for optionIndex in 1...4 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "Hindi"
                    } else if optionIndex == 2 {
                        oName = "English"
                        correctAnswer = true
                    } else if optionIndex == 3 {
                        oName = "Nepali"
                    } else if optionIndex == 4 {
                        oName = "Urdhu"
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else if index == 7 {
                qName = "2 + 2 / 2 = ?"
                for optionIndex in 1...4 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "3"
                        correctAnswer = true
                    } else if optionIndex == 2 {
                        oName = "2"
                    } else if optionIndex == 3 {
                        oName = "1"
                    } else if optionIndex == 4 {
                        oName = "4"
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else if index == 8 {
                qName = "Which is leap year ?"
                for optionIndex in 1...5 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "1900"
                    } else if optionIndex == 2 {
                        oName = "1904"
                        correctAnswer = true
                    } else if optionIndex == 3 {
                        oName = "1905"
                    } else if optionIndex == 4 {
                        oName = "1905"
                    }else if optionIndex == 5 {
                        oName = "1906"
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else if index == 9 {
                qName = "Light is unit of ?"
                for optionIndex in 1...2 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "Distance"
                        correctAnswer = true
                    } else if optionIndex == 2 {
                        oName = "Light"
                    }
                     CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else if index == 10 {
                qName = "Which is layer of TCP protocol?"
                for optionIndex in 1...4 {
                    var oName = ""
                    var correctAnswer = false
                    if optionIndex == 1 {
                        oName = "Network"
                        correctAnswer = true
                    } else if optionIndex == 2 {
                        oName = "LAN"
                    } else if optionIndex == 3 {
                        oName = "MAN"
                    } else if optionIndex == 4 {
                        oName = "All of above"
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            } else {
                qName = "Question \(index)"
                
                for optionIndex in 1...4 {
                    let oName = "Option \(optionIndex)"
                    var correctAnswer = false
                    if optionIndex == 3 {
                        correctAnswer = true
                    }
                    CoreDataBL.sharedCoreDataBL.saveOption(optionId: (Int16((index * 10) + optionIndex)), optionName: oName, isCorrectAnswer: correctAnswer, questionId: Int16(index))
                }
            }
            CoreDataBL.sharedCoreDataBL.saveQuestion(questionId: Int16(index), questionName: qName)
        }
    }
}
