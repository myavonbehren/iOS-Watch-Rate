//
//  DataController.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FinalProject")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
