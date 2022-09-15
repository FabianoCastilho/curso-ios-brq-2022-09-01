//
//  ContentView.swift
//  Navigation
//
//  Created by user226746 on 9/14/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView{
            VStack{
                CircleView( colorCircle: .red, text: "1")
//                ZStack{
//                    Circle()
//                        .frame(width: 150, height: 150, alignment: .center)
//                        .foregroundColor(.red)
//                    Text("1")
//                        .foregroundColor(.white)
//                        .font(.system(size: 70, weight: .bold))
//                }
                NavigationLink(destination: BlueClircleView(), label: {
                    NavigationText(color: .blue, text: "Próxima Página")} )
//                    Text("Próxima Página")})
//                .frame(width: 200, height: 50)
//                .background(.blue)
//                .foregroundColor(.white)
//                .cornerRadius(30)
                HomeView()
            }
        }
}
struct HomeView : View{
    var body: some View{
        VStack {
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding()
            Text("Hello, world!")
        
            HStack{
                Button("Login", action: {})
                    .frame(width: 90, height: 40, alignment: .center)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                Button( action: {}, label: { Label ("Esqueci Minha Senha",systemImage: "key")} )
                    .frame(width: 200, height: 40, alignment: .center)
                    .background(.gray)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
