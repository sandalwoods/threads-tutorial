//
//  SettingsView.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/28.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .leading, spacing: 40) {
                    HStack {
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        
                        Text("Notification")
                    }
                    
                    HStack {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        
                        Text("Favorites")
                    }
                    
                    HStack {
                        Image(systemName: "lock")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        
                        Text("Privacy")
                    }
                    
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        
                        Text("Account")
                    }
                    
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        
                        Text("Support")
                    }
                    
                    HStack {
                        Image(systemName: "info.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        
                        Text("About")
                    }
                    
                    Divider()
                    
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Text("Logout")
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
