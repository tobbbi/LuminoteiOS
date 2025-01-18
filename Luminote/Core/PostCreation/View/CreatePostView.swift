//  PostCreationView.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 07.01.25.
//

import SwiftUI

struct CreatePostView: View {
    @StateObject var viewModel = CreatePostViewModel()
    @State private var caption = ""
    @State private var energyLevel: Double = 5
    @State private var selectedPhoto: UIImage? = nil
    @State private var enteredLocation: String = ""
    @State private var selectedVisibility: String = "Meine Freunde"
    @State private var selectedDate: Date = Date()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: UserService.shared.currentUser, size: .small)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(UserService.shared.currentUser?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Create Post ...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                // Energielevel Slider
                VStack(alignment: .leading) {
                    Text("Wie war Dein Energielevel heute? *")
                        .font(.headline)
                    Text("\(Int(energyLevel))")
                        .font(.subheadline)
                    Slider(value: $energyLevel, in: 1...10, step: 1)
                        .padding()
                        .accentColor(Color(hex: "#7EA398"))
                }
                
                // Foto hinzufügen
                Button("Foto hinzufügen") {
                    // Bild auswählen und speichern
                }
                
                // Ort Eingabefeld
                TextField("Ort", text: $enteredLocation)
                    .padding()
                    .border(Color.gray, width: 1)

                
                // Datum Picker kleiner und kompakt
                DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
                
                // Visibility Picker mit Label
                VStack(alignment: .leading, spacing: 4) {
                    Text("Wer darf Deinen Post sehen?")
                        .font(.headline)
                    Picker("Visibility", selection: $selectedVisibility) {
                        Text("Meine Freunde").tag("Meine Freunde")
                        Text("Enge Freunde").tag("Enge Freunde")
                        Text("Nur ich").tag("Nur ich")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.bottom, 20)  // Für genügend Abstand zum Button
                
                Spacer()
                
                Button("Posten") {
                    Task {
                        do {
                            try await viewModel.uploadPost(caption: caption,
                                                           energyLevel: Int(energyLevel),
                                                           photo: selectedPhoto,
                                                           location: enteredLocation.isEmpty ? nil : enteredLocation,
                                                           visibility: selectedVisibility,
                                                           date: selectedDate)
                            dismiss()
                        } catch {
                            print("Fehler beim Hochladen des Posts: \(error)")
                        }
                    }
                }
                .modifier(LuminoteButton1Modifier())
            }
            .padding()
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
