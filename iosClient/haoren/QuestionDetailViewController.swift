//
//  QuestionDetailViewController.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import Foundation
import UIKit
class QuestionDetailViewController: UIViewController {
    
    @IBOutlet weak var questionTitle: UILabel!
    
    var currentQuestion : Question?
    

    @IBOutlet weak var questionLocation: UILabel!
    @IBOutlet weak var questionCreateTime: UILabel!
    @IBOutlet weak var questionUser: UILabel!
    
    
    @IBOutlet weak var goBack: UIButton!
    
    
    
    func initQuestion(){
        self.questionTitle.text = currentQuestion?.questionTitle
        self.questionLocation.text = currentQuestion?.questionLocation
        self.questionCreateTime.text = currentQuestion?.questionCreateTime
        self.questionUser.text = currentQuestion?.questionUser
        
        //let backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        //self.navigationItem.leftBarButtonItem = backButton
        //self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!], forState: UIControlState.Normal)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //println("let me see who is the sender \(sender)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initQuestion()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}