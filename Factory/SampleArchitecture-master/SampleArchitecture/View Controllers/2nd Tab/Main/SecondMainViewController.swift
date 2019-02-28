

import UIKit

protocol SecondMainViewControllerDelegate: class {
    func didSelectModel()
}

/// Logic Controller 

class SecondMainViewController: UIViewController {
    
    weak var delegate: SecondMainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        
        
        
    }
}
