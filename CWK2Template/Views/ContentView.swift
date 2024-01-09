//
//  ContentView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//


import SwiftUI

struct ContentView: View {
    @StateObject var networkMonitor = NetworkMonitor()
    @State var showingAlert : Bool = false
    
    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                if networkMonitor.dataLoaded {
                    // Display the loaded content
                    NavBar()
                } else {
                    // Show a loading indicator while data is being fetched
                    ProgressView()
                        .onAppear {
                            Task{
                                await networkMonitor.loadData()
                            }
                            
                        }
                }
            } else {
                Button(action: {
                    showingAlert = true
                }) {
                    Text("No Internet!")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Network Unavaiable"), message: Text("Please connect to the internet."), dismissButton: .default(Text("Okay")))
                }
                
            }
        }
    }
}
