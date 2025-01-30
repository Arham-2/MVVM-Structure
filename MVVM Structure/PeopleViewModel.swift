// PeopleViewModel.swift
// Created by Arham MAC on 29/01/2025.

import Foundation

class PeopleViewModel {

    // MARK: - Properties
    private var apiService: APIService
    var people: [Person] = []
    
    var filteredPerson = [Person]()
    
    var didFetchData: (() -> Void)?
    var didFailToFetchData: ((Error) -> Void)?

    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    // MARK: - Fetch Data
    func fetchPeopleData() {
        apiService.fetchPeople { [weak self] result in
            switch result {
            case .success(let people):
                self?.people = people
                self?.didFetchData?()
            case .failure(let error):
                self?.didFailToFetchData?(error)
            }
        }
    }
    func filterForSearchTextAndScopeButton(searchText: String) {
        filteredPerson = people.filter() {
            person in
            
           return person.name.contains(searchText) ? true : false
//            if(searchText != "")
//            {
//                let searchTextMatch = person.name.lowercased().contains(searchText.lowercased())
//                return searchTextMatch
//            }
//            else{
//                return false
//            }
        }
    }
 
}
