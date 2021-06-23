//
//  SettingsView.swift
//  danshou (iOS)
//
//  Created by skg on 6/16/21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
      
      var body: some View {
          NavigationView {
              Text("Sheet View content")
              .navigationBarTitle(Text("Settings"), displayMode: .inline)
                  .navigationBarItems(trailing: Button(action: {
                      print("Dismissing sheet view...")
                      presentationMode.wrappedValue.dismiss()
                  }) {
                      Image(systemName: "xmark.circle.fill").foregroundColor(Color.secondary)
                  })
          }
      }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
