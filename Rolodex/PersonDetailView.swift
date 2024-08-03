//
//  PersonDetailView.swift
//  Rolodex
//
//  Created by Nicholas Johnson on 8/3/24.
//

import SwiftUI
import MapKit

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Name: \(person.name)")
                    .padding()
                    .font(.headline)
                ImageView(imageData: person.image)
                Map(initialPosition:
                    MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: person.metAt.lattitude, longitude: person.metAt.longitude),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                ) {
                    Marker("Met \(person.name) Here", coordinate: CLLocationCoordinate2D(latitude: person.metAt.lattitude, longitude: person.metAt.longitude))
                }
                .frame(height: 300)
            }
        }
    }
}
