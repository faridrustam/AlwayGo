//
//  ProfileViewModel.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import Foundation

enum ProfileCells {
    case buttons
    case sections(type: Section)
}

enum Section {
    case profile
    case security
    case contact
    case rateApp
    case signOut
}

struct SectionsModel {
    let cell: ProfileCells
    let rows: [ProfileSettings]
}

struct ProfileSettings {
    let title: String
    let imageName: String
}

class ProfileViewModel {
    let cells: [ProfileCells] = [
        .buttons,
        .sections(type: .profile),
        .sections(type: .contact),
        .sections(type: .rateApp),
        .sections(type: .signOut)
    ]
    
    let model: [SectionsModel] = [
        .init(cell: .buttons, rows: []),
        .init(cell: .sections(type: .profile), rows:  [.init(title: "Profile details", imageName: "Profile"),
                                                       .init(title: "Security and privacy", imageName: "Security"),
                                                       .init(title: "Notifications", imageName: "Notifications")]),
        .init(cell: .sections(type: .contact), rows: [.init(title: "Contact preferences", imageName: "Contact")]),
        .init(cell: .sections(type: .rateApp), rows: [.init(title: "Rate this app", imageName: "Rate")]),
        .init(cell: .sections(type: .signOut), rows: [.init(title: "Sign out", imageName: "SignOut")])
    ]
}
