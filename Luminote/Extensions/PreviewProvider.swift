import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Peter Lustig", email: "peter@gmail.com", username: "peterlustig")
    
    // Initialisierung des Posts mit 'energyLevel', 'visibility' und anderen Werten
    let post = Post(
        ownerUid: "123",
        caption: "This is a test post",
        energyLevel: 5,               // Standardwert für Energielevel
        photo: nil,                   // Optional kein Bild
        location: "Berlin",           // Beispiel-Location
        visibility: "Meine Freunde",  // Beispiel-Visibility
        timestamp: Timestamp(),
        likes: 0
    )
}
