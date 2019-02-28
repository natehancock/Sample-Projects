

import Foundation

struct Message: Codable {
    var text: String
    var subtext: String
    
    init(with text: String, and subtext: String) {
        self.text = text
        self.subtext = subtext
    }
}
