
import Foundation

/// Mimics a network manager. Makes a "network" request and returns an array of objects.
class NetworkManager: NSObject {
    func fetchMessages(handler: ([Message])->()) {
        let messages = [Message(with: "ONE", and: "SUBTEXT"),
                        Message(with: "TWO", and: "SUBTEXT"),
                        Message(with: "THREE", and: "SUBTEXT"),
                        Message(with: "FOUR", and: "SUBTEXT"),
                        Message(with: "FIVE", and: "SUBTEXT"),
                        Message(with: "SIX", and: "SUBTEXT")]
        handler(messages)
    }
}
