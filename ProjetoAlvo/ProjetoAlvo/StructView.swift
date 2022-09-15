//
//  StructView.swift
//  ProjetoAlvo
//
//  Created by user226746 on 9/12/22.
//
import SwiftUI

struct StructView: View {
    var text : String

    var body: some View {
        Text (text)
    }
}
struct AcerteNumText : View {
    var color : Color
    var text : String
    
    var body: some View {
        Text (text)
            .opacity(0.5)
            .foregroundColor(color)
    }
}
struct AcerteiButton : View {
    @Binding var game : Game 
    @Binding var isAlertVisible : Bool
    @Binding var sliderNumber : Double
    var body: some View{
        Button("Acertei"){
            game.sliderNumber = sliderNumber
            print("Clique no botão \(Int(sliderNumber))")
            game.upDate()
            sliderNumber = 0
            sliderNumber = 50.0
            isAlertVisible = true
        } .alert("Titulo", isPresented: $isAlertVisible, actions: { Button("OK", role: .cancel){} } , message: {Text(game.getMessage()) } )
            .tint(.green)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
                
    }
}

struct StructView_Previews: PreviewProvider {
    static var previews: some View {
        StructView(text: "Texto para visualizar")
    }
}


