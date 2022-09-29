//
//  ProfessoresCRUDApp.swift
//  ProfessoresCRUD
//
//  Created by user226746 on 9/21/22.
//

import SwiftUI

@main
struct ProfessoresCRUDApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
