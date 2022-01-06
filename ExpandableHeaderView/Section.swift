//
//  Section.swift
//  Swift-dp
//
//  Created by Dakota Lane Holmes on 1/5/22.
//

import Foundation

struct Section {
    var sector: String!
    var information: [String]!
    var expanded: Bool!
    
    init(sector: String, information: [String], expanded: Bool) {
        self.sector = sector
        self.information = information
        self.expanded = expanded
    }
    
}
