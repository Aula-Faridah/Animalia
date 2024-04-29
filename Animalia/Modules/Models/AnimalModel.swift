//
//  Animal.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import Foundation

struct AnimalModel: Codable, Identifiable {
    let id, name, headline, description, link, image: String
    let gallery, fact: [String]
    
}
