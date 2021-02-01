//
//  Date + ext.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/26/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import Foundation

// keeping separate bc its handy

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        
        return dateFormatter.string(from: self)
    }
    
}
