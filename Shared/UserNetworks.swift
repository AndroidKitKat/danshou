//
//  UserNetworks.swift
//  danshou (iOS)
//
//  Created by skg on 6/20/21.
//

import Foundation
import Combine

class UserNetworks: ObservableObject {
    @Published var networks: [[String: AnyObject]] {
        didSet {
            UserDefaults.standard.set(networks, forKey: "networks")
        }
    }
    
    init() {
        self.networks = UserDefaults.standard.object(forKey: "networks") as? [[String: AnyObject]] ?? [[:]]
        print(self.networks)
    }
}
