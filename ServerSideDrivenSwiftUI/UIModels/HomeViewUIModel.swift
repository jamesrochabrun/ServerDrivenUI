//
//  HomeViewUIModel.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/26/20.
//

import Foundation
import Combine
import SwiftUI

enum UIType: String, Decodable {
    case text
    case image
}

struct ImageCover: DecodableView {
    
//    var id: UUID? = UUID()
    let url: String
    let type: UIType
    
    var body: some View {
        Image(systemName: "pause.rectangle.fill")
    }
}

struct TextSubtitle: DecodableView {

//    var id: UUID? = UUID()
    let title: String
    let subTitle: String
    let type: UIType
    
    var body: some View {
        VStack {
            Text(title)
            Text(subTitle)
        }
    }
}

struct BlogPost: DecodableView, Identifiable {
    
    var id: UUID? = UUID()
    let blogInfo: TextSubtitle
    let blogCover: ImageCover

    private enum CodingKeys : String, CodingKey {
           case id, blogInfo, blogCover
       }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        blogInfo = try container.decode(TextSubtitle.self, forKey: .blogInfo)
        blogCover = try container.decode(ImageCover.self, forKey: .blogCover)
    }
    var body: some View {
        HStack {
           blogCover.foregroundColor(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)))
           blogInfo
       }
    }
}

struct BlogPosts: DecodableView {
    
    //    var id: UUID? = UUID()
    let navigation: Bool
    var posts: [BlogPost]
    
    var body: some View {
        List(posts) { $0 }
        .ifConditional(navigation) { content in
            NavigationView { content }
        }
    }
}

extension View {
   func ifConditional<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }
}

typealias DecodableView = View & Decodable


let BlogPayload = """
{
    "blogInfo": {
        "title": "Optionals in Swift explained: 5 things you should know",
        "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
        "type": "text"
    },
    "blogCover" : {
        "url": "",
        "type": "image"
    }
}
"""

let blogListPayload = """
{
    "navigation": true,
    "posts": [
                {
                    "blogInfo": {
                                "title": "Optionals 1",
                                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                                "type": "text"
                            },
                    "blogCover" : {
                                "url": "",
                                "type": "image"
                                }
                    },
                {
                    "blogInfo": {
                                "title": "Optionals 2",
                                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                                "type": "text"
                                },
                    "blogCover" : {
                                "url": "",
                                "type": "image"
                                }
                    },
                {
                    "blogInfo": {
                                "title": "Optionals 3",
                                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                                "type": "text"
                                },
                    "blogCover" : {
                                "url": "",
                                "type": "image"
                                }
                    },
                {
                    "blogInfo": {
                                "title": "Optionals 4",
                                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                                "type": "text"
                                },
                    "blogCover" : {
                                "url": "",
                                "type": "image"
                                }
                    },
                {
                    "blogInfo": {
                                "title": "Optionals 5",
                                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                                "type": "text"
                                },
                    "blogCover" : {
                                "url": "",
                                "type": "image"
                                }
                    },
                {
                    "blogInfo": {
                                "title": "Optionals 6",
                                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                                "type": "text"
                                },
                    "blogCover" : {
                                "url": "",
                                "type": "image"
                                }
                }
    ]
}
"""



final class UIClient: GenericAPI {
    
    let session: URLSession
    
    // 2
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




//@_functionBuilder
//struct ViewBuilder {
//    static func buildBlock(_ views: View...) -> CombinedView {
//        return CombinedView(views: views)
//    }
//}

/// understand ViewModifiers
/// understand function builders


let json = """
 {
    "type": "navigation",
    "views" :
    [
        {
            "type": "text",
            "tite": "Text One"
        },
        {
            "type": "text",
            "tite": "Text two"
        }
    ]
}
"""
