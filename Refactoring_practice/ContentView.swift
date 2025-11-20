//
//  ContentView.swift
//  Refactoring_practice
//
//  Created by 이민서 on 11/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("hello")
        }, label: {
            Text("Hello, World!")
        })
        .buttonStyle(.glassProminent)
    }
}

#Preview {
    ContentView()
}
