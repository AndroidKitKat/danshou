//
//  NetworkModel.swift
//  danshou (iOS)
//
//  Created by skg on 6/15/21.
//

import Foundation
import Combine

class NetworkModel: ObservableObject, Identifiable {
    
    @Published var id: UUID
    @Published var name: String
    @Published var entries: [NetworkEntry]
    @Published var collapsed: Bool = false
    @Published var address: String
    @Published var port: String
    @Published var secureConnection: Bool
    @Published var serverPassword: String
    @Published var autoconnect: Bool
    @Published var nickname: String
    @Published var username: String
    @Published var realName: String
    @Published var userPassword: String
    @Published var waitForAuth: Bool
    
    init(id: UUID = UUID(), name: String = "", entries: [NetworkEntry] = [], address: String = "", port: String = "", secureConnection: Bool = false, serverPassword: String = "", autoconnect: Bool = false, nickname: String = "", username: String = "", realName: String = "", userPassword: String = "", waitForAuth: Bool = false) {
        self.id = id
        self.name = name
        self.entries = entries
        self.address = address
        self.port = port
        self.secureConnection = secureConnection
        self.serverPassword = serverPassword
        self.autoconnect = autoconnect
        self.nickname = nickname
        self.username = username
        self.realName = realName
        self.userPassword = userPassword
        self.waitForAuth = waitForAuth
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

func networkEntryToDict(_ entry: NetworkEntry) -> [String: AnyObject] {
    var entryDict: [String: AnyObject] = [:]
    entryDict["uniqueIdentifier"] = entry.id.uuidString as AnyObject
    entryDict["name"] = entry.name as AnyObject
    return entryDict
}

func networkModelToDict(_ model: NetworkModel) -> [String: AnyObject] {
    var modelDict: [String: AnyObject] = [:]
    modelDict["uniqueIdentifier"] = model.id.uuidString as AnyObject
    modelDict["name"] = model.name as AnyObject
    modelDict["entries"] = model.entries.map { networkEntryToDict($0) } as AnyObject
    modelDict["collapsed"] = model.collapsed as AnyObject
    modelDict["address"] = model.address as AnyObject
    modelDict["port"] = model.port as AnyObject
    modelDict["secureConnection"] = model.secureConnection as AnyObject
    // server password doo-dad here
    modelDict["autoconnect"] = model.autoconnect as AnyObject
    modelDict["nickname"] = model.nickname as AnyObject
    modelDict["username"] = model.username as AnyObject
    modelDict["realName"] = model.realName as AnyObject
    modelDict["waitForAuth"] = model.waitForAuth as AnyObject
    return modelDict
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
