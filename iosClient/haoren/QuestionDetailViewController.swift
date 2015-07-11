//
//  QuestionDetailViewController.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import UIKit
class QuestionDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var questionUserImageView: UIImageView!

    @IBOutlet weak var questionDetailTableView: UITableView!
    var tableContent:[MultiMedia] = [MultiMedia]()

    var currentQuestion : Question?
    
    @IBOutlet weak var buttonReply: UIButton!

    @IBOutlet weak var buttonUpVote: UIButton!
    @IBOutlet weak var buttonDownVote: UIButton!
    @IBOutlet weak var questionLocation: UILabel!
    @IBOutlet weak var questionCreateTime: UILabel!
    @IBOutlet weak var questionUser: UILabel!
    

    
    
    func initQuestion(){

        self.questionLocation.text = currentQuestion?.questionLocation
        self.questionCreateTime.text = currentQuestion?.questionCreateTime
        self.questionUser.text = currentQuestion?.questionUser
        self.questionUserImageView.image = UIImage(named: currentQuestion!.questionUserImg)
        
        let title:MultiMedia = MultiMedia()
        title.initWithValue(false, isLabel: true, isNeedLargeFontSize: true, text: self.currentQuestion?.questionTitle, imageName: nil)
        let body:MultiMedia = MultiMedia()
        body.initWithValue(false, isLabel: true, isNeedLargeFontSize: false, text: self.currentQuestion?.questionBody, imageName: nil)
       
        let image1:MultiMedia  = MultiMedia()
        //image1.initWithValue(true, isLabel: false, isNeedLargeFontSize: false, text: nil, imageName: "meinv")

        
        self.tableContent.append(title)
        self.tableContent.append(body)
        self.tableContent.append(image1)
        
        self.questionDetailTableView.tableFooterView = UIView(frame: CGRectZero)
        self.questionDetailTableView.backgroundColor = UIColor.clearColor()
        //self.questionDetailTableView.rowHeight = UITableViewAutomaticDimension
        //println("wtf+ \(self.self.questionDetailTableView.frame.size.width)")
        //self.questionDetailTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)  //满屏幕的。
        //println( self.questionDetailTableView.frame)

        
        
        
        
        //let backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        //self.navigationItem.leftBarButtonItem = backButton
        //self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!], forState: UIControlState.Normal)
        
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var eachMultiMedia = self.tableContent[indexPath.row]
        if(eachMultiMedia.isLabel){
            //compute height
            let label:UILabel = UILabel(frame: CGRectMake(0, 0, self.questionDetailTableView.frame.width-40, CGFloat.max))
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.ByWordWrapping
            if (eachMultiMedia.isNeedLargeFontSize){
                label.font = UIFont.systemFontOfSize(24)

            }else{
                label.font = UIFont.systemFontOfSize(18)

            }
            label.text = eachMultiMedia.text
            
            label.sizeToFit()
            
            return label.frame.height+20
        }
        else if(eachMultiMedia.isImage){
            //fix height
            return 200
        }else{
            return 300
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let a = MultiMediaCell()
        //return a
        
        let cellIdentifier = NSStringFromClass(MultiMedia)
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MultiMediaCell!
        //var cell = MultiMediaCell
        var eachMultiMedia = self.tableContent[indexPath.row]
        
        if cell == nil{
            cell = MultiMediaCell (style: .Default, reuseIdentifier: cellIdentifier)
        }
        //if (eachMultiMedia.isLabel  && )

        
        
        //println(cell.frame)
        

        cell.configureWithContent(eachMultiMedia)
        
        //cell.frame = CGRectMake(0, 0, self.questionDetailTableView.frame.size.width-10, 44)
        //cell.contentView.frame = CGRectMake(0, 0, self.questionDetailTableView.frame.size.width-10, 44)

        
        println(cell.frame)
        println(self.questionDetailTableView.frame)
        println(cell.contentView.frame)
        println(cell.cellLabel.frame)

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableContent.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //println("let me see who is the sender \(sender)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initQuestion()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    

    override func viewDidLayoutSubviews() {
        println("QuestionDetailView load subviews")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 76.0/255.0, green: 152/255.0, blue: 198/255.0, alpha: 1)
        
        
    
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