//
//  MessageViewController.swift
//  haoren
//

//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import UIKit
class MessageViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    var messageTable :[Message] = [Message]()
    
    
    @IBOutlet weak var messageTableView: UITableView!
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell") as! MessageCell
        var eachMessage = self.messageTable[indexPath.row]
        
        if eachMessage.messageIsMe {
            cell.textLabel?.textAlignment = .Left
            cell.textLabel?.textColor = UIColor.blueColor()
            //println("???")
        } else {
            cell.textLabel?.textAlignment = .Left
            cell.textLabel?.textColor = UIColor.grayColor()
        }
        cell.textLabel?.text = eachMessage.messageBody
        
        //println("did i run again")
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageTable.count
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func prepareForTest(){
        
        var message1:Message = Message(messageBody: "你在干嘛呢", messageFrom: "王麻子", messageIsMe: true)
        var message2:Message = Message(messageBody: "我刚吃过饭", messageFrom: "李麻子", messageIsMe: false)
        var message3:Message = Message(messageBody: "你呢",      messageFrom: "李麻子", messageIsMe: false)
        var message4:Message = Message(messageBody: "我刚从驾校回来", messageFrom: "王麻子", messageIsMe: true)
        var message5:Message = Message(messageBody: "怎么样", messageFrom: "李麻子", messageIsMe: false)
        var message6:Message = Message(messageBody: "我了个去啊 不想学了", messageFrom: "王麻子", messageIsMe: true)
        var message7:Message = Message(messageBody: "怎么了", messageFrom: "李麻子", messageIsMe: false)
        var message8:Message = Message(messageBody: "开的太烂了呗", messageFrom: "王麻子", messageIsMe: true)

        
        self.messageTable.append(message1)
        self.messageTable.append(message2)
        self.messageTable.append(message3)
        self.messageTable.append(message4)
        self.messageTable.append(message5)
        self.messageTable.append(message6)
        self.messageTable.append(message7)
        self.messageTable.append(message8)
        
        
        //self.messageTableView.frame.width =
        
        
        
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