//
//  ALP_CHASE_SEApp.swift
//  ALP_CHASE_SE
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI

@main
struct ALP_CHASE_SEApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
