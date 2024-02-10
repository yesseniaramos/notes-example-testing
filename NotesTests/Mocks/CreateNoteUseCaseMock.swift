//
//  Mocks.swift
//  NotesTests
//
//  Created by yessenia ramos on 07/02/24.
//

import Foundation

@testable import Notes

var mockDatabase: [Note] = []

struct CreateNoteUseCaseMock: CreateNoteProtocol {
    func createNoteWith(title: String, text: String) throws {
        let note = Note(title: title, text: text)
        mockDatabase.append(note)
    }
}
