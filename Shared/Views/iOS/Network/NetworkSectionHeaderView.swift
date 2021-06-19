//
//  NetworkSectionHeaderView.swift
//  danshou (iOS)
//
//  Created by skg on 6/15/21.
//

import SwiftUI

struct NetworkSectionHeaderView: View {
    @StateObject var network: NetworkModel
    
    var dropDownAngle: Double {
        if network.collapsed {
            return 90
        } else {
            return 180
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "control").rotationEffect(Angle(degrees: dropDownAngle))
                .animation(Animation.linear(duration: 0.15))
                .onTapGesture {
                    network.collapsed.toggle()
                }
            Text(network.name).textCase(nil).onTapGesture {
                print("\(network.name) tapped")
            }
            Spacer()
            Image(systemName: "gearshape.fill").foregroundColor(Color.accentColor)
        }
    }
}
