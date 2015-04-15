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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    
        
        
        //println("sender is \(sender)")
        var questionDetailNav = segue.destinationViewController as! UINavigationController
        var questionDetailViewController: QuestionDetailViewController = questionDetailNav.viewControllers.first as! QuestionDetailViewController
        var questionIndex = self.questions.indexPathForSelectedRow()?.row
        var selectedQuestion = self.questionTable[questionIndex!]
        questionDetailViewController.currentQuestion = selectedQuestion 
    }
    
    
    
    //初始化每一个表格的cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell") as! QuestionCell
        let question = self.questionTable[indexPath.row] as Question
        cell.questionTitle.text      = question.questionTitle
        cell.questionLocation.text   = question.questionLocation
        cell.questionCreateTime.text = question.questionCreateTime
        cell.questionUser.text       = question.questionUser        
        return cell
    }
    
    
    //给定表格的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionTable.count
    }
    
    
    //也许是为了储存一些数据
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var question = self.questionTable[indexPath.row] as Question
        println("did i work?")
        
    }
    
    
    func prepareForTest(){
    // 准备一些测试数据
        var q1:Question = Question(questionTitle: "我是一个标题1", questionLocation: "100米", questionCreateTime: "2015/15/04", questionUser: "王麻子", questionReward: "1分", questionType: "紧急")
        var q2:Question = Question(questionTitle: "我是一个标题2", questionLocation: "200米", questionCreateTime: "2015/14/04", questionUser: "李麻子", questionReward: "2分", questionType: "不紧急")
        var q3:Question = Question(questionTitle: "我是一个标题3", questionLocation: "300米", questionCreateTime: "2015/13/04", questionUser: "张麻子", questionReward: "3分", questionType: "非常紧急")
        var q4:Question = Question(questionTitle: "我是一个标题4", questionLocation: "400米", questionCreateTime: "2015/12/04", questionUser: "赵麻子", questionReward: "4分", questionType: "一般般")
        var q5:Question = Question(questionTitle: "我是一个标题5", questionLocation: "500米", questionCreateTime: "2015/11/04", questionUser: "钱麻子", questionReward: "5分", questionType: "捉急啊")
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
    
   
    
    
    //视图被载入要干的事  这个是本视图的入口
    override func viewDidLoad() {
        super.viewDidLoad()
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