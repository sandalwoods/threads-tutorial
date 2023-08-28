//
//  ThreadCell.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/22.
//

import SwiftUI

struct ThreadCell: View {
    @StateObject private var viewModel: ThreadCellViewModel
    
    let thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        self._viewModel = StateObject(wrappedValue: ThreadCellViewModel(thread: thread))
    }
    
    private var didLiked: Bool {
        return viewModel.thread.didLiked ?? false
    }
    
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                                .font(.caption)
                                .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }

                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            if didLiked {
                                Task { try await viewModel.unlike() }
                            } else {
                                Task { try await viewModel.like() }
                            }                            
                        } label: {
                            Image(systemName: didLiked ? "heart.fill" : "heart")
                                .imageScale(.large)
                                .foregroundColor(didLiked ? .red : .black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.MOCK_THREAD)
    }
}
