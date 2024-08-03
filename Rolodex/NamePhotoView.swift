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
    
    init(imageData: Data) {
        person = Person(name: "", image: imageData)
    }
    
    var body: some View {
        ImageView(imageData: person.image)
            
        Text("What would you like to name the photo?")
            .padding()
        TextField("Name", text: $person.name)
            .padding()
        Button("Save") {
            savePerson()
        }
    }
    
    func savePerson() {
        modelContext.insert(person)
        try? modelContext.save()
        dismiss()
    }
}
