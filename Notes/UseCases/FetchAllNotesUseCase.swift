//
//  FetchAllNotesUseCase.swift
//  Notes
//
//  Created by yessenia ramos on 17/01/24.
//

import Foundation

protocol FetchAllNotesProtocol {
    func fetchAll() throws -> [Note] 
}


struct FetchAllNotesUseCase: FetchAllNotesProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func fetchAll() throws -> [Note] {
        try notesDatabase.fetchAll()
    }
}
