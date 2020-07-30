//
//  UIClient.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/29/20.
//

import Foundation

final class UIClient: GenericAPI {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getBlogPost<T: DecodableView>() -> AnyPublisher<T, Error>  {
        
        let urlString = "https://run.mocky.io/v3/e2c21977-b893-42c0-9428-a6ac74e80e54"
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
