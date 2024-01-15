//
//  Note.swift
//  Notes
//
//  Created by yessenia ramos on 14/01/24.
//

import Foundation

struct Note: Identifiable, Hashable {
    let id: UUID
    let title: String
    let text: String?
    let createdAt: Date
    
    var getText: String {
        text ?? ""
    }
    
    init(id: UUID = UUID(), title: String, text: String?, createdAt: Date = .now) {
        self.id = id
        self.title = title
        self.text = text
        self.createdAt = createdAt
    }
}
