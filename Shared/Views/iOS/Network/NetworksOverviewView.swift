//
//  NetworksOverviewView.swift
//  dansho (iOS)
//
//  Created by skg on 6/15/21.
//

import SwiftUI

struct NetworksOverviewView: View {
    
    var networks: [Network] = [
        Network(name: "testNetwork1", entries: [
            NetworkEntry(name: "#testChannel", type: .channel, unreadCount: 10, connected: true, hasPing: false),
            NetworkEntry(name: "#testChannel1", type: .channel, unreadCount: 123, connected: true, hasPing: true),
            NetworkEntry(name: "#testChannel2", type: .channel, unreadCount: 3, connected: true, hasPing: false),
            NetworkEntry(name: "testUser", type: .user, unreadCount: 2, connected: true, hasPing: false)
        ]),
        Network(name: "testNetwork2", entries: [
            NetworkEntry(name: "#testChannel", type: .channel, unreadCount: 10, connected: true, hasPing: false),
            NetworkEntry(name: "#testChannel1", type: .channel, unreadCount: 123, connected: true, hasPing: true),
            NetworkEntry(name: "#testChannel2", type: .channel, unreadCount: 3, connected: true, hasPing: false),
            NetworkEntry(name: "testUser", type: .user, unreadCount: 2, connected: true, hasPing: false)
        ]),
        Network(name: "testNetwork3", entries: [
            NetworkEntry(name: "#testChannel", type: .channel, unreadCount: 10, connected: true, hasPing: false),
            NetworkEntry(name: "#testChannel1", type: .channel, unreadCount: 1234, connected: true, hasPing: true),
            NetworkEntry(name: "#testChannel2", type: .channel, unreadCount: 3, connected: true, hasPing: false),
            NetworkEntry(name: "testUser", type: .user, unreadCount: 2, connected: true, hasPing: false)
        ]),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(networks) { network in
                        NetworkView(network: network)
                }
            }
            .navigationTitle(Text("Networks"))
            .navigationBarItems(leading: Button {} label: {
                Image(systemName: "gearshape.fill").foregroundColor(Color.accentColor)
            })
            .navigationBarItems(trailing: Button {} label: {
                Image(systemName: "plus").foregroundColor(Color.accentColor)
            })
        }
    }
}

struct NetworksOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        NetworksOverviewView()
    }
}
