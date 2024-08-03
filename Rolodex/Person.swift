//
//  Person.swift
//  Rolodex
//
//  Created by Nicholas Johnson on 8/2/24.
//


import Foundation
import SwiftData
import CoreLocation

@Model
class Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
    
    var id: UUID
    var name: String
    @Attribute(.externalStorage) var image: Data
    var metAt: Location
    
    init(name: String, image: Data) {
        self.id = UUID()
        self.name = name
        self.image = image
        self.metAt = Location(lattitude: 0, longitude: 0)
    }
    
}
