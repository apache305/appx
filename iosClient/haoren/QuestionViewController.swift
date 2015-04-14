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
        var resultArray: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.questionTable = Question.questionWithJson(resultArray)
            self.questions!.reloadData()
            }
        )
        
    }
    
    
    
    //初始化每一个表格的cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell") as QuestionCell
        let question = self.questionTable[indexPath.row] as Question
        
        
        
        
        
        
        
        
        
        return cell
    }
    
    
    //给定表格的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionTable.count
    }
    
    
    
    
    //视图被载入要干的事  这个是本视图的入口
    override func viewDidLoad() {
        super.viewDidLoad()
        
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