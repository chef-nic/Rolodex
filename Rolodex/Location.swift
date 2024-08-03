//
//  Location.swift
//  Rolodex
//
//  Created by Nicholas Johnson on 8/3/24.
//

import Foundation
import SwiftData

@Model
class Location: Identifiable {
    var id: UUID
    var lattitude: Double
    var longitude: Double
    
    init(lattitude: Double, longitude: Double) {
        self.id = UUID()
        self.lattitude = lattitude
        self.longitude = longitude
    }
}
