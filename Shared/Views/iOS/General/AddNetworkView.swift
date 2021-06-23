//
//  AddNetworkView.swift
//  danshou (iOS)
//
//  Created by skg on 6/16/21.
//

import SwiftUI

struct AddNetworkView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userNetworks: UserNetworks = UserNetworks.init()
    
    // Network Information
    @State private var newNetworkName: String = "" // required
    @State private var newNetworkAddress: String = "" // required
    @State private var newNetworkPort: String = "" // default value 6667 or 6697
    @State private var newNetworkUseSSL: Bool = true
    @State private var newNetworkPassword: String = "" // not required
    @State private var newNetworkAutoconnect: Bool = true
    
    // Identity Information
    @State private var newNetworkNick: String = ""
    @State private var newNetworkUsername: String = ""
    @State private var newNetworkRealName: String = ""
    @State private var newNetworkPersonalPassword: String = ""
    @State private var newNetworkWaitForAuth: Bool = false
    
    var saveDisabled: Bool {
        return newNetworkName.isEmpty || newNetworkAddress.isEmpty
    }
    
    var serverPort: String {
        return newNetworkUseSSL ? "6697" : "6667"
    }
    
    var randomNickname: String {
        return "Guest" + String(Int.random(in: 0...1000))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        TextField("Cool IRC Network", text: $newNetworkName)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Address")
                        Spacer()
                        TextField("irc.example.com", text: $newNetworkAddress)
                            .multilineTextAlignment(.trailing)
                            .autocapitalization(.none)
                    }
                    HStack {
                        Text("Port")
                        Spacer()
                        TextField("\(serverPort)", text: $newNetworkPort)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    Toggle("Secure Connection", isOn: $newNetworkUseSSL)
                    HStack {
                        Text("Password")
                        Spacer()
                        SecureField("p4ssw0rd", text: $newNetworkPassword)
                            .multilineTextAlignment(.trailing)
                            .autocapitalization(.none)
                    }
                    Toggle("Autoconnect", isOn: $newNetworkAutoconnect)
                }
                Section(header: Text("Identity"), footer: Text("Danshou will wait for NickServ or SASL authentication before joining channels")) {
                    HStack {
                        Text("Nickname")
                        Spacer()
                        TextField("\(randomNickname)", text: $newNetworkNick)
                            .multilineTextAlignment(.trailing)
                            .autocapitalization(.none
                            )
                    }
                    HStack {
                        Text("Username")
                        Spacer()
                        TextField("danshou", text: $newNetworkUsername)
                            .multilineTextAlignment(.trailing)
                            .autocapitalization(.none)
                    }
                    HStack {
                        Text("Real name")
                        Spacer()
                        TextField("Danshou User", text: $newNetworkRealName)
                            .multilineTextAlignment(.trailing)
                            .autocapitalization(.words)
                    }
                    HStack {
                        Text("Password")
                        Spacer()
                        SecureField("NickServ or SASL", text: $newNetworkPersonalPassword)
                            .multilineTextAlignment(.trailing)
                            .autocapitalization(.none)
                    }
                    Toggle("Wait for authentication", isOn: $newNetworkWaitForAuth)
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
                .navigationBarTitle("Add network...", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                })
                .navigationBarItems(trailing: Button(action: {
                    print("save network")
                    createNewNetwork()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "checkmark.circle.fill")
                }
                                        .disabled(saveDisabled))
        }
    }
    
    private func createNewNetwork() {
        let networkName = newNetworkName
        let networkAddress = newNetworkAddress
        let networkPort = newNetworkPort.isEmpty ? serverPort : newNetworkPort
        let useSSL = newNetworkUseSSL
        let networkPassword = newNetworkPassword
        let autoconnect = newNetworkAutoconnect
        let nickname = newNetworkNick.isEmpty ? randomNickname : newNetworkNick
        let username = newNetworkUsername.isEmpty ? "danshou" : newNetworkUsername
        let realName = newNetworkRealName.isEmpty ? "Danshou User" : newNetworkRealName
        let userPassword = newNetworkPersonalPassword
        let waitForAuth = newNetworkWaitForAuth
        
        let newNetwork = NetworkModel(name: networkName, address: networkAddress, port: networkPort, secureConnection: useSSL, serverPassword: networkPassword, autoconnect: autoconnect, nickname: nickname, username: username, realName: realName, userPassword: userPassword, waitForAuth: waitForAuth)
        
        userNetworks.networks.append(networkModelToDict(newNetwork))
    }
}
