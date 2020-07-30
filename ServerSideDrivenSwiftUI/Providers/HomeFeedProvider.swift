//
//  HomeFeedProvider.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/26/20.
//

import Foundation
import Combine
import SwiftUI

/// **
///  Represents the view provider for every tab or root view.
///
/// */

final class HomeFeedProvider<Content: DecodableView>: ObservableObject {
    
    // MARK:- Subscribers
    private var cancellable: AnyCancellable?
    
    // MARK:- Publishers
    @Published var content: Content?

    // MARK:- Private properties
    private let client = UIClient()
    
    init() {
        cancellable = client.getBlogPost().sink(receiveCompletion: { published in
            dump(published)
        }, receiveValue: { post in
            self.content = post
        })
    }
}


