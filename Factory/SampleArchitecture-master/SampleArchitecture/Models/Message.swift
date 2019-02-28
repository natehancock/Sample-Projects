

import Foundation

struct Message: Codable {
    var text: String
    
    init(with text: String) {
        self.text = text
    }
}
