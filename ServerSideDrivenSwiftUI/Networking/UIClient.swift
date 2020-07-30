//
//  UIClient.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/29/20.
//

import Foundation
import Combine

final class UIClient: GenericAPI {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getBlogPost<T: DecodableView>() -> AnyPublisher<T, Error>  {
        
        let urlString = "https://run.mocky.io/v3/d2f73204-16e7-44ef-bfa8-de5f6a32ff53"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        return execute(request, decodingType: T.self)
//
//        let jsonData = BlogPayload.data(using: .utf8)!
//        let blogPost: T = try! JSONDecoder().decode(T.self, from: jsonData)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            // your code here
//            content(blogPost)
//        }
    }
}
