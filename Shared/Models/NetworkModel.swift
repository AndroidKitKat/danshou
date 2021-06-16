//
//  NetworkModel.swift
//  dansho (iOS)
//
//  Created by skg on 6/15/21.
//

import Foundation

struct Network: Identifiable {
    let id = UUID()
    var name: String
    var entries: [NetworkEntry]
}
