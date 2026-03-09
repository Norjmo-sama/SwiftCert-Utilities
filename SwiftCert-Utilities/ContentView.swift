//
//  ContentView.swift
//  SwiftCert-Utilities
//
//  Created by Morgan Pritchard on 3/8/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                NavigationLink {
                    ColorPicker()   // destination view
                } label: {
                    Text("Click me")
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                }            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
