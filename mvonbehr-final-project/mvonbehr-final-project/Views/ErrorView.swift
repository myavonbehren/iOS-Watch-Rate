//
//  ErrorView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct ErrorView: View {
    //let error: Error
    //let retry: () async -> Void
    
    var body: some View {
        VStack (spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundColor(.red)
            
            Text("Something went wrong")
                .foregroundColor(.secondary)
        }
    }
}


#Preview {
    ErrorView()
}
