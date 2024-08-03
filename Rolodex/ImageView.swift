//
//  ImageView.swift
//  Rolodex
//
//  Created by Nicholas Johnson on 8/3/24.
//

import SwiftUI

struct ImageView: View {
    var imageData: Data
    
    var body: some View {
        if let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        }
    }
}
