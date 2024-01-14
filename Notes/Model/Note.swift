//
//  Note.swift
//  Notes
//
//  Created by yessenia ramos on 14/01/24.
//

import Foundation

struct Note: Identifiable, Hashable {
    let id: UUID
    let tile: String
    let text: String?
    let creadAt: Date
    
    var getText: String {
        text ?? ""
    }
    
    init(id: UUID = UUID(), tile: String, text: String?, creadAt: Date = .now) {
        self.id = id
        self.tile = tile
        self.text = text
        self.creadAt = creadAt
    }
}
