//
//  ServerSideDrivenSwiftUIApp.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/26/20.
//

import SwiftUI

@main
struct ServerSideDrivenSwiftUIApp: App {
    
    // MARK:- Providers
    @StateObject private var homeFeed = HomeFeedProvider<FeedList<FeedListItem>>()
    
    // MARK:- App Scene
    var body: some Scene {
        WindowGroup {
            homeFeed.content
        }
    }
}
