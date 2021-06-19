//
//  NetworksOverviewView.swift
//  danshou (iOS)
//
//  Created by skg on 6/15/21.
//

import SwiftUI

struct NetworksOverviewView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var networkModels: [NetworkModel]
    
    // fetch networks from CoreData here or something, they will be fed in like so
    var networks: [NetworkModel] = [
        NetworkModel(name: "testNetwork1", entries: [
            NetworkEntry(name: "#testChannel", type: .channel, unreadCount: 10, connected: true, hasPing: false),
            NetworkEntry(name: "#testChannel1", type: .channel, unreadCount: 123, connected: true, hasPing: true),
            NetworkEntry(name: "#testChannel2", type: .channel, unreadCount: 3, connected: true, hasPing: false),
            NetworkEntry(name: "testUser", type: .user, unreadCount: 2, connected: true, hasPing: false)
        ], collapsed: false),
        NetworkModel(name: "testNetwork2", entries: [
            NetworkEntry(name: "#testChannel", type: .channel, unreadCount: 10, connected: true, hasPing: false),
            NetworkEntry(name: "#testChannel1", type: .channel, unreadCount: 123, connected: true, hasPing: true),
            NetworkEntry(name: "#testChannel2", type: .channel, unreadCount: 3, connected: true, hasPing: false),
            NetworkEntry(name: "testUser", type: .user, unreadCount: 2, connected: true, hasPing: false)
        ], collapsed: true),
        NetworkModel(name: "testNetwork3", entries: [
            NetworkEntry(name: "#testChannel", type: .channel, unreadCount: 10, connected: true, hasPing: false),
            NetworkEntry(name: "#testChannel1", type: .channel, unreadCount: 123, connected: true, hasPing: true),
            NetworkEntry(name: "#testChannel2", type: .channel, unreadCount: 3, connected: true, hasPing: false),
            NetworkEntry(name: "testUser", type: .user, unreadCount: 2, connected: true, hasPing: false)
        ], collapsed: false),
    ]
    
    var body: some View {
            List {
                ForEach(networks) { network in
                        NetworkView(networkModel: network)
                }
        }
    }
}

struct NetworksOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        NetworksOverviewView()
    }
}
