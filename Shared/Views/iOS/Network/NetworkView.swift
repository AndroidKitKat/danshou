//
//  NetworksView.swift
//  dansho (iOS)
//
//  Created by skg on 6/15/21.
//

import SwiftUI

struct NetworkView: View {
    @State var network: Network
    var body: some View {
            Section(header: NetworkSectionHeaderView(network: network)) {
                ForEach(network.entries) { entry in
                    NetworkEntryView(type: entry.type, name: entry.name, unreadCount: entry.unreadCount, connected: entry.connected, hasPing: entry.hasPing)
                }
            }
    }
}

struct NetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkView(network: Network(name: "TestNetwork1", entries: []))
    }
}
