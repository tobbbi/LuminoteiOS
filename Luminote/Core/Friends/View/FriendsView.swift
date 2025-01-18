//
//  FriendsView.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 11.01.25.
//

import SwiftUI
import FirebaseFirestore

enum FriendsTab {
    case suggestions
    case friends
    case requests
}

struct FriendsView: View {
    @State private var selectedTab: FriendsTab = .suggestions
    @State private var users: [User] = []
    @State private var loading: Bool = true
    @State private var error: String?
    @State private var searchText: String = ""

    var filteredUsers: [User] {
        let filtered: [User]
        switch selectedTab {
        case .suggestions:
            filtered = users.filter { $0.isSuggested }
        case .friends:
            filtered = users.filter { $0.isFriend }
        case .requests:
            filtered = users.filter { $0.hasRequested }
        }
        // Anwenden der Suche
        if searchText.isEmpty {
            return filtered
        } else {
            return filtered.filter { $0.username.localizedCaseInsensitiveContains(searchText) || $0.fullname.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                // Tabs für Vorschläge, Freunde, Anfragen
                Picker("Tabs", selection: $selectedTab) {
                    Text("Vorschläge").tag(FriendsTab.suggestions)
                    Text("Meine Freunde").tag(FriendsTab.friends)
                    Text("Anfragen").tag(FriendsTab.requests)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Liste der Benutzer
                if loading {
                    ProgressView()
                } else if let error = error {
                    Text("Fehler: \(error)").foregroundColor(.red)
                } else {
                    List(filteredUsers) { user in
                        UserCell(user: user)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Friends")
            .searchable(text: $searchText, prompt: "Search")
            .task {
                await loadUsers()
            }
        }
    }

    func loadUsers() async {
        do {
            loading = true
            users = try await UserService.fetchUsers()
            loading = false
        } catch {
            self.error = "Fehler beim Laden der Benutzer."
            loading = false
        }
    }

    func handleAction(for user: User) {
        Task {
            switch selectedTab {
            case .suggestions:
                await sendFollowRequest(to: user)
            case .requests:
                await acceptFriendRequest(for: user)
            case .friends:
                // Für Freunde derzeit keine Aktion
                break
            }
        }
    }

    func sendFollowRequest(to user: User) async {
        do {
            let ref = Firestore.firestore().collection("users").document(user.id)
            try await ref.updateData(["hasRequested": true])
        } catch {
            print("Fehler beim Senden der Anfrage")
        }
    }

    func acceptFriendRequest(for user: User) async {
        do {
            let ref = Firestore.firestore().collection("users").document(user.id)
            try await ref.updateData(["isFriend": true, "hasRequested": false])
        } catch {
            print("Fehler beim Akzeptieren der Anfrage")
        }
    }
}


#Preview {
    FriendsView()
}
