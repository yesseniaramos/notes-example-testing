//
//  UpdateNoteUseCaseMock.swift
//  NotesTests
//
//  Created by yessenia ramos on 07/02/24.
//

import Foundation

@testable import Notes

struct UpdateNoteUseCaseMock: UpdateNoteProtocol {
    func updateNoteWith(identifier: UUID, title: String, text: String) throws {
        if let index = mockDatabase.firstIndex(where: { $0.identifier ==  identifier}) {
            mockDatabase[index].title = title
            mockDatabase[index].text = text
        }
    }
}
