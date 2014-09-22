//
//  AchievementsListViewController.swift
//  Achieve.MeCoreData
//
//  Created by Jeff Gayle on 9/4/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class AchievementsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
    var storedAchievements = [Achievement]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let achievements = NSKeyedUnarchiver.unarchiveObjectWithFile(self.documentsPath + "/archive") as? [Achievement] {
            self.storedAchievements = achievements
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("achievement", forIndexPath: indexPath) as UITableViewCell
        
        let selectedAchievement = self.storedAchievements[indexPath.row]
        
        cell.textLabel?.text = selectedAchievement.title
        cell.detailTextLabel?.text = selectedAchievement.achievement
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storedAchievements.count
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
