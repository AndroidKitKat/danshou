//
//  NetworkEntryModel.swift
//  danshou (iOS)
//
//  Created by skg on 6/15/21.
//

import Foundation

struct NetworkEntry: Identifiable {
    var id = UUID()
    let name: String
    let type: NetworkEntryType
    var unreadCount: Int
    var connected: Bool
    var hasPing: Bool
}


enum NetworkEntryType {
    case channel, user
}
