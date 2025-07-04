//
//  watch_rateApp.swift
//  Watch-Rate
//
//  Created by Mya Von Behren on 5/19/25.
//

import SwiftUI

@main
struct mvonbehr_final_projectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
