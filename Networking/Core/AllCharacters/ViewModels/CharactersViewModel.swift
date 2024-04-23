//
//  CharactersViewModel.swift
//  Networking
//
//  Created by Ron Lane on 4/21/24.
//

import Foundation

class CharactersViewModel: ObservableObject {
    
    @Published var characters = [Character]()

    private let service = CharactersDataService()

    init() {
        fetchCharacters()
    }
    
    func fetchCharacters() {
        service.fetchCharacters { characters in
            for character in characters {
                DispatchQueue.main.async {
                    self.characters = characters
                }
            }
        }
    }
}
