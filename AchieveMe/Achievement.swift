//
//  Achievement.swift
//  Achieve.MeCoreData
//
//  Created by Jeff Gayle on 9/4/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import Foundation
import UIKit

class Achievement: NSObject, NSCoding {

    var achievement: String
    var title: String
    var date: String!
    var rating: Int?
    var image: UIImage?
    
    init(achievement: String, title: String) {
        self.achievement = achievement
        self.title = title
    }
    
    required init(coder aDecoder: NSCoder) {
        self.achievement =  aDecoder.decodeObjectForKey("achievement") as String
        self.title = aDecoder.decodeObjectForKey("title") as String
        self.date = aDecoder.decodeObjectForKey("date") as String
        self.rating = aDecoder.decodeObjectForKey("rating") as? Int
        self.image = aDecoder.decodeObjectForKey("image") as? UIImage
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.achievement, forKey: "achievement")
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.date, forKey: "date")
        if self.rating != nil {
            aCoder.encodeObject(self.rating!, forKey: "rating")
        }
        if self.image != nil {
            aCoder.encodeObject(self.image!, forKey: "image")
        }
    }
}
