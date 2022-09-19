//
//  DataController.swift
//  ProjetoVerao2024
//
//  Created by user226746 on 9/16/22.
//
import SwiftUI
import Foundation
import CoreData

class DataController : ObservableObject{
    
    let container = NSPersistentContainer(name: "FoodModel")
    
    init(){
        container.loadPersistentStores{ description, error in
                                       if let error = error{
                                           print("Erro ao carregar os daods \(error)") }
    }
}
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
        }
        catch{
            let error = error as NSError
            print("Erro ao salvar os dados no contexto \(error)")
        }
    }
    

    func addFood(name: String, calories: Double, context: NSManagedObjectContext){
        
        let food = Food(context: context)
        
        food.name = name
        food.calories = calories
        food.id = UUID()
        food.date = Date()
       
        save(context: context)
    }
    
    func editFood(foodOld: Food, name: String, calories: Double, context: NSManagedObjectContext){
        foodOld.name = name
        foodOld.calories = calories
        foodOld.date = Date()
        
        save(context: context)
    }
    func deleteFood(offsets: IndexSet, context: NSManagedObjectContext, food: FetchedResults<Food> ){
        offsets.map{ food[$0]}
            .forEach(context.delete)
        
        save(context: context)
    }
        
}


