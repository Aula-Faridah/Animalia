//
//  HeadingView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct HeadingView: View {
    var headingImage, headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Headline")
}
