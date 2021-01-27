//
//  DisplayModel.swift
//  Equipment
//
//  Created by Aradhana on 27/01/21.
//

import Foundation

struct SectionDetail {
    let id: String
    let title: String
    var collapsed = true
    
    mutating func updateCollapse() {
        self.collapsed = !self.collapsed
    }
}
