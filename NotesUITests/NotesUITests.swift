//
//  NotesUITests.swift
//  NotesUITests
//
//  Created by yessenia ramos on 10/02/24.
//

import XCTest

final class NotesUITests: XCTestCase {

    func testCreateNote() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Notas"]/*[[".otherElements[\"Crear Notas\"]",".buttons[\"Crear Notas\"].staticTexts[\"Crear Notas\"]",".staticTexts[\"Crear Notas\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("Título de nota UITests 2")
        
        let textoTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        textoTextView.tap()
        
        textoTextView.typeText("Texto de nota UItests 2")
        
        
        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testCreateTwoNotes() throws {
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Notas"]/*[[".otherElements[\"Crear Notas\"]",".buttons[\"Crear Notas\"].staticTexts[\"Crear Notas\"]",".staticTexts[\"Crear Notas\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        
        // Creación de primera nota
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("Título de nota UITests 2")
        
        let textoTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        textoTextView.tap()
        
        textoTextView.typeText("Texto de nota UItests 2")
        
        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Creación de segunda nota
        
        
        
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Notas"]/*[[".otherElements[\"Crear Notas\"]",".buttons[\"Crear Notas\"].staticTexts[\"Crear Notas\"]",".staticTexts[\"Crear Notas\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let titleTextView2 = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView2.tap()
        titleTextView2.typeText("Título de nota UITests 3")
        
        let textoTextView2 = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        textoTextView2.tap()
        
        textoTextView2.typeText("Texto de nota UItests 3")
        
        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testRemoveNotes() throws {
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Notas"]/*[[".otherElements[\"Crear Notas\"]",".buttons[\"Crear Notas\"].staticTexts[\"Crear Notas\"]",".staticTexts[\"Crear Notas\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        
        // Creación de primera nota
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("Título de nota UITests 2")
        
        let textoTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        textoTextView.tap()
        
        textoTextView.typeText("Texto de nota UItests 2")
        
        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let firstNote = collectionViewsQuery.cells.element(boundBy: 0)
        firstNote.tap()
        app.buttons.matching(identifier: "updatenote_remove_identifier").element.tap()
        
    }

}
