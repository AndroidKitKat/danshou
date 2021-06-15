//
//  danshoApp.swift
//  Shared
//
//  Created by skg on 6/15/21.
//

import SwiftUI

@main
struct danshoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
