//
//  AddProfessoresView.swift
//  ProfessoresCRUD
//
//  Created by user226746 on 9/23/22.
//

import SwiftUI

struct AddProfessoresView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : ViewModel
    
    @State var nome: String = ""
    @State var email: String = ""
    
    var body: some View {
        Form{
            Section{
                VStack{
                    Text("Nome")
                    TextField("Nome", text: $nome)
                }
                Spacer()
                VStack{
                    Text("Email")
                    TextField("Email", text: $email)
                }
                Spacer()
                HStack{
                    Spacer()
                    Button("Salvar"){
                        viewModel.createProfessor(nome: nome, email: email)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddProfessoresView_Previews: PreviewProvider {
    static var previews: some View {
        AddProfessoresView()
    }
}
