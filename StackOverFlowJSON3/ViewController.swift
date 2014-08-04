//
//  ViewController.swift
//  StackOverFlowJSON3
//
//  Created by Victor  Adu on 7/30/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit


import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    var questions : [Question]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44      //'estimatedRowHeight' is recommended but not required
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let networkController = NetworkController()
        
        networkController.fetchQuestionsForSearchTerm("Swift", callback: {(questions : [Question]?, errorDescription : String?) -> Void in
            
            if errorDescription {
                //alert the user of an error
                println(errorDescription)
                //callback(questions: nil, errorDescription: "Hey sorry! try again next time"). We could use UIAlertController here also.
            }
            else {
                //put it back on main thread
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.questions = questions
                    self.tableView.reloadData()
                }
            }
            })
    }
    
    //MARK: UITableDatasource
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.questions {
            return self.questions!.count }
        return 0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as CellForQuestion
        let question = self.questions![indexPath.row] as Question
        cell.textView.scrollEnabled = false
        cell.textView.text = question.title
        return cell
    }
    
}



