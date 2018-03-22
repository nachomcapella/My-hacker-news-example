//
//  DateExtensions.swift
//  api_manager_json_example
//
//  Created by Mariano Martinez on 22/3/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import Foundation
import UIKit
extension Int {
    func turnIntToDate() -> NSDate{
        let dateTimeStamp = NSDate(timeIntervalSince1970:Double(self))  //UTC time
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local //Edit
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
//        dateFormatter.dateStyle = DateFormatter.Style.FullStyle
//        dateFormatter.timeStyle = DateFormatter.Style.ShortStyle
//        let strDateSelect = dateFormatter.stringFromDate(dateTimeStamp)
//        print(strDateSelect) //Local time
//        let dateFormatter2 = DateFormatter()
//        dateFormatter2.timeZone = NSTimeZone.localTimeZone()
//        dateFormatter2.dateFormat = "yyyy-MM-dd"
//        let date3 = dateFormatter.dateFromString(strDateSelect)
//        datepicker.date = date3!
        return dateTimeStamp
    }
}
