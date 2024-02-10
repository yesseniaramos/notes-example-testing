//
//  CreateNoteViewSnapshotTest.swift
//  NotesTests
//
//  Created by yessenia ramos on 09/02/24.
//

import XCTest
import SnapshotTesting
@testable import Notes

final class CreateNoteViewSnapshotTest: XCTestCase {

    func testCreateNoteView() throws {
        let createNoteView = CreateNoteView(viewModel: .init())
        assertSnapshot(of: createNoteView, as: .image)
    }
    
    func testCreateNoteViewWithData() throws {
        let createNoteView = CreateNoteView(viewModel: .init(), title: "Nota Test", text: "Texto de la nota 🔥🔥🎉🎉🎊🥳")
        
        assertSnapshot(of: createNoteView, as: .image)
    }

}
