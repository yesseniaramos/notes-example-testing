//
//  FetchAllNotesUseCaseMock.swift
//  NotesTests
//
//  Created by yessenia ramos on 07/02/24.
//

import Foundation

@testable import Notes

//var mockDatabase: [Note] = []

struct FetchAllNotesUseCaseMock: FetchAllNotesProtocol {
    func fetchAll() throws -> [Notes.Note] {
        return mockDatabase
    }
}
