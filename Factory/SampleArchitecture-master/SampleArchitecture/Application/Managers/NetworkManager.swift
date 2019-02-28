
import Foundation

/// Mimics a network manager. Makes a "network" request and returns an array of objects.
class NetworkManager: NSObject {
    func fetchMessages(handler: ([Message])->()) {
        let messages = [Message(with: "ONE"), Message(with: "TWO"), Message(with: "THREE"), Message(with: "4"), Message(with: "5"), Message(with: "6")]
        handler(messages)
    }
}
