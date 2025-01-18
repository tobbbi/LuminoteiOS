//
//  CreatePostViewModel.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 10.01.25.
//

import Firebase

class CreatePostViewModel: ObservableObject {
    func uploadPost(caption: String, energyLevel: Int, photo: UIImage?, location: String?, visibility: String, date: Date) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // Sicherstellen, dass photo nicht nil ist, bevor wir weiter arbeiten.
        let uploadedPhotoURL = try await ImageUploader.uploadImage(photo ?? UIImage()) ?? ""  // Falls nil, lege ein leeres String-Objekt an
        
        let timestamp = date == Date() ? Timestamp() : Timestamp(date: date)
        let post = Post(ownerUid: uid,
                        caption: caption,
                        energyLevel: energyLevel,
                        photo: uploadedPhotoURL.isEmpty ? nil : uploadedPhotoURL,  // Bild nur anzeigen, wenn es vorhanden ist
                        location: location,
                        visibility: visibility,
                        timestamp: timestamp,
                        likes: 0)
        try await PostService.uploadPost(post)
    }
}
