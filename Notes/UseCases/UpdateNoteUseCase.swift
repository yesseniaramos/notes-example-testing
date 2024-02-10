//
//  UpdateNoteUseCase.swift
//  Notes
//
//  Created by yessenia ramos on 30/01/24.
//

import Foundation

protocol UpdateNoteProtocol {
    func updateNoteWith (identifier: UUID, title: String, text: String) throws
}

struct UpdateNoteUseCase: UpdateNoteProtocol {
    var noteDatabase: NotesDatabaseProtocol
    
    init(noteDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.noteDatabase = noteDatabase
    }
    
    func updateNoteWith(identifier: UUID, title: String, text: String) throws {
        try noteDatabase.update(identifier: identifier, title: title, text: text)
    }
}
