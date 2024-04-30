//
//  VideoModel.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    var id, name, headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
