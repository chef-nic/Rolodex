//
//  ContentView.swift
//  Rolodex
//
//  Created by Nicholas Johnson on 8/2/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var people: [Person]
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var person: Person?
    @State private var imageData: Data?
    @State private var namingPhoto = false
    
    var body: some View {
        NavigationStack {
            List(people.sorted()) { person in
                HStack {
                    NavigationLink(value: person) {
                        HStack {
                            if let uiImage = UIImage(data: person.image) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                    .padding(.trailing, 8)
                            }
                            Text(person.name)
                        }
                    }
                }
            }
            .navigationTitle("Rolodex")
            .toolbar {
                ToolbarItem {
                    PhotosPicker("Add Person", selection: $pickerItem, matching: .images)
                        .onChange(of: pickerItem) {
                            Task {
                                imageData = try await pickerItem?.loadTransferable(type: Data.self)
                            }
                        }
                        .onChange(of: imageData) {
                            namingPhoto = true
                        }
                }
            }
            .navigationDestination(isPresented: $namingPhoto) {
                NamePhotoView(imageData: imageData ?? Data())
            }
            .navigationDestination(for: Person.self) { person in
                PersonDetailView(person: person)
            }
        }
    }
    
    func showNamePhoto() {
        Task {
            guard let data = try await pickerItem?.loadTransferable(type: Data.self) else { return }
            imageData = data
            namingPhoto = true
        }
    }
}

#Preview {
    ContentView()
}






