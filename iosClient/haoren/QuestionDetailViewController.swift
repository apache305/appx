//
//  QuestionDetailViewController.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import UIKit
class QuestionDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var questionTitle: UILabel!
    
    @IBOutlet weak var questionUserImageView: UIImageView!
    @IBOutlet weak var questionDetailTableView: UITableView!
    var currentQuestion : Question?
    var questionDetailTable: [QuestionDetail] = [QuestionDetail] ()
    
    @IBOutlet weak var buttonReply: UIButton!

    @IBOutlet weak var buttonUpVote: UIButton!
    @IBOutlet weak var buttonDownVote: UIButton!
    @IBOutlet weak var questionLocation: UILabel!
    @IBOutlet weak var questionCreateTime: UILabel!
    @IBOutlet weak var questionUser: UILabel!
    

    
    
    func initQuestion(){
        self.questionTitle.text = currentQuestion?.questionTitle
        self.questionTitle.numberOfLines=0
        self.questionTitle.lineBreakMode = .ByWordWrapping
        self.questionLocation.text = currentQuestion?.questionLocation
        self.questionCreateTime.text = currentQuestion?.questionCreateTime
        self.questionUser.text = currentQuestion?.questionUser
        self.questionUserImageView.image = UIImage(named: "meinv")
        
        
        
        
        //let backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        //self.navigationItem.leftBarButtonItem = backButton
        //self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!], forState: UIControlState.Normal)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //println("let me see who is the sender \(sender)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAppear()
        self.initQuestion()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionDetailTable.count
    
    
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
        
    }
    
    
    
    
    func initAppear() {

        //these lines are used to remove empty seperator liens.
        self.questionDetailTableView.tableFooterView = UIView(frame: CGRectZero)
        self.questionDetailTableView.backgroundColor = UIColor.clearColor()
        //println("wtf+ \(self.questionDetailTableView.frame.size.width)")
        
        
    }
    override func viewDidLayoutSubviews() {
        println("QuestionDetailView load subviews")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 76.0/255.0, green: 152/255.0, blue: 198/255.0, alpha: 1)
        
        //adjust tablevie
        self.questionDetailTableView.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
    //确定是这样么？？貌似这样好使。。直接在转场的时候设定
    /*override func viewWillDisappear(animated: Bool) {
        //self.tabBarController?.tabBar.hidden = false
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}