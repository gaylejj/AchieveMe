//
//  StoreViewController.swift
//  Achieve.MeCoreData
//
//  Created by Jeff Gayle on 9/4/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var achievementTextField: UITextField!
    
    @IBOutlet weak var achievementImageView: UIImageView!
    
    @IBOutlet weak var leftMostStar: UIImageView!
    @IBOutlet weak var leftmiddleStar: UIImageView!
    @IBOutlet weak var middleStar: UIImageView!
    @IBOutlet weak var rightMiddleStar: UIImageView!
    @IBOutlet weak var rightMostStar: UIImageView!
    
    //MARK: Properties
    let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
    var achievements = [Achievement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addAchievementsButtonPressed(sender: AnyObject) {
        var newAchievement = Achievement(achievement: self.achievementTextField.text, title: self.titleTextField.text)
        let df = NSDateFormatter()
        newAchievement.date = df.stringFromDate(NSDate())
        self.achievements.append(newAchievement)
        NSKeyedArchiver.archiveRootObject(self.achievements, toFile: self.documentsPath + "/archive")
        
        self.performSegueWithIdentifier("showAchievements", sender: self)
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
