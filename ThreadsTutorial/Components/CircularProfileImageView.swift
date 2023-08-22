//
//  CircularProfileImageView.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/22.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("ironman")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
        
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView()
    }
}
