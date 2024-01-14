//
//  ViewModel.swift
//  Notes
//
//  Created by yessenia ramos on 14/01/24.
//

import Foundation
import Observation

@Observable
class ViewModel {
    var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    func createNoteWith(title: String, text: String) {
        let note: Note = .init(tile: title, text: text)
        notes.append(note)
    }
    
    func updateNoteWith(id:UUID, newTitle: String, newText: String) {
        if let index = notes.firstIndex(where: { $0.id == id }) {
            let updatedNote = Note(id: id, tile: newTitle, text: newText, creadAt: notes[index].creadAt)
            notes[index] = updatedNote
        }
    }
    
    func removeNoteWith(id: UUID) {
        notes.removeAll(where: { $0.id == id })
    }
}
