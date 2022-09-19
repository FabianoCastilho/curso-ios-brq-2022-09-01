//
//  ContentView.swift
//  ProjetoVerao2024
//
//  Created by user226746 on 9/16/22.
//
import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest ( sortDescriptors: [SortDescriptor(\.date, order : .reverse)] )
    var food: FetchedResults<Food>
    
    @State var isAddView : Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                Text("\(Int(getTotalCalories() ) ) Calorias Totais")
                    .foregroundColor(.gray)
                    .padding()
                
                List{
                    ForEach(food) { food in
                        NavigationLink(destination: EditFoodView(food: food)){
                            HStack{
                                VStack(alignment: .leading,spacing: 6){
                                    Text(food.name!)
                                        .bold()
                                    Text("\(Int(food.calories))") + Text(" Calories").foregroundColor(.red)
                                }
                                Spacer()
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .toolbar{ ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        isAddView = true
                        } label: { Label("Add Label", systemImage: "plus.circle")
                        
                        }
                    }
                }
                .sheet(isPresented: $isAddView, content:{
                    AddFoodView(isAddView: $isAddView)
                })
            }
        }
    }
    func deleteFood(offset:IndexSet) {
            DataController().deleteFood(offsets: offset, context: managedObjectContext, food: food)
        }
    func getTotalCalories() -> Double{
        return 0.0
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
