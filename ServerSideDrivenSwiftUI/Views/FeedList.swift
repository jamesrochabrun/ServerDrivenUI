//
//  FeedList.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/30/20.
//

import Foundation
import SwiftUI

struct FeedList<T: IdentifiableDecodableView>: DecodableView {
    
    //    var id: UUID? = UUID()
    let navigation: Bool
    var posts: [T]
    let type: UIType

    var body: some View {
        List(posts) { $0 }
        .ifConditional(navigation) { content in
            NavigationView { content }
        }
    }
}
