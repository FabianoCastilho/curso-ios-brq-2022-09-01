//
//  SecondView.swift
//  ProjetoAlvo
//
//  Created by user226746 on 9/12/22.
//

import SwiftUI

struct SecondView: View {
    @Binding var isShowSecondScreen : Bool
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Fechar Tela"){
            isShowSecondScreen = false
        }
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(isS)
//    }
//}
