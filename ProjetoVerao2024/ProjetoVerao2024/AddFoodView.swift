//
//  AddFoodView.swift
//  ProjetoVerao2024
//
//  Created by user226746 on 9/17/22.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var name : String = ""
    @State var calories : Double = 0.0
    @Binding var isAddView : Bool
    var body: some View {
        Form{
            Section{
                TextField("Food Name", text:  $name)
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...4000, step: 10)
                }.padding()
                HStack{
                    Button("Submit"){
                        DataController().addFood(name: name, calories: calories, context: managedObjectContext )
                        isAddView = false
                    }
                }
            }
        }
    }
}

//struct AddFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddFoodView()
//    }
//}
