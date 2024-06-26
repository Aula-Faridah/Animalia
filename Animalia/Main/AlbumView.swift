//
//  AlbumView.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import SwiftUI
import PhotosUI

struct AlbumView: View {
    @State private var selectedItem: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    
    var body: some View {
        
        VStack {
            // MARK: -DISPLAY SELECTED IMAGES
            if selectedImages.isEmpty {
                ContentUnavailableView("No Photos", systemImage: "photo.on.rectangle", description: Text("To get started, select some photos below."))
                    .frame(height: 300)
            } else {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(selectedImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(.horizontal, 20)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                }
                //: SCROLLVIEW
                .frame(height: 300)
            }
            
            Spacer()
            
            PhotosPicker(selection: $selectedItem, maxSelectionCount: 5, selectionBehavior: .continuousAndOrdered, matching: .images) {
                Label("Select a photo", systemImage: "photo")
            }
            .photosPickerStyle(.inline)
            .frame(height: 500)
            .ignoresSafeArea()
            .onChange(of: selectedItem) { oldItems, newItems in
                print("Old items: \(oldItems.count)")
                print("New items: \(newItems.count)")
                selectedImages = []
                
                newItems.forEach { newItem in
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                selectedImages.append(image)
                            }
                        }
                    }
                }
            }
            //: VSTACK
            
            // Simple Implementation
            //        PhotosPicker(selection: $selectedItem, matching: .images) {
            //            Label("Select a photo", systemImage: "photo")
            //        }
        }
    }
}
    
    #Preview {
        AlbumView()
    }
