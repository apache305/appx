//
//  MyViewController.swift
//  haoren
//

//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import UIKit

class MyViewController :UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var myTableContent :[(String,String)] = [(String,String)]()
    
    
    @IBOutlet weak var myName: UILabel!
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("meAboutCell") as! MeAboutCell
        //println(cell)
        var eachKeyValue = self.myTableContent[indexPath.row]
        //println(eachKeyValue.0 as String)
        cell.meAboutKey.text = eachKeyValue.0 as String
        cell.meAboutValue.text = eachKeyValue.1 as String
        //cell.chatUser.text        = eachChat.chatUser
        //cell.lastMessage.text     = eachChat.chatLastMessage
        //cell.lastMessageTime.text = eachChat.chatLastTime
        //println("did i run again")
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myTableContent.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 35
    }

    

    
    
    
    func prepareForTest(){
        
        var meabout :MeAbout = MeAbout(name:"王麻子", age:"22", sex:"爷们", homeCountry: "中国")
        self.myTableContent.append( "签名","就这样吧 你说呢")
        self.myTableContent.append("年龄是", meabout.age as String)
        self.myTableContent.append("性别呢？", meabout.sex as String)
        self.myTableContent.append("家乡在那里呀", meabout.homeCountry as String)

    }
    
    
    func initAppear(){
        
        self.myTableView.tableFooterView = UIView(frame: CGRectZero)
        self.myTableView.backgroundColor = UIColor.clearColor()
        self.myName.text = "王麻子"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAppear()
        self.prepareForTest()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        //println("i load subviews")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 76.0/255.0, green: 152/255.0, blue: 198/255.0, alpha: 1)
        
        //adjust tablevie
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    



}
