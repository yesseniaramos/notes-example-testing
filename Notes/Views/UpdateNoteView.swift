//
//  UpdateNoteView.swift
//  Notes
//
//  Created by yessenia ramos on 15/01/24.
//

import SwiftUI

struct UpdateNoteView: View {
    var viewModel: ViewModel
    let identifier: UUID
    
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
     
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text("*Título"), axis: .vertical)
                    TextField("", text: $text, prompt: Text("*Texto"), axis: .vertical)
                }
            }
            Button(action: {
                viewModel.removeNoteWith(identifier: identifier)
                dismiss()
            }, label: {
                Text("Eliminar Nota")
                    .foregroundStyle(.gray)
                    .underline()
            })
            .buttonStyle(BorderlessButtonStyle())
            .accessibilityIdentifier("updatenote_remove_identifier")
            Spacer()
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .toolbar {
            ToolbarItem {
                Button {
                    viewModel.updateNoteWith(identifier: identifier, newTitle: title, newText: text)
                    dismiss()
                } label: {
                    Text("Actualizar")
                        .bold()
                }
            }
        }
        .navigationTitle("Modificar Nota")
    }
}

#Preview {
    NavigationStack {
        UpdateNoteView(viewModel: .init(), identifier: .init(), title: "Nota a editar", text: "Texto de mi nota")
    }
}
