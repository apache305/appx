//
//  Question.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation

class Question {
    
    //问题标题
    var questionTitle : String
    //问题发出的位置
    var questionLocation: String
    //问题的创建时间
    var questionCreateTime: String
    //提问的用户
    var questionUser : String
    //问题的奖励
    var questionReward: String
    //问题的类型
    var questionType: String
    
    
    //初始化函数
    init(questionTitle : String,
        questionLocation: String,
        questionCreateTime: String,
        questionUser : String,
        questionReward: String,
        questionType: String
        ) {
        self.questionTitle      = questionTitle
        self.questionLocation   = questionLocation
        self.questionCreateTime = questionCreateTime
        self.questionUser       = questionUser
        self.questionReward     = questionReward
        self.questionType       = questionType
    }
    
    //解开收到的json包
    class func questionWithJson(resultArray:NSArray)-> [Question] {
        //每次刷新收到的问题
        var receivedQuestions = [Question]()
        
        if resultArray.count > 0 {
            for result in resultArray {
                var questionTitle: String       = result["questionTitle"] as? String ?? ""
                var questionLocation: String    = result["questionLocation"] as? String ?? ""
                var questionCreateTime: String  = result["questionCreateTime"] as? String ?? ""
                var questionUser : String       = result["questionUser"] as? String ?? ""
                var questionReward: String      = result["questionReward"] as? String ?? ""
                var questionType: String        = result["questionType"] as? String ?? ""
                
                
                //创建一个新问题
                var aQuestion = Question(
                    questionTitle: questionTitle,
                    questionLocation: questionLocation,
                    questionCreateTime: questionCreateTime,
                    questionUser: questionUser,
                    questionReward: questionReward,
                    questionType: questionType)
                receivedQuestions.append(aQuestion)
            }
        }
        return receivedQuestions
        
    }
    
    
    
    
    
    
    
    
    
}
