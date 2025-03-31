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
    case contact
    case gift
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
        .sections(type: .gift),
        .sections(type: .signOut)
    ]
    
    let model: [SectionsModel] = [
        .init(cell: .buttons, rows: []),
        .init(cell: .sections(type: .profile), rows:  [.init(title: "Profile details", imageName: "Profile"),
                                                       .init(title: "Address book", imageName: "Home"),
                                                       .init(title: "Payment methods", imageName: "Payment"),
                                                       .init(title: "Security and privacy", imageName: "Security"),
                                                       .init(title: "Notifications", imageName: "Notifications")]),
        .init(cell: .sections(type: .contact), rows: [.init(title: "FAQ", imageName: "FAQ"),
                                                      .init(title: "Contact preferences", imageName: "Contact")]),
        .init(cell: .sections(type: .gift), rows: [.init(title: "Gift cards & vouchers", imageName: "Gift"),
                                                   .init(title: "Rate this app", imageName: "Rate")]),
        .init(cell: .sections(type: .signOut), rows: [.init(title: "Sign out", imageName: "SignOut")])
    ]
}
