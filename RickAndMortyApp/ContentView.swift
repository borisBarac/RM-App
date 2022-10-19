//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Boris Barac on 19.10.2022.
//

import SwiftUI
import AppCore

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
