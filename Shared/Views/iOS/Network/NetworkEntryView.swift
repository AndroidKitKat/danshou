//
//  NetworkEntryView.swift
//  dansho (iOS)
//
//  Created by skg on 6/15/21.
//

import SwiftUI

struct NetworkEntryView: View {
    let type: NetworkEntryType
    let name: String
    @State var unreadCount: Int
    @State var connected: Bool
    @State var hasPing: Bool
    
    var unreadCountColor: Color {
        if (hasPing) {
            return Color.green
        } else {
            return Color.gray
        }
    }
    
    var body: some View {
        HStack {
            switch type {
            case .channel:
                Image(systemName: "message.fill").imageScale(.small)
            case .user:
                Image(systemName: "person.fill")
            }
            Text("\(name)").frame(maxWidth: .infinity, alignment: .leading)
            if (unreadCount > 0) {
                Text("  \(unreadCount)  ")
                    .foregroundColor(Color.white)
                    .background(Capsule().fill(unreadCountColor))
            }
        }
    }
}

struct NetworkEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkEntryView(type: NetworkEntryType.channel, name: "#test", unreadCount: 10, connected: true, hasPing: true)
    }
}
