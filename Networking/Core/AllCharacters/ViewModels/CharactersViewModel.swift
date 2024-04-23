//
//  CharactersViewModel.swift
//  Networking
//
//  Created by Ron Lane on 4/21/24.
//

import Foundation

class CharactersViewModel: ObservableObject {
    
    @Published var characters = [Character]()
    @Published var errorMessage: String?

    private let service = CharactersDataService()

    init() {
        Task { try await fetchCharacters() }
    }
    
    func fetchCharacters() async throws {
        self.characters = try await service.fetchCharacters()
    }
    
    func fetchCharactersWithCompletionHandler() {
        service.fetchCharactersWithResult { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self?.characters = characters
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
