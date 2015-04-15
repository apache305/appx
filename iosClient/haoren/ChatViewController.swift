//
//  ChatViewController.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import UIKit
class ChatViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    var chatTable :[Chat] = [Chat]()
    
    @IBOutlet weak var chatTableView: UITableView!
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("chatCell") as! ChatCell
        var eachChat = self.chatTable[indexPath.row]
        cell.chatUser.text        = eachChat.chatUser
        cell.lastMessage.text     = eachChat.chatLastMessage
        cell.lastMessageTime.text = eachChat.chatLastTime
        //println("did i run again")
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatTable.count
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func prepareForTest(){
        
        var chat1:Chat = Chat(chatUser: "王麻子", chatLastMessage: "你吃饭了没", chatLastTime: "10:30", chatUnReadMessages: 0)
        var chat2:Chat = Chat(chatUser: "李麻子", chatLastMessage: "你在干啥呢", chatLastTime: "11:30", chatUnReadMessages: 1)
        var chat3:Chat = Chat(chatUser: "陈麻子", chatLastMessage: "你有几个麻子", chatLastTime: "12:30", chatUnReadMessages: 2)
        
        self.chatTable.append(chat1)
        self.chatTable.append(chat2)
        self.chatTable.append(chat3)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareForTest()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}