//
//  APIService.swift
//  TableView
//
//  Created by Arham MAC on 29/01/2025.
//

import Foundation

// API Service for fetching data
class APIService {
    
    // Update the URL to a real API endpoint (e.g., JSONPlaceholder API)
    private let apiUrl = "https://jsonplaceholder.typicode.com/users"
    
    // Function to fetch people from the API
    func fetchPeople(completion: @escaping (Result<[Person], Error>) -> Void) {
        guard let url = URL(string: apiUrl) else {
            return completion(.failure(NetworkError.invalidURL))
        }
        
        // Start the data task to fetch the data from the API
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle errors
            if let error = error {
                return completion(.failure(error))
            }
            
            // Ensure the response is valid and the data is received
            guard let data = data else {
                return completion(.failure(NetworkError.noData))
            }
            
            // Decode the data into an array of Person objects
            do {
                let decoder = JSONDecoder()
                let people = try decoder.decode([Person].self, from: data)
                completion(.success(people))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


// Custom error enum for network-related errors
enum NetworkError: Error {
    case invalidURL
    case noData
}
