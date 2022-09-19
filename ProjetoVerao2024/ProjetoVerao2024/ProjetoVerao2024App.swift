//
//  ProjetoVerao2024App.swift
//  ProjetoVerao2024
//
//  Created by user226746 on 9/16/22.
//

import SwiftUI

@main
struct ProjetoVerao2024App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext )
        }
    }
}
