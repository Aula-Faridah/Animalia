//
//  AnimalDetailView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            // HERO IMAGE
            Image(animal.image)
                .resizable()
                .scaledToFit()
            
            // TITLE
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .background(
                    Color.accent
                        .frame(height: 6)
                        .offset(y: 24)
                )
            
            Text(animal.headline)
                .font(.headline)
                .foregroundStyle(.accent)
                .padding()
            
            // GALLERY
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                InsetGalleryView(animal: animal)
            }
            .padding(8)
            
            // FACT
            Group {
                HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
        
                InsetFactView(animal: animal)
            }
            .padding(8)
            
            // DESCRIPTION
            Group {
                HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                
                Text(animal.description)
            }
            .padding(8)
            
            // MAP
            Group {
                HeadingView(headingImage: "map", headingText: "National Parks")
                
                InsetMapView()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(8)
            
            // LINK
            Group {
                HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                
                ExternalWebLinkView(animal: animal)
            }
            .padding(8)
        }
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return NavigationStack {
        AnimalDetailView(animal: animals[5])
    }
}
