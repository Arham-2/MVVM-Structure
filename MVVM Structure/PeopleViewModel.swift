// PeopleViewModel.swift
// Created by Arham MAC on 29/01/2025.

import Foundation

class PeopleViewModel {
    
    // MARK: - Properties
    private var apiService: APIService
    var people: [Person] = []
    
    var filteredPersons = [Person]()
    var allPersons: [Person] = []
    
    var didFetchData: (() -> Void)?
    var didFailToFetchData: ((Error) -> Void)?
    
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func fetchPeopleData() {
        apiService.fetchPeople { [weak self] result in
            switch result {
            case .success(let people):
                self?.allPersons = people              // Assigning People Data to allPersons Array after success in                                              fetching data from API
                self?.filteredPersons = people
                self?.didFetchData?()
            case .failure(let error):
                self?.didFailToFetchData?(error)
            }
        }
    }
    func filterForSearchText(searchText: String, isSearching: Bool) {
        if isSearching && !searchText.isEmpty {
            filteredPersons = allPersons.filter() {                         // Function to search the Person based on                                                                   name, username and email. Also compare from                                                                 the searchText
                 $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.username.lowercased().contains(searchText.lowercased()) ||
                $0.email.lowercased().contains(searchText.lowercased())
            }
        }
        else {
            filteredPersons = allPersons
        }
    }
}


