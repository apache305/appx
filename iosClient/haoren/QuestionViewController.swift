//
//  QuestionViewController.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import UIKit
class QuestionViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, APIControllerProtocol {
    //变量
    
    //用于展示问题的表格视图
    @IBOutlet weak var questions: UITableView!
    
    
    //收到的问题的表格
    var questionTable :[Question]  = [Question] ()
    
    //网络连接类
    var api : APIController?
    
    
    
    
    //本页面作为代理收到数据后所需要做的处理 只有这一种类型的请求么？明显不是啊
    func didReceiveAPIResults(results: NSDictionary) {
        var resultArray: NSArray = results["results"] as! NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.questionTable = Question.questionWithJson(resultArray)
            self.questions!.reloadData()
            }
        )
        
    }
    
    
    //这个是转场过渡的时候传递数据用的
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    
        
        
        //println("sender is \(sender)")
        var questionDetailNav = segue.destinationViewController as! UINavigationController
        var questionDetailViewController: QuestionDetailViewController = questionDetailNav.viewControllers.first as! QuestionDetailViewController
        var questionIndex = self.questions.indexPathForSelectedRow()?.row
        var selectedQuestion = self.questionTable[questionIndex!]
        questionDetailViewController.currentQuestion = selectedQuestion
        questionDetailNav.hidesBottomBarWhenPushed = true
        //questionDetailViewController.hidesBottomBarWhenPushed = true
        //questionDetailViewController.hidesBottomBarWhenPushed = true
    }
    
    
    
    //初始化每一个表格的cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell") as! QuestionCell
        let question = self.questionTable[indexPath.row] as Question
        cell.questionTitle.text      = question.questionTitle
        cell.questionLocation.text   = question.questionLocation
        cell.questionCreateTime.text = question.questionCreateTime
        cell.questionBody.text       = question.questionBody
        cell.questionBody.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
        cell.questionBody.numberOfLines = 0
        cell.questionUserImage.image = UIImage(named: question.questionUserImg)
        cell.questionUserImage.layer.cornerRadius = cell.questionUserImage.frame.size.width / 10.0  //
        cell.questionUserImage.clipsToBounds = true

        //tuning cell's width
        //cell.frame = CGRectMake(0, 0, self.questions.frame.size.width, 60);
        //println(cell.contentView.frame)
        //println(cell.frame)
        

        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0;
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if tableView.respondsToSelector(Selector("setSeparatorInset:")){
            tableView.separatorInset = UIEdgeInsetsZero
        }
        if tableView.respondsToSelector(Selector("setLayoutMargins:")){
            tableView.layoutMargins = UIEdgeInsetsZero
        }
        if cell.respondsToSelector(Selector("setLayoutMargins:")){
            cell.layoutMargins = UIEdgeInsetsZero
        }
        
    }
    
    
    //给定表格的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionTable.count
    }
    
    
    //也许是为了储存一些数据 但是看起来没有用到
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var question = self.questionTable[indexPath.row] as Question
        println("did i work?")
        
    }
    
    
    func prepareForTest(){
        
        
        
        
        
    // 准备一些测试数据
        var q1:Question = Question(questionTitle: "中华大厦附近公交站", questionBody: "我现在在中华大厦，要去机场，附近的11路公交车站点在哪里，急！！在线等。。", questionLocation: "100m", questionCreateTime: "2015/01/03", questionUser: "大地", questionReward: "10分", questionType: "紧急", questionUserImg: "1.png")
        var q2:Question = Question(questionTitle: "板蓝根冲剂", questionBody: "焦化市场附近哪个药店有卖板蓝根的？谢谢", questionLocation: "200米", questionCreateTime: "2015/14/04", questionUser: "tom", questionReward: "2分", questionType: "不紧急", questionUserImg: "2.png")
        var q3:Question = Question(questionTitle: "寻狗狗！黑色哈士奇", questionBody: "今天（3号）早上在中心公园散步，不小心把狗狗弄丢了，黑色哈士奇，很大，后背上有一小块白色的毛。有新看见的话请速与我联系，158 1234 5434, 有重谢。", questionLocation: "300米", questionCreateTime: "2015/13/04", questionUser: "绿精灵", questionReward: "3分", questionType: "非常紧急", questionUserImg: "3.jpg")
        var q4:Question = Question(questionTitle: "市中心出售自行车一辆", questionBody: "一辆年初新买的山地自行车，9成新，因为要搬家，所以转让，7折转让，感兴趣私聊。", questionLocation: "400米", questionCreateTime: "2015/12/05", questionUser: "jack", questionReward: "15分", questionType: "一般般", questionUserImg: "5.png")
        var q5:Question = Question(questionTitle: "夏威夷餐厅开门时间", questionBody: "谁知道夏威夷餐厅周日开不开门啊？", questionLocation: "500米", questionCreateTime: "2015/11/04", questionUser: "钱麻子", questionReward: "5分", questionType: "捉急啊", questionUserImg: "6.jpg")
        self.questionTable.append(q1)
        self.questionTable.append(q2)
        self.questionTable.append(q3)
        self.questionTable.append(q4)
        self.questionTable.append(q5)
        
    
    }
    
    //这个2b方法是用来返回到这里的。
    //@IBAction func cancelToQuestionViewController(segue:UIStoryboardSegue) {
       // println("does this fk run??")
    //}
    
    
    func initAppear() {
        
        
        //these lines are used to remove empty seperator liens.
        self.questions.tableFooterView = UIView(frame: CGRectZero)
        self.questions.backgroundColor = UIColor.clearColor()
        //self.questions.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)

        println("wtf+ \(self.questions.frame.size.width)")
               
    
    }
    
    override func viewDidLayoutSubviews() {
        //println("i load subviews")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 76.0/255.0, green: 152/255.0, blue: 198/255.0, alpha: 1)
        
        //adjust tablevie
    }
   
    
    
    //视图被载入要干的事  这个是本视图的入口 这个只会运行一遍  viewDidAppear 会运行两遍
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAppear()
        self.prepareForTest()
        
        println("test1")
        //初始化网络连接库
        self.api = APIController(delegate: self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //je ne sais pas...
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}