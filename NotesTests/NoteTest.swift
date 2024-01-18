//
//  NotesTests.swift
//  NotesTests
//
//  Created by yessenia ramos on 15/01/24.
//

import XCTest
@testable import Notes

final class NoteTest: XCTestCase {
    
    func testNoteInitialization() {
        // Given or Arrange
        let title = "Tests Title"
        let text = ""
        
        // When or Act
        let note = Note(title: title, text: text)
        
        //Then or Assert
        XCTAssertEqual(note.title, title)
        XCTAssertEqual(note.text, text)
    }

    func testNoteEmptyText() {
        // Given
        let title = "Test Title"
        let date = Date()
        
        // When
        let note = Note(title:title, text: nil, createdAt: date)
        
        // Then
        
        XCTAssertEqual(note.getText, "")
    }
}
