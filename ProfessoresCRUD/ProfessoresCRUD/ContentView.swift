//
//  ContentView.swift
//  ProfessoresCRUD
//
//  Created by user226746 on 9/21/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : ViewModel
    @State var isAddView: Bool = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.items.sorted(by: {$0.id>$1.id}),id: \.id){ item in
                    VStack{
                        NavigationLink(destination: EditProfessoresView(professor : item), label: {
                            Text("\(item.nome)")
                        })
                    }
                }
                .onDelete(perform: deleteProfessores)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        isAddView = true
                    }, label: { Label(
                        "Add Professor", systemImage: "plus.circle")
                    })
                }
            }
            .sheet(isPresented: $isAddView){
                AddProfessoresView()
            }
        }
    }
    func deleteProfessores(offset : IndexSet){
        let idArrays = offset.map({
            viewModel.items[$0].id
        })
        for i in idArrays{
            viewModel.deleteProfessores(id: i)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
