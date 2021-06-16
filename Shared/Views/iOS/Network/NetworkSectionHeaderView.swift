//
//  NetworkSectionHeaderView.swift
//  dansho (iOS)
//
//  Created by skg on 6/15/21.
//

import SwiftUI

struct NetworkSectionHeaderView: View {
    @State var network: Network
    var body: some View {
        HStack {
            Text(network.name).font(.subheadline).onTapGesture {
                print("\(network.name) tapped")
            }
            Spacer()
//            Image(systemName: "gearshape.circle.fill").foregroundColor(Color.blue).onTapGesture {
//                print("\(network.name) options button pushed")
//            }
        }
    }
}

struct NetworkSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkSectionHeaderView(network: Network(name: "Test", entries: []))
    }
}
