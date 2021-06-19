//
//  NetworksView.swift
//  danshou (iOS)
//
//  Created by skg on 6/15/21.
//

import SwiftUI

struct NetworkView: View {
//    @StateObject var networkModel: NetworkModel
//    @State var network: Network
    
    @StateObject var networkModel: NetworkModel
//    var network: Network {
//        return networkModel.network
//    }
//    @State var network: Network = networkModel.network
//    @State var network: Network
    var body: some View {
        Section(header: NetworkSectionHeaderView(network: networkModel)) {
            if !networkModel.collapsed {
                ForEach(networkModel.entries) { entry in
                        NetworkEntryView(type: entry.type, name: entry.name, unreadCount: entry.unreadCount, connected: entry.connected, hasPing: entry.hasPing)
                    }
            }
        }
    }
}
