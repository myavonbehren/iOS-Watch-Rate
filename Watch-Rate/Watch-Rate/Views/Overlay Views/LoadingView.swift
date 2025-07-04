//
//  LoadingView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack (spacing: 30) {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading TV show details...")
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    LoadingView()
}
