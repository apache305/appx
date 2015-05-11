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
        //self configured cell
        let cellIdentifier = NSStringFromClass(MessageCell)
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MessageCell!
        //let cell = tableView.dequeueReusableCellWithIdentifier("messageCell") as! //MessageCell
        var eachMessage = self.messageTable[indexPath.row]
        println(cell)
        if cell == nil {
            cell = MessageCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        cell.configureWithMessage(eachMessage)
        
        /*if eachMessage.messageIsMe {
            cell.textLabel?.textAlignment = .Left
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.backgroundColor = UIColor.whiteColor()
            //println("???")
        } else {
            cell.textLabel?.textAlignment = .Right
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.backgroundColor = UIColor.greenColor()

        }
        cell.textLabel?.text = eachMessage.messageBody
        //will change this to auto setting height
        cell.frame = CGRectMake(0, 0, self.messageTableView.frame.size.width, 44);//
        //println("did i run again")*/
        
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
    override func viewDidLayoutSubviews() {
        println("i load subviews")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 76.0/255.0, green: 152/255.0, blue: 198/255.0, alpha: 1)
        
        //adjust tablevie
        self.messageTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
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