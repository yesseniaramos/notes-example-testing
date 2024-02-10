//
//  RemoveNoteUseCase.swift
//  Notes
//
//  Created by yessenia ramos on 01/02/24.
//

import Foundation

protocol RemoveNoteProtocol {
    func removeNoteWith(identifier: UUID) throws
}

struct RemoveNoteUseCase: RemoveNoteProtocol {
    var noteDatabase: NotesDatabaseProtocol
    
    init(noteDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.noteDatabase = noteDatabase
    }
    
    func removeNoteWith(identifier: UUID) throws {
        try noteDatabase.remove(identifier: identifier)
    }
}
                                
                                
