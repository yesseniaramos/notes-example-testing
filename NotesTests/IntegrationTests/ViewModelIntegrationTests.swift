//
//  ViewModelIntegrationTests.swift
//  NotesTests
//
//  Created by yessenia ramos on 19/01/24.
//

import XCTest
@testable import Notes

@MainActor
final class ViewModelIntegrationTests: XCTestCase {
    // System under test
    var sut: ViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let database = NotesDatabase.shared
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        let createNoteUseCase = CreateNoteUseCase(notesDatabase: database)
        let fetchAllNotesUseCase = FetchAllNotesUseCase(notesDatabase: database)
        
        sut = ViewModel(createNoteUseCase: createNoteUseCase, fetchAllNotesUseCase:fetchAllNotesUseCase)
    }
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateNote() {
        // Given
        sut.createNoteWith(title: "Note 1", text: "Text note 1")
        
        // When
        let note = sut.notes.first
        
        // Then
        XCTAssertNotNil(note)
        XCTAssertEqual(note?.title, "Note 1")
        XCTAssertEqual(note?.getText, "Text note 1")
        XCTAssertEqual(sut.notes.count, 1, "Debería haber una nota en la base de datos")
    }
    
    func testCreateTwoNote() {
        // Given
        sut.createNoteWith(title: "Note 1", text: "Text note 1")
        sut.createNoteWith(title: "Note 2", text: "Text note 2")
        
        // When
        let firstNote = sut.notes.first
        let lastNote = sut.notes.last
        
        // Then
        XCTAssertNotNil(firstNote)
        XCTAssertEqual(firstNote?.title, "Note 1")
        XCTAssertEqual(firstNote?.getText, "Text note 1")
        
        XCTAssertNotNil(lastNote)
        XCTAssertEqual(lastNote?.title, "Note 2")
        XCTAssertEqual(lastNote?.getText, "Text note 2")
        XCTAssertEqual(sut.notes.count, 2, "Debería haber dos notas en la base de datos")
    }
    
    func testFetchAllNotes() {
        // Given
        sut.createNoteWith(title: "Note 1", text: "Text note 1")
        sut.createNoteWith(title: "Note 2", text: "Text note 2")
        
        // When
        let firstNote = sut.notes[0]
        let secondNote = sut.notes[1]
        
        // Then
        XCTAssertEqual(sut.notes.count, 2, "There should be two notes in the database")
        XCTAssertEqual(firstNote.title, "Note 1","First note's title should be 'Note 1'")
        XCTAssertEqual(firstNote.text, "Text note 1","First note's text should be 'Text note 1'")
        XCTAssertEqual(secondNote.title, "Note 2","Second note's title should be 'Note 1'")
        XCTAssertEqual(secondNote.text, "Text note 2","Second note's text should be 'Text note 2'")
        
    }
    
    func testUpdateNote(){
        // Given
        let title = "First title"
        let text = "First text"
        let newTitle = "First new title"
        let newText = "First new text"
        
        sut.createNoteWith(title: title, text: text)
        
        guard let note = sut.notes.first else {
            XCTFail()
            return
        }
        
        // When
        sut.updateNoteWith(identifier: note.identifier, newTitle: newTitle, newText: newText)
        
        sut.fetchAllNotes()
        
        // Then
        
        XCTAssertEqual(sut.notes.count, 1, "Debería haber 1 nota en la base de datos")
        XCTAssertEqual(sut.notes[0].title, newTitle)
        XCTAssertEqual(sut.notes[0].text, newText)

    }
    
    func testRemoveNote() {
        sut.createNoteWith(title: "Note 1", text: "text 1")
        sut.createNoteWith(title: "Note 2", text: "text 2")
        sut.createNoteWith(title: "Note 3", text: "text 3")
        
        guard let note = sut.notes.last else {
            XCTFail()
            return
        }
        
        sut.removeNoteWith(identifier: note.identifier)
        
        XCTAssertEqual(sut.notes.count, 2, "Debería haber 2 notas en la base de datos")
    }
    
    func testRemoveNoteInDatabaseShouldThrowError() {
        sut.removeNoteWith(identifier: UUID())
        
        XCTAssertEqual(sut.notes.count, 0)
        XCTAssertNotNil(sut.databaseError)
        XCTAssertEqual(sut.databaseError, DatabaseError.errorRemove)
    }
    
}
