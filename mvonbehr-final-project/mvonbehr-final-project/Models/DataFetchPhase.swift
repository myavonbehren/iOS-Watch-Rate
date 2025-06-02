//
//  DataFetchPhase.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import Foundation

enum DataFetchPhase<V> {
    case empty
    case success(V)
    case failure(Error)
    
    var value: V? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
}
