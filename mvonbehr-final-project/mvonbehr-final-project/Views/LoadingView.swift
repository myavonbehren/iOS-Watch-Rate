//
//  LoadingView.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 6/1/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading show details...")
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    LoadingView()
}
