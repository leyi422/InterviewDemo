//
//  helper.swift
//  InterviewDemo
//
//  Created by Jiawei Zhang on 2021/1/31.
//

import Foundation

class Helper {
    
    class func getDateTimeString(from dateTime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: dateTime)
    }
    
}
