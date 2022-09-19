//
//  EditFoodView.swift
//  ProjetoVerao2024
//
//  Created by user226746 on 9/19/22.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State var name : String = ""
    @State var calories : Double = 0.0
    
    var body: some View {
        Form{
            Section(){
                TextField("Food Name", text:  $name)
                    .onAppear(){
                       name = food.name!
                       calories = food.calories
                        }
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...4000, step: 10)
                }.padding()
                HStack{
                    Spacer()
                    Button("Edit"){
                        DataController().editFood(foodOld: food, name: name, calories: calories, context: managedObjectContext )
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}


