//
//  NetworkModel.swift
//  danshou (iOS)
//
//  Created by skg on 6/15/21.
//

import Foundation

class NetworkModel: ObservableObject, Identifiable {
    
    @Published var entries: [NetworkEntry]
    @Published var collapsed: Bool
    @Published var name: String
    
    init(id: UUID = UUID(), name: String, entries: [NetworkEntry] = [], collapsed: Bool = false) {
        self.name = name
        self.entries = entries
        self.collapsed = collapsed
    }
}

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


//struct Network: Identifiable {
//    let id = UUID()
//    
//    var entries: [NetworkEntry]
//    
////    init(name: String, entries: [NetworkEntry], collapsed: Bool) {
////        self.name = name
////        self.entries = entries
////        self.collapsed = collapsed
////    }
//}
