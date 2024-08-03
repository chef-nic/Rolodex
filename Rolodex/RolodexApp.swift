//
//  RolodexApp.swift
//  Rolodex
//
//  Created by Nicholas Johnson on 8/2/24.
//

import SwiftUI
import SwiftData

@main
struct RolodexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
