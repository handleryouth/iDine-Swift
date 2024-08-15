//
//  iDineApp.swift
//  iDine
//
//  Created by Tony Gultom on 15/08/24.
//

import SwiftUI
import SwiftData

@main
struct iDineApp: App {
    /*
     The @StateObject property wrapper is responsible for keeping the object alive throughout the life of our app.
     */
    @StateObject var order = Order()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(order)
        }
//        .modelContainer(sharedModelContainer)
    }
}
