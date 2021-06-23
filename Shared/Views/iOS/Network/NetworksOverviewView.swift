//
//  NetworksOverviewView.swift
//  danshou (iOS)
//
//  Created by skg on 6/15/21.
//

import SwiftUI

struct NetworksOverviewView: View {
    @Environment(\.presentationMode) var presentationMode
    // fetch networks from CoreData here or something, they will be fed in like so
    
    private var userNetworks: UserNetworks = UserNetworks.init()

    var networks: [NetworkModel] {
        var networksToShow: [NetworkModel] = []
        for network in userNetworks.networks {
            var incomingNetwork: NetworkModel = NetworkModel()
            for (networkId, networkProperties) in network {
                /* network properties to set
                 - name
                 - entries (for loop)
                 - collapsed
                 - address
                 - port
                 - secureConnection
                 - autoconnect
                 - nickname
                 - username
                 - realname
                 - waitForAuth
                 */
                
                // name
                incomingNetwork.id = UUID(uuidString: networkId) ?? UUID()
                
                incomingNetwork.name = networkProperties["name"] as? String ?? "Probem"
                
                incomingNetwork.address = networkProperties["address"] as? String ?? "wtf"
                
                incomingNetwork.port = networkProperties["port"] as? String ?? "6667"
                
                incomingNetwork.secureConnection = networkProperties["secureConnection"] as? Bool ?? true
                
                incomingNetwork.serverPassword = "TODO"
                
                incomingNetwork.userPassword = "TODO"
                
                incomingNetwork.autoconnect = networkProperties["autoconnect"] as? Bool ?? true
                
                incomingNetwork.nickname = networkProperties["nickname"] as? String ?? "WTAF"
                
                incomingNetwork.username = networkProperties["username"] as? String ?? "danshou"
                
                incomingNetwork.realName = networkProperties["realName"] as? String ?? "John Doe"
                
                incomingNetwork.waitForAuth = networkProperties["waitForAuth"] as? Bool ?? true
                
                incomingNetwork.entries = []
            }
            networksToShow.append(incomingNetwork)
        }
        return networksToShow
    }
    
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
