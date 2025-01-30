//
//  DetailViewController.swift
//  MVVM Structure
//
//  Created by Arham MAC on 03/02/2025.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailName: UILabel!
    @IBOutlet var detailUsername: UILabel!
    @IBOutlet var detailId: UILabel!
    @IBOutlet var detailEmail: UILabel!
    
    var selectedName = String()
    var selectedId = String()
    var selectedUsername = String()
    var selectedEmail = String()
    
//    init(detailName: UILabel!, detailUsername: UILabel!, detailId: UILabel!, detailEmail: UILabel!, selectedName: String? = nil, selectedId: String? = nil, selectedUsername: String? = nil, selectedEmail: String? = nil) {
//        self.detailName = detailName
//        self.detailUsername = detailUsername
//        self.detailId = detailId
//        self.detailEmail = detailEmail
//        
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func viewDidLoad() {
        detailName.text = "\(selectedName)"
        detailId.text = "\(selectedId)"
        detailUsername.text = "\(selectedUsername)"
        detailEmail.text = "\(selectedEmail)"
        super.viewDidLoad()
    }
}
