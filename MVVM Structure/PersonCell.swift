//
//  PersonCell.swift
//  TableView
//
//  Created by Arham MAC on 29/01/2025.
//

import UIKit

class PersonCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(person: Person){
        nameLabel.text = person.name
        ageLabel.text = person.username
        usernameLabel.text = "\(person.id)"
        emailLabel.text = person.email
    }
    
}
