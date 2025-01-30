//  Created by Arham MAC on 27/01/2025.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    
    let searchController = UISearchController()
    @IBOutlet var tableView: UITableView!
     
    private var viewModel: PeopleViewModel

//    var filteredPerson = [Person]()
    
    // Required init for storyboard-based instantiation
       required init?(coder: NSCoder) {
           self.viewModel = PeopleViewModel()
           super.init(coder: coder)
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSearchController()
        let nib = UINib(nibName: "PersonCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PersonCell")
     
        tableView.delegate  = self
        tableView.dataSource = self
        
        bindViewModel()
        
        viewModel.fetchPeopleData()
    }
    
    func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    private func bindViewModel() {
            // Updates the UI once data is fetched
            viewModel.didFetchData = { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            
            // Handle errors
            viewModel.didFailToFetchData = { [weak self] error in
                DispatchQueue.main.async {
                    self?.showError(error)
                }
            }
            
        }
        
        private func showError(_ error: Error) {
            // Present error message to the user
            print("Error: \(error.localizedDescription)")
            // Optionally, you can display an alert here
        }
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!

        viewModel.filterForSearchTextAndScopeButton(searchText: searchText)
        tableView.reloadData()

    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person1 = viewModel.people[indexPath.row]
       if let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
          detailsVC.selectedName = person1.name
          detailsVC.selectedId = "\(person1.id)"
          detailsVC.selectedUsername = person1.username
          detailsVC.selectedEmail = person1.email
           
            self.present(detailsVC, animated: true)
        }
        print("you tapped me")
    }
   
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if(searchController.isActive)
        {
            return viewModel.filteredPerson.count
            
        }
        return viewModel.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell",
                                                 for: indexPath) as! PersonCell
        
        let person1: Person!
        
        if(searchController.isActive)
        {
            person1 = viewModel.filteredPerson[indexPath.row]


        }
        else{
            person1 = viewModel.people[indexPath.row]
        }
        
        cell.configureCell(person: person1)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "People List  Section: \(section)"
    }
}


