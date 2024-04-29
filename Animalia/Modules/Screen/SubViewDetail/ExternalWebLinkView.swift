//
//  ExternalWebLinkView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
            }
        }
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return ExternalWebLinkView(animal: animals[5])
}
