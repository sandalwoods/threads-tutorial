//
//  ContentView.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContenentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
