//
//  HomeViewUIModelProvider.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/26/20.
//

import Foundation
import Combine
import SwiftUI


final class HomeViewUIModelProvider<T: DecodableView>: ObservableObject {
    
    // MARK:- Subscribers
  // 2
    private var cancellable: AnyCancellable?
    
    // MARK:- Publishers
  // 3
    @Published var content: T?

    // MARK:- Private properties
  // 4
    private let client = UIClient()
    
    init() {
      // 5
                
        cancellable = client.getBlogPost().sink(receiveCompletion: { published in
            dump(published)
        }, receiveValue: { post in
            self.content = post
        })
    }
}
