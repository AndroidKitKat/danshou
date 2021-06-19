//
//  ChannelMessageView.swift
//  danshou (iOS)
//
//  Created by skg on 6/16/21.
//

import SwiftUI

struct ChannelMessageView: View {
    var body: some View {
        HStack {
            Text("[10:26:23]")
            Text("<testNickName>")
            Text("Message from user")
        }
    }
}

struct ChannelMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelMessageView()
    }
}
