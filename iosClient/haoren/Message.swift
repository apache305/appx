//
//  Message.swift
//  haoren
//

//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
class Message {
    
    var messageBody :String
    var messageFrom :String
    var messageIsMe :Bool
    
    init(messageBody:String,
         messageFrom: String,
         messageIsMe: Bool)
    {
        self.messageBody = messageBody
        self.messageFrom = messageFrom
        self.messageIsMe = messageIsMe
    }
    
    
    
}