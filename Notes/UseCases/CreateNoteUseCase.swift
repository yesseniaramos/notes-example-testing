//
//  CreateNoteUseCase.swift
//  Notes
//
//  Created by yessenia ramos on 17/01/24.
//

import Foundation

protocol CreateNoteProtocol {
    func createNoteWith(title:String, text: String) throws
}

struct CreateNoteUseCase: CreateNoteProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func createNoteWith(title:String, text: String) throws {
        let note: Note = .init(title: title, text: text)
        try notesDatabase.insert(note: note)
    }
}
