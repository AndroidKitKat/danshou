//
//  AddNetworkView.swift
//  danshou (iOS)
//
//  Created by skg on 6/16/21.
//

import SwiftUI

struct AddNetworkView: View {
    @Environment(\.presentationMode) var presentationMode
      
      var body: some View {
        VStack(spacing: 50) {
          Text("Information view.")
            .font(.largeTitle)
          
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }, label: {
            Label("Close", systemImage: "xmark.circle")
          })
        }
      }
}
