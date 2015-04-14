//
//  ApiController.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
protocol APIControllerProtocol{
    func didReceiveAPIResults(results : NSDictionary)
}

class APIController{
    
    var delegate : APIControllerProtocol
    init(delegate : APIControllerProtocol){
        self.delegate=delegate
        
    }
    
    func get(path:String){
        //let uri = NSURL(string : path)
        let url = NSURL(string:path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler:
            {data, response, error -> Void in
                println("task finished")
                if error != nil {
                    println(error.localizedDescription)
                }
                var err: NSError?
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
                if(err != nil){
                    print("JSON ERROR\(err!.localizedDescription)")
                }
                let results: NSArray = jsonResult["results"] as NSArray
                //println(results)
                self.delegate.didReceiveAPIResults(jsonResult)
                //dispatch_async(dispatch_get_main_queue(), {self.tableData=results; self.myTableView!.reloadData()})
        })
        task.resume()
        
    }
    
    func lookupAlbum(collectionId: Int) {
        self.get("https://itunes.apple.com/lookup?id=\(collectionId)&entity=song")
        
    }
    
    
    
    
    func searchResultFor(searchTerm : String){
        
        let urlPath = "http://localhost:3030/users"
        self.get(urlPath)
        
        
        
    }
    
    
    
    
}
