//
//  RemoveNoteUseCaseMock.swift
//  NotesTests
//
//  Created by yessenia ramos on 07/02/24.
//

import Foundation

@testable import Notes

struct RemoveNoteUseCaseMock: RemoveNoteProtocol {
    func removeNoteWith(identifier: UUID) throws {
        if let index = mockDatabase.firstIndex(where: { $0.identifier == identifier }) {
            mockDatabase.remove(at: index)
        }
    }
}
