//
//  EquipmentModel.swift
//  Equipment
//
//  Created by Aradhana on 27/01/21.
//

import Foundation

struct Equipment: Codable {
    let id: Int
    let vin: String
    let year: Int
    let make: String
    let value: Float
    let length: Float
}
