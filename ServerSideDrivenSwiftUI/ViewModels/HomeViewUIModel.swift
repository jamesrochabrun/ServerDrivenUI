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
    case table
}

struct ImageCover: DecodableView {
    
//    var id: UUID? = UUID()
    
    /// frame can be passes one level up
    let url: String
    let type: UIType
    
    var body: some View {
        Image(systemName: "pause.rectangle.fill")
            .resizable()
            .frame(width: 40.0, height: 40.0)
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
    
    /// only way to have uuid as default man
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

struct Feed<T: IdentifiableDecodableView>: DecodableView {
    
    //    var id: UUID? = UUID()
    let navigation: Bool
    var posts: [T]
    
    var body: some View {
        List(posts) { $0 }
        .ifConditional(navigation) { content in
            NavigationView { content }
        }
    }
}


struct ShadowModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}


/// understand ViewModifiers
/// understand function builders
