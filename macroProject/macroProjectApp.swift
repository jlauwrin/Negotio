//
//  macroProjectApp.swift
//  macroProject
//
//  Created by Jason Lauwrin on 26/09/22.
//

import SwiftUI

@main
struct macroProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
