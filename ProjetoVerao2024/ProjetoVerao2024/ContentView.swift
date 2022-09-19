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
                            
                            FoodDetailView(foodName: food.name ??  "", foodCalories: food.calories, foodDate: food.date ?? Date())
                            
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .navigationTitle("Projeto Verãobb")
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
        var sum : Double = 0.0
        
        for item in food{
            if let myDate = item.date{
                if Calendar.current.isDateInToday(myDate){
                    sum += item.calories
                }
            }
        }
        return sum
    }
   
}
struct FoodDetailView : View{
    var foodName : String = ""
    var foodCalories : Double = 0.0
    var foodDate : Date = Date()
    var body: some View{
        
        HStack{
            VStack(alignment: .leading,spacing: 6){
                Text(foodName)
                    .bold()
                Text("\(Int(foodCalories)) -") + Text(" Calories").foregroundColor(.red)
            }
            Spacer()
            
            Text(calcTimeSince(date : foodDate))
        }
    }
}
func calcTimeSince(date : Date) -> String{
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes / 60
    let days = hours / 24
    
    if minutes < 120 {
        return "\(minutes) minutos atrás"
    }
    else if( minutes >= 120 && hours < 48){
        return "\(hours) horas atrás"
    }
    else{
        return "\(days) dias atrás"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
