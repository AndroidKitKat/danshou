//
//  ContentView.swift
//  Shared
//
//  Created by skg on 6/15/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentation
    
    @State var showingNewNetworkSheet = false
    @State var showingSettingsSheet = false
    @State var showingNewChannelSheet = false
    
    /* https://stackoverflow.com/a/60492031 */
    @State private var settingsButtonID = UUID()
    @State private var newNetworkButtonID = UUID()
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            NetworksOverviewView()
                .navigationTitle("Networks")
                .navigationBarItems(leading: Button {
                    showingSettingsSheet.toggle()
                } label: {
                    Image(systemName: "gearshape.fill").foregroundColor(Color.accentColor)
                }).id(settingsButtonID)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Menu {
                            Button(action: {
                                showingNewNetworkSheet.toggle()
                            }) {
                                Label("Add network", systemImage: "network")
                            }

                            Button(action: {
                                showingNewChannelSheet.toggle()
                            }) {
                                Label("Join channel", systemImage: "plus.message.fill")
                            }
                        }
                        label: {
                            Label("Add", systemImage: "plus")
                        }
                    }
                }.id(self.newNetworkButtonID)
//                .navigationBarItems(trailing: Button {
//                    showingNewNetworkSheet.toggle()
//                } label: {
//                    Image(systemName: "plus").foregroundColor(Color.accentColor)
//                }).id(self.newNetworkButtonID)
                .sheet(isPresented: $showingNewNetworkSheet, onDismiss: updateButtonIDs) {
                    AddNetworkView()
                }
                .sheet(isPresented: $showingSettingsSheet, onDismiss: updateButtonIDs) {
                    SettingsView()
                }
                .sheet(isPresented: $showingNewChannelSheet, onDismiss: updateButtonIDs) {
                    AddChannelView()
                }
        }.navigationViewStyle(StackNavigationViewStyle())
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
    }

    private
func updateButtonIDs() {
        newNetworkButtonID = UUID()
        settingsButtonID = UUID()
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
