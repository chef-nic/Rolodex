//
//  NamePhotoView.swift
//  Rolodex
//
//  Created by Nicholas Johnson on 8/3/24.
//

import SwiftUI
import SwiftData

struct NamePhotoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var person: Person
    let locationFetcher = LocationFetcher()
    
    init(imageData: Data) {
        person = Person(name: "", image: imageData)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ImageView(imageData: person.image)
                    
                Text("What would you like to name the photo?")
                    .padding()
                TextField("Name", text: $person.name)
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                Button("Add Location") {
                    locationFetcher.start()
                }
                Button("Save") {
                    savePerson()
                }
            }
        }
    }
    
    func savePerson() {
        if let location = locationFetcher.lastKnownLocation {
            person.metAt.lattitude = location.latitude
            person.metAt.longitude = location.longitude
        }
        modelContext.insert(person)
        try? modelContext.save()
        dismiss()
    }
}
