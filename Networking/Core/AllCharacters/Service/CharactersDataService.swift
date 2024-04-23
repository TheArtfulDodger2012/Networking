//
//  CharactersDataService.swift
//  Networking
//
//  Created by Ron Lane on 4/22/24.
//

import Foundation

class CharactersDataService {
    
    private let urlString = "https://rickandmortyapi.com/api/character"
    
    func fetchCharacters() async throws -> [Character] {
        guard let url = URL(string: urlString) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(Characters.self, from: data)
            return result.results
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
    }
}

// MARK: - Completion Handlers

extension CharactersDataService {
    
    func fetchCharactersWithResult(completion: @escaping(Result<[Character], CharacterAPIError>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Characters.self, from: data)
                let characters = result.results
                completion(.success(characters))
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
        }.resume()
    }
}
