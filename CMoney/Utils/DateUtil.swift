//
//  DateUtil.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import Foundation

class DateUtil {
    static func convertDateString(
        dateString : String!,
        fromFormat sourceFormat : String!,
        toFormat desFormat : String!) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = sourceFormat
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = desFormat
        return dateFormatter.string(from: date!)
    }
}
