//
//  DataController.swift
//  ProjetoVerao2024
//
//  Created by user226746 on 9/16/22.
//
import Foundation
import CoreData

class DataController {
    func save(context: NSManagedObjectContext){
        do{
            try   context.save()
        }
        catch{
            print("Erro ao salvar os dados no contexto")
        }
    }
    
    func save(){
        
    }
    func update(){
        
    }
    func addFood(name: String, calories: Double, context: NSManagedObjectContext){
        
        let food = Food(context: context)
        
        food.name = name
        food.calories = calories
        food.id = UUID()
        food.date = Date()
       
        save(context: context)
        
    }
    func editFood(){
        
    }
}
