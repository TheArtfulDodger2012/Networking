//
//  ContentView.swift
//  Networking
//
//  Created by Ron Lane on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                Text(coin.name)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
