//
//  PersonDetailView.swift
//  Rolodex
//
//  Created by Nicholas Johnson on 8/3/24.
//

import SwiftUI

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Name: \(person.name)")
                    .padding()
                    .font(.headline)
                ImageView(imageData: person.image)
            }
        }
    }
}
