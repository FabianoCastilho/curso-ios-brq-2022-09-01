//
//  ContentView.swift
//  ProjetoAlvo
//
//  Created by user226746 on 9/8/22.
//

import SwiftUI

struct ContentView: View {
//    @State var sliderNumberC : Double = 50.0
    @State var game : Game = Game()

    @State var isAlertVisible : Bool = false
    
    @State var sliderVelue : Double = 50.0
    @State var isShowSecondScreen : Bool = false
    var body: some View {
            
        VStack{
            VStack{
                StructView(text: "Hello Word")
                if game.points > 0 {
                    Text( "Round Points : \(game.points)")
                        .opacity(0.6)
                        .foregroundColor(.red)
                }
                Text("")
            }
            VStack{
//               Text("Acerte o número")
//                   .opacity(0.7)
//                   .foregroundColor(.green)
//                   .background(.black)
                AcerteNumText(color : Color("vermelhoF"), text: "Acerte um número")
            }
            VStack{
                Text("\(game.target)")
                }
            
            SliderView(sliderNumberC: $sliderVelue)
//      HStack{
//          Text("1")
//          Slider(value: $sliderNumberC, in: 1...100)
//          Text("100")
//       }
            HStack{
//                Button("Acertei") {
//                    game.sliderNumber = sliderVelue
//                    print("Clique no botão \(Int(sliderVelue))")
//                    game.upDate()
//                    sliderVelue = 0
//                    sliderVelue = 50.0
//                    isAlertVisible = true
//                }
                AcerteiButton(game : $game, isAlertVisible : $isAlertVisible, sliderNumber: $sliderVelue)
           
                Button("Reset") {
                    game.reset()
                    sliderVelue = 0
                    sliderVelue = 50.0
                    isAlertVisible = true
                    }.tint(Color("lightBlue"))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
             //       .alert("Titulo", isPresented: $isAlertVisible, actions: { Button("OK", role: .cancel){} } , message: {Text("Pontuação reiniciada") } )
            }
            HStack{
                Button("Info"){
                    isShowSecondScreen = true         }
                .tint(.teal)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.regular)
                .sheet(isPresented: $isShowSecondScreen, content: { SecondView(isShowSecondScreen: $isShowSecondScreen) })
            }
            VStack{
                Text("")
//              Text("Total Score: \(game.totalScore)")
                AcerteNumText(color: .black, text: "Total Score: \(game.totalScore)")
            }
        }
    }
}
//struct AcerteNumText : View {
//    var color : Color
//    var text : String
//    var body: some View {
//        Text (text)
//            .opacity(0.5)
//            .foregroundColor(color)
//    }
//}
//struct AlertView : View{
//    @Binding var isAlertVisible : Bool
//    var text : String
//    var body: some View{
//
//        .alert("Titulo", isPresented: $isAlertVisible, actions: { Button("OK", role: .cancel){} } , message: {Text(text)} )
//    }
//

struct SliderView : View {
    @Binding var sliderNumberC : Double
    var body: some View{
        HStack{
            Text("1")
            Slider(value: $sliderNumberC, in: 1...100)
            Text("100")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

