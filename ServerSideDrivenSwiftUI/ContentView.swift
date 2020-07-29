//
//  ContentView.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/26/20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var model = HomeViewUIModelProvider<BlogPosts>()
    var body: some View {
        model.content
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
