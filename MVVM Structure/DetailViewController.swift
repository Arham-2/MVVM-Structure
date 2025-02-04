
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
 
    override func viewDidLoad() {
        detailName.text = "\(selectedName)"
        detailId.text = "\(selectedId)"
        detailUsername.text = "\(selectedUsername)"
        detailEmail.text = "\(selectedEmail)"
        super.viewDidLoad()
    }
}
