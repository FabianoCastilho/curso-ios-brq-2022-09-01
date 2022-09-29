//
//  EditProfessoresView.swift
//  ProfessoresCRUD
//
//  Created by user226746 on 9/27/22.
//

import SwiftUI

struct EditProfessoresView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : ViewModel
    
    @State var nome: String = ""
    @State var email: String = ""
    @State var professor : ProfessorModel
    
    var body: some View {
        Form{
            Section{
                VStack(alignment: .leading){
                    Text("Nome")
                    TextField("Nome", text: $nome)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Email")
                    TextField("Email", text: $email)
                }
                Spacer()
                HStack{
                    Spacer()
                    Button("Editar"){
                        viewModel.updateProfessores(id: professor.id, nome: nome, email: email)
                        dismiss()
                    }
                }
                .onAppear(perform: {
                    self.nome = professor.nome
                    self.email = professor.email
                })
            }
        }
    }
}

