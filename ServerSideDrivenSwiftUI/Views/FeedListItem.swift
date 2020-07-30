//
//  FeedListItem.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/30/20.
//

import Foundation
import SwiftUI


struct FeedListItem: IdentifiableDecodableView {
    
    var id: UUID? = UUID()
    let blogInfo: TextSubtitle
    let blogCover: ImageCover
    var type: UIType? = .listItem

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
