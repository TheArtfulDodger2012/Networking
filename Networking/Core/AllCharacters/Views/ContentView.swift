//
//  ContentView.swift
//  Networking
//
//  Created by Ron Lane on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CharactersViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.characters) { character in
                Text(character.name)
            }
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
