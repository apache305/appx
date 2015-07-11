//
//  Chat.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
class Chat {
    
    //跟谁在聊天
    var chatUser :String
    //最后一条消息
    var chatLastMessage: String
    //最后一条消息的发送时间
    var chatLastTime: String
    //未读消息树目
    var chatUnReadMessages: Int
    
    //
    var chatUserImg: String
    
    //初始化
    init ( chatUser: String,
        chatLastMessage: String,
        chatLastTime: String,
        chatUnReadMessages: Int,
        chatUserImg: String
        )  {
            self.chatUser           = chatUser
            self.chatLastMessage    = chatLastMessage
            self.chatLastTime       = chatLastTime
            self.chatUnReadMessages = chatUnReadMessages
            self.chatUserImg        = chatUserImg
    }
    
    
    
    
    
}
