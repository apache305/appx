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
    //问题描述
    var questionBody : String
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
    //问题的头像。。。回头再改吧
    var questionUserImg: String
    
    
    //初始化函数
    init(questionTitle : String,
        questionBody :String,
        questionLocation: String,
        questionCreateTime: String,
        questionUser : String,
        questionReward: String,
        questionType: String,
        questionUserImg: String
        ) {
        self.questionTitle      = questionTitle
        self.questionBody       = questionBody
        self.questionLocation   = questionLocation
        self.questionCreateTime = questionCreateTime
        self.questionUser       = questionUser
        self.questionReward     = questionReward
        self.questionType       = questionType
        self.questionUserImg    = questionUserImg
    }
    
    //解开收到的json包
    class func questionWithJson(resultArray:NSArray)-> [Question] {
        //每次刷新收到的问题
        var receivedQuestions = [Question]()
        
        if resultArray.count > 0 {
            for result in resultArray {
                var questionTitle: String       = result["questionTitle"] as? String ?? ""
                var questionBody: String        = result["questionBody"] as? String ?? ""
                var questionLocation: String    = result["questionLocation"] as? String ?? ""
                var questionCreateTime: String  = result["questionCreateTime"] as? String ?? ""
                var questionUser : String       = result["questionUser"] as? String ?? ""
                var questionReward: String      = result["questionReward"] as? String ?? ""
                var questionType: String        = result["questionType"] as? String ?? ""
                
                var questionUserImg: String  =
                    result["questionUserImg"] as? String ?? ""
                
                
                //创建一个新问题
                var aQuestion = Question(
                    questionTitle: questionTitle,
                    questionBody: questionBody,
                    questionLocation: questionLocation,
                    questionCreateTime: questionCreateTime,
                    questionUser: questionUser,
                    questionReward: questionReward,
                    questionType: questionType,
                    questionUserImg: questionUserImg)
                receivedQuestions.append(aQuestion)
            }
        }
        return receivedQuestions
        
    }
    
    
    
    
    
    
    
    
    
}
