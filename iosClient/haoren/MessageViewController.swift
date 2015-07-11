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
        
        //println(cell)
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
        
        var message1:Message = Message(messageBody: "不开，只有周二到周六", messageFrom: "tom", messageIsMe: false)
        var message2:Message = Message(messageBody: "这样啊，谢谢", messageFrom: "Charlie陈", messageIsMe: true)
        var message3:Message = Message(messageBody: "那你知道附近还有么",      messageFrom: "Charlie陈", messageIsMe: true)
        var message4:Message = Message(messageBody: "你是想找西餐吗", messageFrom: "tom", messageIsMe: false)
        var message5:Message = Message(messageBody: "是的", messageFrom: "Charlie陈", messageIsMe: true)
        var message6:Message = Message(messageBody: "我去过一个叫做Chez Pierre", messageFrom: "tom", messageIsMe: false)
        var message7:Message = Message(messageBody: "好像就在旁边", messageFrom: "tom", messageIsMe: false)
        var message8:Message = Message(messageBody: "周日开吗", messageFrom: "Charlie陈", messageIsMe: true)
        var message9:Message = Message(messageBody: "我上次去的时候就是周末", messageFrom: "tom", messageIsMe: false)

        
        self.messageTable.append(message1)
        self.messageTable.append(message2)
        self.messageTable.append(message3)
        self.messageTable.append(message4)
        self.messageTable.append(message5)
        self.messageTable.append(message6)
        self.messageTable.append(message7)
        self.messageTable.append(message8)
        self.messageTable.append(message9)
        
        
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