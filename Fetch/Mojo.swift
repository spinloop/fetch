import UIKit

class Mojo {
    var name: String
    var json: Dictionary<String, String>
    
    init?(name: String, json: Dictionary<String, String>) {
        self.name = name
        self.json = json

        if name.isEmpty {
            return nil
        }
    }
}
