

import UIKit

protocol FirstMainViewControllerDelegate: class {
    func didSelectModel(model: Contact)
}

/// Example of local model 

class FirstMainViewController: UIViewController {
    
    weak var delegate: FirstMainViewControllerDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts = [Contact(firstName: "Jake", lastName: "Wagstaff"),
                    Contact(firstName: "Nathaniel", lastName: "Hancock"),
                    Contact(firstName: "Paul", lastName: "Rudd")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension FirstMainViewController: UITableViewDelegate, UITableViewDataSource {
    // Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        cell.configure(with: contacts[indexPath.row])
        return cell
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
