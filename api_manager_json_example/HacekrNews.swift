//
//  HacekrNews.swift
//  api_manager_json_example
//
//  Created by Mariano Martinez on 22/3/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import Foundation
import SwiftyJSON
class HackerNews{
    var title:String = ""
    var storyTitle:String = ""
    var commentText:String = ""
    var date: NSDate = NSDate.init()
    var author:String = ""
    
    static func fromJSON (_ j: JSON) -> HackerNews{
        let news = HackerNews()
        news.title = j["title"].string ?? ""
        news.storyTitle = j["story_title"].string ?? ""
        news.commentText = j["comment_text"].string ?? ""
        news.author = j["author"].string ?? ""
        news.date = j["created_at_i"].int?.turnIntToDate() ?? NSDate.init()
        return news
    }
}
